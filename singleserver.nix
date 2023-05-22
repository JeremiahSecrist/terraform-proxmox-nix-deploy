{ ... }:
{

resource.proxmox_vm_qemu.your-vm = {
    
    # VM General Settings
    target_node = "pve1";
    vmid = "101";
    name = "vm-name";
    desc = "Description";

    # VM Advanced General Settings
    onboot = true;

    # VM OS Settings
    clone = "nixos-22.11.20230516.6c591e7";

    # VM System Settings
    agent = 1;
    
    # VM CPU Settings
    cores = 2;
    sockets = 1;
    cpu = "host";    
    
    # VM Memory Settings
    memory = 1024;

    # VM Network Settings
    network = {
        bridge = "vmbr0";
        model  = "virtio";
    };

    # VM Cloud-Init Settings
    os_type = "cloud-init";

    # (Optional) IP Address and Gateway
    # ipconfig0 = "ip=0.0.0.0/0,gw=0.0.0.0"
    
    # (Optional) Default User
    # ciuser = "your-username"
    
    # (Optional) Add your SSH KEY
    # sshkeys = <<EOF
    # #YOUR-PUBLIC-SSH-KEY
    # EOF
};
  
}
