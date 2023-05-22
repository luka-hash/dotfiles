function uploadit --description "Upload file to 0x0.st and copy link"
    curl -s -F file=@$argv[1] -F expires=1 0x0.st | xsel -b
end
