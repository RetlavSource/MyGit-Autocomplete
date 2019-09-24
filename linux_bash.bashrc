### Added PATHS
PATH=$PATH

# My aliases
alias lal='ls -al'

# Checks if the current directory have a git (.git) directory (is a git repository)
# If it is, then enables Git auto-complete and shows information about the current directory’s Git repository
# It has to be started from the directory where git repository is stored
git_current=$(pwd)
git_dir="/.git"
is_a_git=$git_current$git_dir
if [ -d "$is_a_git" ]; then

    # Added PATH to git related executable files
    PATH=$PATH:~/git_plugins/moreOnIt

    # Enables Git auto-complete
    if [ -f ~/git_plugins/git-completion.bash ]; then
        source ~/git_plugins/git-completion.bash
    fi

    # Show information about the current directory’s Git repository
    if [ -f ~/git_plugins/git-prompt.sh ]; then
        source ~/git_plugins/git-prompt.sh

	#Git shortcut info
	echo -e "\e[01;32m******************************\e[00m"
	echo -e "\e[01;32m* On a GIT REPOSITORY \e[00m: (\e[01;34mshortcuts info\e[00m)"
	echo -e "\e[01;32m*** \e[1;34muntracked files \e[0m(\e[31m%\e[0m)"
	echo -e "\e[01;32m*** \e[1;34munstaged \e[0m(\e[31m*\e[0m) and \e[1;34mstaged \e[0m(\e[32m+\e[0m)"
	echo -e "\e[01;32m*** \e[1;34msomething is stashed \e[0m(\e[31m$\e[0m)"
	echo -e "\e[01;32m*** \e[1;34mHEAD and upstream \e[0m- (\e[32m<\e[0m)behind  \e[0m(\e[32m>\e[0m)ahead  \e[0m(\e[32m<>\e[0m)diverged  \e[0m(\e[32m=\e[0m)no difference"
	echo -e "\e[01;32m******************************\e[00m"

        export GIT_PS1_SHOWDIRTYSTATE=1 # Shows unstaged (*) and staged (+)
        export GIT_PS1_SHOWSTASHSTATE=1 # Shows if something is stashed '$'
        export GIT_PS1_SHOWUNTRACKEDFILES=1 # Shows if there're untracked files '%'
        export GIT_PS1_SHOWUPSTREAM="auto" # Shows the difference between HEAD and its upstream.
	# "<" indicates you are behind,
    	# ">" indicates you are ahead, 
    	# "<>" indicates you have diverged and 
    	# "=" indicates that there is no difference.
        export GIT_PS1_SHOWCOLORHINTS=1 # If you would like a colored hint about the current dirty state
        # Show colours like original Ubuntu colours (see in this file)
        export PROMPT_COMMAND='__git_ps1 "${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]" "\\\$ "'
    fi
fi



