# conditional rtags
if [ -d "$HOME/.dotfiles/rtags" ]; then
    export PATH=$PATH:"$HOME/.dotfiles/rtags/bin"
fi

# PATH
export GEM_HOME="$HOME/.gems"
export PATH="$HOME/.gems/bin":"$HOME/.local/bin":"$HOME/.emacs.d/bin":"$HOME/.rbenv/bin":$PATH

if [[ $OSTYPE == 'darwin'* ]]; then
    export PATH="/opt/homebrew/bin:$PATH"
fi

[[ -d "$HOME/.git-fuzzy/bin" ]] && export PATH=$PATH:"$HOME/.git-fuzzy/bin"
