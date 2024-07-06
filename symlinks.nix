{ config, osConfig, ... }:
let data-prefix = "data/home";
files = [
  ".config/syncthing"
];
# Lambda which takes a filename and returns an attribute set of name and value with the source being a symlink to the same file but inside the data-prefix
# i.e. sl test.txt => { name = "test.txt", value = { source = config.lib.file.mkOutOfStoreSymlink "/home/jl/data/home/test.txt" }; }
# When calling listToAttrs on a list of these attribute sets, we get an attribute set with home.file."${filename}".source = config.lib.file.mkOutOfStoreSymlink "/home/jl/data/${filename}"
sl = filename: {
  name = filename;
  value = {
    source = (config.lib.file.mkOutOfStoreSymlink (builtins.concatStringsSep "/" [osConfig.home-manager.users.jl.home.homeDirectory data-prefix filename]));
  };
}; in
{
  home.file = (builtins.listToAttrs (builtins.map sl files));
}
