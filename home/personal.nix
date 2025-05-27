{ pkgs, lib, ... }:
let
  homename = "Personal";
  username = "daril";
in {
  home.stateVersion = "24.05";
  home.username = username;
  home.homeDirectory = "/home/${username}";

  home.packages = with pkgs; [
    home-manager
    vim 
    cowsay
  ];

  programs.home-manager.enable = true;
  
  programs.zsh = {
    enable = true;
    sessionVariables = {
      HOMENAME = homename;
    };
  };
  
  programs.git = {
    enable = true;
    userName = "Daril Rodriguez";
    userEmail = "darilrodriguez.2@gmail.com";
    package = pkgs.git;
  };
}
