{ ... }:
{

resource.proxmox_vm_qemu.demo3 = {
    
    # VM General Settings
    target_node = "pve1";
    # vmid = "111";
    name = "demo2-d1c4f";
    desc = "generated by NixOS";
    onboot = true;
    clone = "v0.0.0-23.05-d1c4fdea62c9d63ba7d903c3f581acc6c88d732f";
    agent = 1;
    cores   = 3;
    sockets = 1;
    memory  = 2560;
    cpu = "host";    
    qemu_os = "l26";

    # VM Network Settings
    network = {
        bridge = "vmbr0";
        model  = "virtio";
    };

    disk = {
        type         = "virtio";
        storage      = "local-lvm";
        size         = "5948M";
    };
    ci_wait = 60;
    # VM Cloud-Init Settings
    os_type = "cloud-init";
    cloudinit_cdrom_storage = "local-lvm";
    ipconfig0 = "ip=10.0.0.9/24,gw=10.0.0.1";
    # (Optional) IP Address and Gateway

    full_clone = true;
    
    # (Optional) Add your SSH KEY
    sshkeys = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJAGm66rJsr8vjRCYDkH4lEPncPq27o6BHzpmRmkzOiM";
};
}
