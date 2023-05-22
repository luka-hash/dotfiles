// credits:
// https://forum.agreper.com/thread/10/

function download --description "Download a web page"
  if test $(count $argv) -ne 1
    echo "No URL provided"
  else
    wget --recursive --no-clobber --page-requisites --adjust-extension --convert-links --restrict-file-names=unix --domains $argv[1] --no-parent $argv[1]
  end
end
