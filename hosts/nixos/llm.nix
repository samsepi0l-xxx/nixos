{ config, username, pkgs, ... }:

{
  services.ollama.enable = true;
  services.ollama.loadModels = [ "llama3.2:3b" "smallthinker:3b" "nomic-embed-text" ];
  services.ollama.acceleration = false;
  
  environment.systemPackages = with pkgs; [
    oterm
    open-webui
    alpaca
    nextjs-ollama-llm-ui

    aichat
    aider-chat

    tgpt
    smartcat
  ];
}
