function create_vm --description "Create VM using qemu"
    if test $(count $argv) -eq 1
        devour qemu-system-x86_64 -enable-kvm -m 2048 -nic user,model=virtio -drive file=$argv[1],media=disk,if=virtio -boot order=d -cpu host -smp 2 -display gtk
    end
end
