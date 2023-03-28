{ config, pkgs, ... }:
{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget

  system.defaults.NSGlobalDomain._HIHideMenuBar = false;

  system.defaults.dock.showhidden = false;

  system.defaults.finder.AppleShowAllExtensions = true;
  system.defaults.finder.QuitMenuItem = true;
  system.defaults.finder.FXEnableExtensionChangeWarning = false;

  system.defaults.trackpad.Clicking = true;
  system.defaults.trackpad.TrackpadThreeFingerDrag = true;

  system.keyboard.enableKeyMapping = true;
  system.keyboard.remapCapsLockToControl = true;

  imports = [ <home-manager/nix-darwin>  ];
  environment.systemPackages = with pkgs; [

      # direnv
      # entr
      # fzf
      # git
      # jq
      # ripgrep
      skhd
      # (let
      #   my-python-packages = python-packages: with python-packages; [
      #     python-lsp-server
      #     #other python packages you want
      #   ];
      #   python-with-my-packages = python3.withPackages my-python-packages;
      # in
      #   python-with-my-packages)

      # jdk8
    ];



  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  programs.zsh.enable = true;

  system.stateVersion = 4;
  services.skhd.enable = true;
  services.emacs.enable = true;
  # services.yabai.enable = true;
  # services.yabai.package = pkgs.yabai;

  users.users.rkommineni = {
    name = "Ravi";
    home = "/Users/rkommineni";
  };

  home-manager.users.rkommineni = {pkgs , ...}: {
    nixpkgs.config.allowUnfree = true;
    home.packages = with pkgs; [
      htop
      fzf
      git
      git-lfs
      awscli
      ripgrep
      jq
      entr
      rnix-lsp
      git-lfs
      jetbrains.rider
      jetbrains.idea-ultimate
      android-file-transfer
      dotnet-sdk
      mono
      kitty
      tmux
      zellij
      postman
      docker
      colima
      kubectl
      sbt
      python3Packages.cfn-lint
    ];
    home.stateVersion = "22.05";
    programs.emacs = {
          enable = true;
          extraPackages = epkgs: [ epkgs.pdf-tools epkgs.org-pdftools ]; # non-trivial
    };
  };
}
