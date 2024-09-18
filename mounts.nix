{
  fileSystems."/Stacks" = {
    device = "/home/Stacks";
    options = [ "bind" "nofail" ];
  };
  fileSystems."/Data" = {
    device = "/home/Data";
    options = [ "bind" "nofail" ];
  };
}
