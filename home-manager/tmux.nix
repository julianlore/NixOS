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
    # Continuum must be last/after all status-right changes
    {
    plugin = continuum;
    extraConfig = "set -g @continuum-restore 'on'";
    }
  ];
}
