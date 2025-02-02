set fish_greeting

export XDG_CONFIG_HOME="$HOME/.config"

function fish_prompt
    set_color green 
    echo -n "["(whoami)"@"(hostname)":"(prompt_pwd)"]\$ "
    set_color green 
end

## SSH
if not set -q SSH_AUTH_SOCK
    eval (ssh-agent -c) > /dev/null
end
