{ pkgs, ... }: {
  home.packages = with pkgs; [
    rose-pine-gtk-theme
    papirus-icon-theme  
  ];

  home.sessionVariables = {
    GTK_THEME = "rose-pine"; 
  };

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

    # ---- THE CATCH-ALL BASS-BACKGROUND OVERRIDE ----
    gtk3.extraCss = ''
      /* 1. Target the main window containers and fallback panels completely */
      window, 
      window *,
      box, 
      grid, 
      headerbar, 
      actionbar, 
      statusbar,
      searchbar,
      treeview {
        background-color: #191724;
        border-color: #26233a;
      }

      /* 2. Make sure the individual device rows retain visibility */
      treeview row, 
      treeview cell {
        background-color: #191724;
        color: #e0def4;
      }
      treeview:selected, 
      treeview row:selected {
        background-color: #2a283e;
        color: #e0def4;
      }

      /* 3. Protect interactive components (buttons/text input fields) so they don't look completely flat */
      button {
        background-color: #26233a;
        color: #e0def4;
        border: 1px solid #403d52;
      }
      button:hover {
        background-color: #31748f;
      }
      entry, textview {
        background-color: #26233a;
        color: #e0def4;
        border: 1px solid #403d52;
      }

      /* 4. Fix top menus and dropdown frames */
      menu, menuitem, popover {
        background-color: #1f1d2e;
        color: #e0def4;
      }
    '';
  };
}
