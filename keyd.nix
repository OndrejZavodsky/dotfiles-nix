{ config, pkgs, ...}:

{
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
	}; 
}
