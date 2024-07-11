{ ... }:

{
  imports =
    [
      (
        # Put the most recent revision here:
        let revision = "2f9668e19aff06550cd154c87c0af120735a56a4"; in
        builtins.fetchTarball {
          url = "https://github.com/Jovian-Experiments/Jovian-NixOS/archive/${revision}.tar.gz";
          # Update the hash as needed:
          sha256 = "sha256:0gyn3g8ksiby8v992l7qrmvcw8la4lbai9dklx3wlfsmx0hv3i8w";
        } + "/modules"
      )
    ];

  jovian.devices.steamdeck.enableSoundSupport = true;
}
