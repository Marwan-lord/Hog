{...}: {
  programs.foot.enable =  true;
  programs.foot.settings = {
    main = {
      # font  = "JetBrainsMono Nerd Font:size=14";
      shell = "nu";
      pad   = "15x15";
    };
    bell = {
      urgent = "no";
      notify = "no";
    };

    # colors = {
    #   alpha      = 1;
    #   background= "121212";
    #   foreground= "d0d0d0";

    #   regular0 = "121212"; 
    #   regular1 = "e06c75"; 
    #   regular2 = "98c379"; 
    #   regular3 = "e5c07b"; 
    #   regular4 = "61afef"; 
    #   regular5 = "c678dd"; 
    #   regular6 = "56b6c2"; 
    #   regular7 = "d0d0d0"; 


    #   bright0="666666";   
    #   bright1="ff7a85";   
    #   bright2="b5e890";   
    #   bright3="f5d78e";   
    #   bright4="7cc2ff";   
    #   bright5="d788ee";   
    #   bright6="66d6e3";   
    #   bright7="f0f0f0"; 


    #   flash      = "f6c177";     
     
    # };
  };
}
