{ pkgs, ... }: {
  home.packages = with pkgs; [
    rose-pine-gtk-theme
    papirus-icon-theme  
  ];

  gtk = {
    enable = true;
    theme = {
      name = "rose-pine"; 
      package = pkgs.rose-pine-gtk-theme;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };
}
