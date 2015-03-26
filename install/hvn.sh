#!/usr/bin/env bash

msg() { echo "--- $@" 1>&2; }
detail() { echo "	$@" 1>&2; }
verlte() {
  [ "$1" = `echo -e "$1\n$2" | sort -t '.' -k 1,1n -k 2,2n -k 3,3n -k 4,4n | head -n1` ]
}

for i in ctags git ghc cabal make vim curl-config happy; do
  command -v $i >/dev/null
  if [ $? -ne 0 ] ; then
    msg "Installer requires ${i}. Please install $i and try again."
    exit 1
  fi
done

CABAL_VER=$(cabal --numeric-version)
VIM_VER=$(vim --version | sed -n 's/^.*IMproved \([^ ]*\).*$/\1/p')
GHC_VER=$(ghc --numeric-version)

if ! verlte '7.4' $VIM_VER ; then
  msg "Vim version 7.4 or later is required. Aborting."
  exit 1
fi

if ! verlte '1.18' $CABAL_VER ; then
  msg "Cabal version 1.18 or later is required. Aborting."
  exit 1
fi

if ! verlte '7.6.3' $GHC_VER ; then
  msg "GHC version 7.6.3 or later is required. Aborting."
  exit 1
fi

if ! ctags --version | grep -q "Exuberant" ; then
  msg "Requires exuberant ctags, not just ctags. Aborting."
  exit 1
fi

endpath="$HOME/.haskell-vim-now"

if [ ! -e $endpath/.git ]; then
  msg "Cloning begriffs/haskell-vim-now"
  git clone https://github.com/begriffs/haskell-vim-now.git $endpath
else
  msg "Existing installation detected"
  msg "Updating from begriffs/haskell-vim-now"
  cd $endpath && git pull
fi

msg "Updating cabal package list"
cabal update

msg "Installing git-hscope"
mkdir -p $endpath/bin
cp $endpath/git-hscope $endpath/bin

function build_shared_binary {
  pkg=$1
  constraint=$2

  if [ -e $endpath/bin/$pkg ]
  then
    msg "$pkg is already installed, skipping build"
    return
  fi

  dir=`mktemp -d /${TMPDIR:-/tmp}/build-XXXX`

  msg "Building $pkg (in $dir)"
  cd $dir
  cabal sandbox init
  cabal install -j --reorder-goals --disable-documentation --datadir=$endpath/data --force-reinstalls "${constraint:-$pkg}"

  msg "Saving $pkg binaries"
  cp .cabal-sandbox/bin/* $endpath/bin

  msg "Cleaning up"
  cd -
  rm -fr $dir
}

build_shared_binary "ghc-mod", "ghc-mod >= 4 && < 5"
build_shared_binary "hasktags"
build_shared_binary "codex"
build_shared_binary "hscope"
build_shared_binary "pointfree"
build_shared_binary "pointful"
build_shared_binary "hoogle"
#build_shared_binary "stylish-haskell"

msg "Building Hoogle database..."
$endpath/bin/hoogle data

msg "Setting git to use fully-pathed vim for messages..."
git config --global core.editor $(which vim)

msg "Configuring codex to search in sandboxes..."
cat > $HOME/.codex <<EOF
hackagePath: .cabal-sandbox/packages/
tagsFileHeader: false
tagsFileSorted: false
tagsCmd: hasktags --extendedctag --ignore-close-implementation --ctags --tags-absolute --output='\$TAGS' '\$SOURCES'
EOF
