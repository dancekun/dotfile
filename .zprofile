
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

if [ -f ~/.zshrc ] ; then
. ~/.zshrc
fi
