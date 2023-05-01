{ pkgs, ... }: {
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
      dotnet-sdk_7
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
      python3Packages.virtualenv
      vscode
      shell_gpt
    ];

    programs.direnv = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      nix-direnv = {
        enable = true;
    };
      # Uncomment and set the path if you use fish shell
      # enableFishIntegration = true;
      # fishIntegrationPath = "/Users/rkommineni/.config/fish/conf.d/direnv.fish";
    };


    home.stateVersion = "22.05";
    programs.emacs = {
          enable = true;
          extraPackages = epkgs: [ epkgs.pdf-tools epkgs.org-pdftools ]; # non-trivial
    };
}
