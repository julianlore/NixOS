{ pkgs, nixvim, nix-index-database, plugin-telescope-recent-files, plugin-fish-abbreviation-tips, ... }:

{
  imports =
    [
      nixvim.homeManagerModules.nixvim
      nix-index-database.hmModules.nix-index
      ./symlinks.nix
    ];

  home.username = "jl";
  home.homeDirectory = "/home/jl";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.05"; # Please read the comment before changing.

  home.packages = with pkgs; [
    tmux
    wl-clipboard
    nnn
    lazygit
    bitwarden
    syncthing
    cryptomator
    audacious
    firefox
    chromium
    signal-desktop
    bazecor
    libreoffice-qt6-fresh
    jellyfin-media-player
    grc
    ripgrep
    # Nonfree
    obsidian
  ];

  programs.nixvim = import ./neovim { pkgs = pkgs; plugin-telescope-recent-files = plugin-telescope-recent-files; };
  programs.fish = import ./fish { pkgs = pkgs; plugin-fish-abbreviation-tips = plugin-fish-abbreviation-tips; };

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/jl/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
    # Used by nh
    FLAKE = "$HOME/NixOS";
  };

  programs.tmux = import ./tmux.nix { tmuxPlugins = pkgs.tmuxPlugins; };
  programs.nix-index-database.comma.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
