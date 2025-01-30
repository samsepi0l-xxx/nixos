{ config, username, pkgs, ... }:

{
  services.ollama.enable = true;
  services.ollama.loadModels = [ "deepseeker-r1" "llama3.2:3b" ];
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
