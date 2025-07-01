# Functions
mkcd()
{
	mkdir -p -- "$1" &&
	   cd -P -- "$1"
}
##########

# Aliases
if [ -x "$(command -v lsd)" ]; then
	alias ls="lsd -a --group-directories-first"
	alias ll="lsd -al --group-directories-first"
else
	alias ls="ls -a --group-directories-first"
	alias ll="ls -al --group-directories-first"
fi
##########

# Prompt
export PS1='\[\e[32;1m\]\u@\h\[\e[0m\]:\[\e[36;1m\]\w\[\e[0m\]\$ '
##########

