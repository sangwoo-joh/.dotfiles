export NVM_DIR="$HOME/.nvm"
if [[ $OSTYPE == 'darwin'* ]]; then
    [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
    [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
fi
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# INSTALLED_VERSION=$(nvm ls 16)
# if grep -q "16" <<< "$INSTALLED_VERSION";
# then
#     echo "Node 16 is already installed"
# else
#     echo "Install node 16"
#     nvm install 16
# fi
# CURRENT_VERSION=$(nvm current)
# if grep -q "16" <<< "$CURRENT_VERSION";
# then
#     echo "Node 16 is already set as current"
# else
#     echo "Set node 16 as current"
#     nvm use 16
# fi
