{lib, ...}:
{
  options = {
    myoptions = {
        usingWayland = lib.mkOption {
        type = lib.types.bool;
        default = false;
      };
    };
  };
}
