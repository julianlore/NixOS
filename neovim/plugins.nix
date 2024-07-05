{
  comment.enable = true;
  indent-blankline.enable = true;
  trim.enable = true;
  nvim-autopairs.enable = true;
  treesitter.enable = true;
  rainbow-delimiters.enable = true;
  lualine.enable = true;
  leap.enable = true;
  illuminate.enable = true;
  which-key.enable = true;

  telescope.enable = true;
  telescope.extensions.fzf-native.enable = true;

  cmp.enable = true;
  cmp-nvim-lsp.enable = true;

  lsp = {
    enable = true;
    servers = {
      nil-ls.enable = true;
    };
  };

  gitsigns.enable = true;
  lazygit.enable = true;
}
