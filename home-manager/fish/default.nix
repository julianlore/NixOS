{ pkgs, plugin-fish-abbreviation-tips, ... }:

{
  enable = true;
  functions = {
    n = {
      wraps = "nnn";
      description = "support nnn quit and change directory";
      body = ''
        # https://github.com/jarun/nnn/blob/master/misc/quitcd/quitcd.fish
        # Block nesting of nnn in subshells
        if test -n "$NNNLVL" -a "$NNNLVL" -ge 1
          echo "nnn is already running"
          return
        end

        # The behaviour is set to cd on quit (nnn checks if NNN_TMPFILE is set)
        # If NNN_TMPFILE is set to a custom path, it must be exported for nnn to
        # see. To cd on quit only on ^G, remove the "-x" from both lines below,
        # without changing the paths.
        if test -n "$XDG_CONFIG_HOME"
          set -x NNN_TMPFILE "$XDG_CONFIG_HOME/nnn/.lastd"
        else
          set -x NNN_TMPFILE "$HOME/.config/nnn/.lastd"
        end

        # The command function allows one to alias this function to `nnn` without
        # making an infinitely recursive alias
        command nnn $argv

        if test -e $NNN_TMPFILE
          source $NNN_TMPFILE
          rm -- $NNN_TMPFILE
        end
      '';
    };
  };
  shellAbbrs = import ./git.nix // {
    tideconf = ''
      tide configure \
        --auto \
        --style=Rainbow \
        --prompt_colors='True color' \
        --show_time='12-hour format' \
        --rainbow_prompt_separators=Vertical \
        --powerline_prompt_heads=Sharp \
        --powerline_prompt_tails=Flat \
        --powerline_prompt_style='Two lines, character' \
        --prompt_connection=Disconnected \
        --powerline_right_prompt_frame=No \
        --prompt_spacing=Compact \
        --icons='Many icons' \
        --transient=No
    '';
    # Copy last Defy backup
    cpdefy =
      "cp $(ls -1d $(ls -1d ~/Dygma/Backups/Defy/*)/* | tail -n1) ~/Defy/Defy.json";
  };
  plugins = map (n: {
    name = n;
    src = pkgs.fishPlugins.${n}.src;
  }) [ "done" "grc" "pisces" "sponge" "tide" "z" ] ++ [{
    name = "abbreviation-tips";
    src = plugin-fish-abbreviation-tips;
  }];
}
