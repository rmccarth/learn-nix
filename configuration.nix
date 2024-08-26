{ config, lib, pkgs, ... }:

{
  imports = [
    # include NixOS-WSL modules
    <nixos-wsl/modules>
  ];

  wsl.enable = true;
  wsl.defaultUser = "builderbob";


  networking.hostName = "idkwtf-im-doing-nixos";

  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # services.xserver.libinput.enable = true;
  users.defaultUserShell = pkgs.zsh;
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.builderbob = {
    isNormalUser = true;
    description = "he builds terribly";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    #  binaryninja wut??
    ];
  };

  # Enable automatic login for the user.
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "builderbob";

  # Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  programs.firefox.enable = true;
  programs.nix-ld.enable = true;
  programs.nix-ld.package = pkgs.nix-ld-rs;
  programs.zsh = {
    enable = true;
    interactiveShellInit = 
      ''
        source "${pkgs.zsh-syntax-highlighting}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
        source "${pkgs.zsh-autosuggestions}/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
      '';
    ohMyZsh.enable = true;
    ohMyZsh.plugins = [ "git" ];
    ohMyZsh.theme = "sporty_256";
    ohMyZsh.customPkgs = [
      pkgs.zsh-autosuggestions
      pkgs.zsh-syntax-highlighting
    ];
  };
  programs.git = {
    enable = true;
    config = [{ 
      user = {
        name = "rmccarth";
        email = "rmccarth@alumni.cmu.edu";
      };
      init.defaultBranch = "main";
    }];
  };

  nix = {
  # automatically trigger garbage collection
  gc.automatic = true;
  gc.dates = "weekly";
  gc.options = "--delete-older-than 30d";
  # enable experimental features (needed for flakes)
  package = pkgs.nixFlakes;
  extraOptions = ''
  experimental-features = nix-command flakes
  '';
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    vim
    appgate-sdp
    chromium
    zsh
    zsh-autosuggestions
    zsh-syntax-highlighting
    tmux
    hexedit
    ghidra
    ida-free
    gdb
    pwndbg
    pwntools
    ghidra
    libreoffice
    git
    kubectl
    k9s
    awscli
    terraform
    jq
    yq
    go
    ytt
    fluxcd
    curl
    wget
    go
    exiftool 
    zip
    p7zip
    docker
    k3d
    skopeo
    nmap
  ];

  environment.variables = {
    DISPLAY = ":0";
    PAGER="less";
    EDITOR="vim";
  };

  # /etc/nixos is builderbob:users and is a git repository pointed to https://github.com/rmccarth/learn-nix.git
  environment.shellAliases = {
    k = "kubectl";
    e = "sudo vim /etc/nixos/configuration.nix";
    r = "sudo nixos-rebuild switch";
    watch = "watch ";
  };

  system.stateVersion = "24.05"; # Did you read the comment? nope

  # sudo chown builderbob:users -R /etc/nixos
  # ln -s /home/nixos/dev/play/learn-nix/configuration.nix /etc/nixos/configuration.nix
}

