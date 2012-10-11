function link_config {
  fn=$1; install_path=$2;
  if [ -e ".$fn" ]; then
    if [ -h ".$fn" ]; then
      echo "Deleting .$fn link.";
      rm ".$fn"
    else
      if [ -f ".$fn" ]; then
        echo "Backing up .$fn as .$fn.old";
        mv ".$fn" ".$fn.old"
      else
        echo ".$fn is not a normal file. Remove it or back it up and re-run"
        exit 1;
      fi
    fi
  fi
  ln -s "$install_path/../$fn" ".$fn"
}
