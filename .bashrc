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
function _GIT_MODIFIED()
{
	local amount=$(git status -s -uno | wc -l)

	if [ "$amount" -eq 0 ]; then
		echo "✓ "
	else
		echo "${amount}*"
	fi	
}
function _GIT_BRANCH()
{
	local branch=$(git branch --show-current)
	echo -e "${branch} \ue0a0"
}
function _PARSE_GIT()
{	
	git status > /dev/null 2>&1 # returns error code if not in a git directory
	if [ $? -eq 0 ]; then
		echo "[$(_GIT_BRANCH) | $(_GIT_MODIFIED)]"
	fi
}
_RESET="\[\e[0m\]"
_GREEN="\[\e[38;5;154m\]"
_LIGHT_BLUE="\[\e[38;5;147m\]"
_YELLOW="\[\e[38;5;226m\]"

export PS1="┌[${_GREEN}\u${_RESET}][${_LIGHT_BLUE}\w${_RESET}]${_YELLOW}\$(_PARSE_GIT)${_RESET}\n└─\$ "
##########

