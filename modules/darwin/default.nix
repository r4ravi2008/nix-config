{ pkgs, ... }:  {
  system.defaults.NSGlobalDomain._HIHideMenuBar = false;
  system.defaults.NSGlobalDomain.InitialKeyRepeat = 15;
  system.defaults.NSGlobalDomain.KeyRepeat = 3;

  system.defaults.dock.showhidden = false;

  system.defaults.finder.AppleShowAllExtensions = true;
  system.defaults.finder.QuitMenuItem = true;
  system.defaults.finder.FXEnableExtensionChangeWarning = false;

  system.defaults.trackpad.Clicking = true;
  system.defaults.trackpad.TrackpadThreeFingerDrag = true;

  system.keyboard.enableKeyMapping = true;
  system.keyboard.remapCapsLockToControl = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  environment.systemPackages = with pkgs; [
       skhd
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
}
