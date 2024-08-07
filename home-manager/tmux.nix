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
    plugin = cpu;
    # status-right must have variables before plugins are sourced
    extraConfig = ''
      set -g status-right '#{prefix_highlight} #{cpu_bg_color} CPU: #{cpu_icon} #{cpu_percentage} #{cpu_temp_icon} #{cpu_temp} RAM: #{ram_percentage} NET: #{net_speed} | %a %Y-%m-%d %H:%M'
    '';
    }
    net-speed
    prefix-highlight
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
