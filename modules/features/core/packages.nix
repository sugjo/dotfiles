{
  flake.modules.nixos.core =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        # Utils
        dua
        fd
        file
        git
        gh
        killall
        ncdu
        nfs-utils # Linux user-space NFS utilities
        ripgrep
        tmux
        tree
        wget
        p7zip
        comma

        # Network
        dig # Domain name server
        lsof

        # System monitor
        btop
        htop
        systemd-manager-tui
      ];
    };
}
