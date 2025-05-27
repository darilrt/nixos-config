{ pkgs, ... }:

{
  home.username = "daril";
  home.homeDirectory = "/home/daril";

  home.packages = with pkgs; [
    git 
  ]; 

  home.stateVersion = "24.05";
}
