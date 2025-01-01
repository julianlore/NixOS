{
  comment.enable = true;
  indent-blankline.enable = true;
  trim.enable = true;
  nvim-autopairs.enable = true;
  treesitter.enable = true;
  treesitter.folding = false;
  rainbow-delimiters.enable = true;
  lualine.enable = true;
  leap.enable = true;
  illuminate.enable = true;
  which-key.enable = true;
  project-nvim.enable = true;
  dressing.enable = true;

  telescope.enable = true;
  telescope.extensions.fzf-native.enable = true;

  web-devicons.enable = true; # Required for telescope

  cmp.enable = true;
  cmp-nvim-lsp.enable = true;

  lsp = {
    enable = true;
    servers = {
      clangd.enable = true;
      nixd.enable = true;
    };
  };

  lsp-format.enable = true;

  none-ls = {
    enable = true;
    sources.formatting = { nixfmt.enable = true; };
  };

  qmk = {
    enable = true;
    settings = {
      name = "LAYOUT_split_3x5_3_ex2";
      layout = [
        "x x x x x x _ x x x x x x"
        "x x x x x x _ x x x x x x"
        "x x x x x _ _ _ x x x x x"
        "_ _ _ x x x _ x x x _ _ _"
      ];
    };
  };

  fugitive.enable = true;
  gitsigns.enable = true;
  lazygit.enable = true;
}
