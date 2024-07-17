{ tmuxPlugins, ... } :
{
  enable = true;
  newSession = true;
  prefix = "C-a";
  baseIndex = 1;
  mouse = true;

  plugins = with tmuxPlugins; [
    resurrect
    yank
    tokyo-night-tmux
    {
    plugin = tilish;
    extraConfig = ''
      set -g @tilish-easymode 'on'
    '';
    }
  ];
}
