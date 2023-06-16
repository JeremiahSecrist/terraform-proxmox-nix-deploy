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
    clone = "v0.0.0-23.05-fd88dc793254eab3036df022d360854419fc00c0";

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
        backup       = 0;
        cache        = "none";
        file         = "vm-101-disk-0";
        format       = "raw";
        iothread     = 0;
        mbps         = 0;
        mbps_rd      = 0;
        mbps_rd_max  = 0;
        mbps_wr      = 0;
        mbps_wr_max  = 0;
        replicate    = 0;
        size         = "2456M";
        slot         = 0;
        ssd          = 0;
        storage      = "local-lvm";
        # storage_type = "lvmthin";
        type         = "virtio";
        volume       = "local-lvm:vm-101-disk-0";
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
