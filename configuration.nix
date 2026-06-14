{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
		./desctop.nix
    ];
  nixpkgs.config.allowUnfree = true;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "onix"; # Define your hostname.

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Bratislava";
  services.udisks2.enable = true;
   
   hardware.bluetooth.enable = true;
	hardware.bluetooth.powerOnBoot = true;


  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  # Enable CUPS to print documents.
  # services.printing.enable = true;

   services.pipewire = {
     enable = true;
     pulse.enable = true;
   };

  services.libinput.enable = true;

  users.users.ondrejz = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      tree
		w3m
	 	ghostty
		discord
		keyd
	 	spotify
	 	yazi
	 	aerc
  	 	blueman
	 	pavucontrol
	 	networkmanagerapplet
    	fzf
    ];
  };
services.keyd = {
  enable = true;

  keyboards.default = {
    ids = [ "*" ];

    settings = {
	 	main = {
			capslock = "overload(control, esc)";
		};
      control = {
        j = "enter";
        h = "backspace";
      };
		alt = {
        j = "=";
        k = "-";
      };

      shiftalt = {
        j = "+";
        k = "_";
      };
    };
  };
};  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
	 killall
	 wget
	 curl
	 unzip
	 zip
	 gnutar
	 jq
	 file
	 eza
	 bat
	 btop
    git
    cmake
    brave
	 rustc
	 jdk21
	 cargo
	 clang
	 python3
	 gnum4
  ];
  fonts.packages = with pkgs; [
  	 nerd-fonts.jetbrains-mono
  ];
  nix.settings.experimental-features = ["nix-command" "flakes"];
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };


  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  system.stateVersion = "26.05"; 

}
