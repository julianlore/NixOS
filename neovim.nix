{ config, pkgs, ... }:

let
  nixvim = import (builtins.fetchGit {
    url = "https://github.com/nix-community/nixvim";
  });
in
{
  imports = [
    nixvim.homeManagerModules.nixvim
  ];

  programs.nixvim.enable = true;
  programs.nixvim.defaultEditor = true;
  programs.nixvim.viAlias = true;
  programs.nixvim.vimAlias = true;
  programs.nixvim.opts = {
    hlsearch = false;
    number = true;
    relativenumber = true;
    breakindent = true;
    undofile = true;
    mouse = "";
    # Case insensitive searching UNLESS /C or capital in search
    ignorecase = true;
    smartcase = true;
    termguicolors = true;
    tabstop = 2;
    shiftwidth = 2;
    # tab = spaces
    expandtab = true;
  };
}
