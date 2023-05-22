# not tested
function fish_remove_path --description 'Removes paths from the PATH if present'
	for path in $argv
		set -l p (builtin realpath -s -- $path 2>/dev/null)
		test -d "$p"; or continue
		if set -l index (contains -i $p $PATH)
            echo PATH[$index]
			set -e PATH[$index]
		end
	end
end
