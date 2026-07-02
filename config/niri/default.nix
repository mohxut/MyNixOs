{ config }:
let
  niri_dir = "${config.home.homeDierctory}/nano/config/niri";
in
{
  home.file.".config/niri/config.kdl".source =
    config.lib.file.mkOutOfStoreSymlink "${niri_dir}/config.kdl";
}
