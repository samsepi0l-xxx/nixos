set fish_greeting

function fish_prompt
    set_color green 
    echo -n "["(whoami)"@"(hostname)":"(prompt_pwd)"]\$ "
    set_color green 
end

## SSH
if not set -q SSH_AUTH_SOCK
    eval (ssh-agent -c) > /dev/null
end

if not ssh-add -l | grep -q "$(cat ~/.ssh/github_samsepi0l.pub | awk '{print $2}')"
    ssh-add ~/.ssh/github_samsepi0l &> /dev/null
end
