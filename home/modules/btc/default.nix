{ pkgs, ... }: {
  home.packages = with pkgs; [  
    electrum
    tradingview
    bisq-desktop   
  ];
}