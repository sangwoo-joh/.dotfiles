export NVM_DIR="$HOME/.nvm"

if [[ $OSTYPE == 'darwin'* ]]; then
    [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
    [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
fi
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

NODE_VERSION=19

INSTALLED_VERSION=$(nvm ls "$NODE_VERSION")
if grep -q "$NODE_VERSION" <<< "$INSTALLED_VERSION";
then
    echo "Node $NODE_VERSION is already installed"
else
    echo "Install node $NODE_VERSION"
    nvm install "$NODE_VERSION"
fi
CURRENT_VERSION=$(nvm current)
if grep -q "$NODE_VERSION" <<< "$CURRENT_VERSION";
then
    echo "Node $NODE_VERSION is already set as current"
else
    echo "Set node $NODE_VERSION as current"
    nvm use "$NODE_VERSION"
fi
