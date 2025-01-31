{ config, pkgs, home-manager, ... }:
{
  home.username = "robmccarthy";
  home.homeDirectory = "/Users/robmccarthy";

  home.stateVersion = "24.11";
  nixpkgs.config.allowUnfree = true;

  programs.home-manager.enable = true;

# home-manager switch -f ./home.nix
  home.packages = with pkgs; [
    _1password-cli
    awscli2
    bandit
    bat
    cargo
    cosign
    crane
    coreutils
    gawk
    gnused
    gnugrep
    gum
    cypress
    direnv
    eza
    fluxcd
    git
    gnumake
    gnupg
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
    kustomize
    kustomize-sops
    krew
    nix-index
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
    sops
    spotify
    sshuttle
    syft
    terraform
    terragrunt
    tflint
    tmux
    tree
    vendir
    vim
    vscode
    xcode-install
    yamllint
    ytt
    yq
    watch
    zarf

    # jiggler not in nixpkgs
    # mattermost-desktop wrong arch
  ];
}
