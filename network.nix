{ pkgs, ... }:

{

  networking.hostName = "onix"; 
  networking.networkmanager.enable = true;
  networking.modemmanager.enable = true;

  # Automate the USB mode-switch from CDC Ethernet to QMI mode at boot/plugin
  services.udev.extraRules = ''
    ACTION=="add", SUBSYSTEM=="usb", ATTR{idVendor}=="03f0", ATTR{idProduct}=="9d1d", RUN+="${pkgs.usb-modeswitch}/bin/usb_modeswitch -v 03f0 -p 9d1d -V 03f0 -P 9d1e -u 1"
  '';

  environment.shellAliases = {
    lte-on     = "nmcli connection up MyLTE";
    lte-off    = "nmcli connection down MyLTE";
    lte-status = "mmcli -m any";
  };

  environment.systemPackages = [
    pkgs.networkmanagerapplet
  ];
}
