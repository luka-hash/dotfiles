function toUTF --description "Convert file from WINDOWS-1250 to UTF-8"
    iconv -f WINDOWS-1250 -t UTF-8 $argv[1] -o $arg[2]
    rm -i $argv[1]
end
