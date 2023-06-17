{ ... }:
{

resource.proxmox_vm_qemu.demo2 = {
    
    # VM General Settings
    target_node = "pve1";
    vmid = "109";
    name = "demo2-d1c4f";
    desc = "Description";

    # VM Advanced General Settings
    onboot = true;

    # VM OS Settings
    clone = "v0.0.0-23.05-d1c4fdea62c9d63ba7d903c3f581acc6c88d732f";

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

    disk = {
      id           = 0;
      type         = "virtio";
      storage      = "local-lvm";
      storage_type = "lvm";
      size         = "4G";
      backup       = true;
    };

    # boot = "order=scsi0;virtio0";
    boot     = "cdn";
    cloudinit_cdrom_storage = "local-lvm";

    # VM Cloud-Init Settings
    os_type = "cloud-init";

    # (Optional) IP Address and Gateway
    ipconfig0 = "ip=10.0.0.4/24,gw=10.0.0.1";

    full_clone = true;

    # (Optional) Default User
    # ciuser = "";
    
    # (Optional) Add your SSH KEY
     sshkeys = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJAGm66rJsr8vjRCYDkH4lEPncPq27o6BHzpmRmkzOiM";
};
  
}
