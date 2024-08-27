{ pkgs, plugin-telescope-recent-files, ... }:

{
  enable = true;
  defaultEditor = true;
  viAlias = true;
  vimAlias = true;
  opts = {
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

  globals.mapleader = " ";

  clipboard.providers.wl-copy.enable = true;
  colorschemes.tokyonight.enable = true;

  plugins = import ./plugins.nix;

  extraPlugins = (with pkgs.vimPlugins; [ remember-nvim legendary-nvim ]) ++ [
    (pkgs.vimUtils.buildVimPlugin {
      name = "telescope-recent-files";
      src = plugin-telescope-recent-files;
    })
  ];

  extraConfigLua = ''
    require('remember');
    require('legendary').setup(require('legendary-conf'));
    require('telescope').load_extension("recent_files");
  '';

  extraFiles = {
    "lua/legendary-conf/init.lua".source = ./lua/legendary-conf.lua;
  };
}
