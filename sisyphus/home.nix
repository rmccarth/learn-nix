{ config, pkgs, home-manager, ... }:
{
  home.username = "robmccarthy";
  home.homeDirectory = "/Users/robmccarthy";

  home.stateVersion = "24.11";
  nixpkgs.config.allowUnfree = true;

  programs.home-manager.enable = true;

# home-manager switch -f ./home.nix
  home.packages = with pkgs; [
    awscli2
    bandit
    cargo
    cosign
    coreutils
    crane
    cypress
    direnv
    fluxcd
    git
    gnumake
    go
    grype
    imgpkg
    iterm2
    istioctl
    jq
    k3d
    k9s
    kbld
    kubectl
    kubernetes-helm
    krew
    nmap
    nodejs_22
    openssl
    oras
    podman
    poetry
    python311Full
    rectangle
    ripgrep
    rustc
    semgrep
    shellcheck-minimal
    skopeo
    slack
    spotify
    syft
    terraform
    tflint
    tmux
    vendir
    vim
    vscode
    xcode-install
    yamllint
    ytt
    yq
    zarf

    # jiggler not in nixpkgs
    # mattermost-desktop wrong arch
  ];
}
