{ pkgs, lib, ... }:
{
    home.packages = with pkgs; [
        cowsay
    ];
}