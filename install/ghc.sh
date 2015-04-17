set -o pipefail
eval "$( curl -sL https://github.com/mietek/halcyon/raw/master/setup.sh )"
halcyon install
halcyon install happy
