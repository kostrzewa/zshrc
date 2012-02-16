###
# colour table
#Color table from: http://www.understudy.net/custom.html
fg_black=%{$'\e[0;30m'%}
fg_red=%{$'\e[0;31m'%}
fg_green=%{$'\e[0;32m'%}
fg_brown=%{$'\e[0;33m'%}
fg_blue=%{$'\e[0;34m'%}
fg_purple=%{$'\e[0;35m'%}
fg_cyan=%{$'\e[0;36m'%}
fg_lgray=%{$'\e[0;37m'%}
fg_dgray=%{$'\e[1;30m'%}
fg_lred=%{$'\e[1;31m'%}
fg_lgreen=%{$'\e[1;32m'%}
fg_yellow=%{$'\e[1;33m'%}
fg_lblue=%{$'\e[1;34m'%}
fg_pink=%{$'\e[1;35m'%}
fg_lcyan=%{$'\e[1;36m'%}
fg_white=%{$'\e[1;37m'%}
#Text Background Colors
bg_red=%{$'\e[0;41m'%}
bg_green=%{$'\e[0;42m'%}
bg_brown=%{$'\e[0;43m'%}
bg_blue=%{$'\e[0;44m'%}
bg_purple=%{$'\e[0;45m'%}
bg_cyan=%{$'\e[0;46m'%}
bg_gray=%{$'\e[0;47m'%}
#Attributes
at_normal=%{$'\e[0m'%}
at_bold=%{$'\e[1m'%}
at_italics=%{$'\e[3m'%}
at_underl=%{$'\e[4m'%}
at_blink=%{$'\e[5m'%}
at_outline=%{$'\e[6m'%}
at_reverse=%{$'\e[7m'%}
at_nondisp=%{$'\e[8m'%}
at_strike=%{$'\e[9m'%}
at_boldoff=%{$'\e[22m'%}
at_italicsoff=%{$'\e[23m'%}
at_underloff=%{$'\e[24m'%}
at_blinkoff=%{$'\e[25m'%}
at_reverseoff=%{$'\e[27m'%}
at_strikeoff=%{$'\e[29m'%}

###
# history

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt hist_ignore_dups
setopt hist_expire_dups_first
setopt hist_find_no_dups

setopt autocd
bindkey -e
zstyle :compinstall filename '~/.zshrc'

LC_ALL=en_GB.UTF-8
export LC_ALL

bindkey "\e[3~" delete-char             # Delete

##
# make `ls' colorized:
  export LS_OPTIONS='--color=auto'
  eval "`dircolors`"

###
# autocompletion
autoload -Uz compinit
compinit
setopt autolist automenu

# menueselect at more than 5 choices
zstyle ':completion:*'               menu select=5

##
# globbing
setopt extended_glob

##
# print return code
setopt print_exit_value

###
# PATH
export PATH=$PATH:$HOME/local/bin

# git super status
source ~/.zsh/git-prompt/zshrc.sh

###
# prompt
autoload -U colors
colors

# titlebar
PR_TITLEBAR=$'%T%  %{\e]0;%(!.<* ROOT *> | .)%n@%m:%~ | %y\a%}'

# the prompt
PROMPT="\
$PR_TITLEBAR\
%{${fg_bold[green]}%}%n\
%{${fg_bold[blue]}%}@\
%{${fg_bold[green]}%}%m\
%{${fg_bold[blue]}%} %~% \
%{${at_normal}${fg_lgray}%}\$(git_super_status)\
%{${fg_bold[white]}%} $ \
%{${at_normal}${fg_lgray}%}"

##
# aliases
 alias ls='ls --color=auto $LS_OPTIONS'
 alias la='ls --color=auto $LS_OPTIONS -lah'
 alias ll='ls --color=auto $LS_OPTIONS -lh'
 alias l='ls --color=auto $LS_OPTIONS'

# alias to avoid making mistakes:
 alias rm='rm -iv'
 alias cp='cp -iv'
 alias mv='mv -iv'

# Nice aliases
 alias ps='ps aux'
 alias ipt='iptables -L'
 alias net='netstat -apt'
 alias ifc='ifconfig'
 alias df='df -h'
 alias du='du -sh'

#####
## pipe search through less
 search (){
 aptitude search ${1}|less;
}
 alias srch='search'
###
 alias reinst='aptitude reinstall'
 alias upd='aptitude update'
 alias upgrd='aptitude safe-upgrade'
 alias show='apt-get show'
 alias dist-upgrd='aptitude dist-upgrade'
 alias clean='apt-get clean'
 alias policy='apt-get policy'
