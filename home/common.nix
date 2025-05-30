{ pkgs, lib, ... }:
{
    home.stateVersion = "24.05";
    
    home.packages = with pkgs; [
        home-manager
        vim
        cowsay
    ];
}