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
    servers = { nixd.enable = true; };
  };

  lsp-format.enable = true;

  none-ls = {
    enable = true;
    sources.formatting = { nixfmt.enable = true; };
  };

  fugitive.enable = true;
  gitsigns.enable = true;
  lazygit.enable = true;
}
