function reset_wal_wallpaper --description "Set wallpaper cached by wal"
  nitrogen --set-zoom-fill --head=0 $(cat $HOME/.cache/wal/wal)
  nitrogen --set-zoom-fill --head=1 $(cat $HOME/.cache/wal/wal)
end
