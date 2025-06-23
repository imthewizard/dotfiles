# Functions
mkcd()
{
	mkdir -p -- "$1" &&
	   cd -P -- "$1"
}
##########

# Aliases
if [ -x "$(command -v lsd)" ]; then
	alias ls="lsd -a"
else
	alias ls="ls -al"
fi

if [ -x "$(command -v starship)" ]; then
	eval "$(starship init bash)"
fi
##########
