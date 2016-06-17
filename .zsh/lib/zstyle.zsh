zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-dirs-first true
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' menu select=2
zstyle ':completion:*' my-accounts='m@japh.se'
zstyle ':completion:*' separate-sections 'yes'
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' use-perl=1
zstyle ':completion:*:(all-|)files' ignored-patterns '*.un~'
zstyle ':completion:*:(ssh|scp):*:hosts-domain' ignored-patterns '<->.<->.<->.<->' '^*.*' '*@*'
zstyle ':completion:*:(ssh|scp):*:hosts-host' ignored-patterns '*.*' loopback localhost
zstyle ':completion:*:(ssh|scp):*:hosts-ipaddr' ignored-patterns '^<->.<->.<->.<->' '127.0.0.<->'
zstyle ':completion:*:(ssh|scp):*:users' ignored-patterns adm bin daemon halt lp named shutdown sync
zstyle ':completion:*:*:(cd):*' completer _history
zstyle ':completion:*:*:(cd):*' file-sort access
zstyle ':completion:*:*:(cd):*' menu select
zstyle ':completion:*:*:(cd):*:*files' ignored-patterns '*~' file-sort access
zstyle ':completion:*:*:(scp):*' file-sort modification
zstyle ':completion:*:*:(vim|rview|vimdiff|xxd):*' file-sort modification
zstyle ':completion:*:*:(vim|rview|vimdiff|xxd):*' tag-order files
zstyle ':completion:*:*:(vim|rview|vimdiff|xxd):*:*files' ignored-patterns '*~|*.(old|bak|zwc|viminfo|rxvt-*|zcompdump)|pm_to_blib|cover_db|blib' file-sort modification
zstyle ':completion:*:*:apvlv:*' file-patterns '*.pdf'
zstyle ':completion:*:*:apvlv:*' tag-order files
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=36=31"
zstyle ':completion:*:*:mplayer:*' file-patterns '*.(rmvb|mkv|mpg|wmv|mpeg|avi|flv|mp3|mp4|flac|ogg):video' '*:all-files' '*(-/):directories'
zstyle ':completion:*:*:mplayer:*' tag-order files
zstyle ':completion:*:*:perl:*' file-patterns '*'
zstyle ':completion:*:cd:*' ignore-parents parent pwd
zstyle ':completion:*:corrections' format "%{$c3%}%d%{$reset_color%}"
zstyle ':completion:*:descriptions' format "%{$c1%}%d%{$reset_color%}"
zstyle ':completion:*:functions' ignored-patterns '_*'
zstyle ':completion:*:kill:*' force-list always
zstyle ':completion:*:messages' format "%{$c1%}%d%{$reset_color%}"
zstyle ':completion:*:processes' command 'ps -axw'
zstyle ':completion:*:processes-names' command 'ps -awxho command'
zstyle ':completion:*:scp:*' group-order users files all-files hosts-domain hosts-host hosts-ipaddr
zstyle ':completion:*:ssh:*' group-order hosts-domain hosts-host users hosts-ipaddr
zstyle ':completion:*:ssh:*' tag-order users 'hosts:-host hosts:-domain:domain hosts:-ipaddr:IP\ address *'
zstyle ':completion:*:warnings' format "%{$c1%}%d%{$reset_color%}"
zstyle ':completion:*:warnings' format $'%{No match for \e[38;5;240;1m%}%d%{\e[m%}'
zstyle ':completion::complete:*' cache-path ~/etc/cache/$HOST
zstyle ':completion::complete:*' use-cache on
zstyle ':completion:most-accessed-file:*' completer _files
zstyle ':completion:most-accessed-file:*' file-patterns '*:all\ files'
zstyle ':completion:most-accessed-file:*' file-sort access
zstyle ':completion:most-accessed-file:*' hidden all
zstyle ':completion:most-accessed-file:*' match-original both

## VCS
# vcs_info
zstyle ':vcs_info:*' enable git hg svn
# check-for-changes can be really slow.
# you should disable it, if you work with large repositories
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '%F{62}D%F{237}IRTY%f' # display ¹ if there are unstaged changes
zstyle ':vcs_info:*' stagedstr '%F{62}S%F{237}TAGED' # display ² if there are staged changes
zstyle ':vcs_info:*' actionformats "${FMT_BRANCH}${FMT_ACTION}" "${FMT_PATH}"
zstyle ':vcs_info:*' formats "${FMT_BRANCH}" "${FMT_PATH}"
zstyle ':vcs_info:*' nvcsformats "" "%~"


zstyle ':completion:*:*:*:users' ignored-patterns \
 adm amanda apache avahi beaglidx bin cacti canna clamav daemon \
 dbus distcache dovecot fax ftp games gdm gkrellmd gopher \
 hacluster haldaemon halt hsqldb ident junkbust ldap lp mail \
 mailman mailnull mldonkey mysql nagios \
 named netdump news nfsnobody nobody nscd ntp nut nx openvpn \
 operator pcap postfix postgres privoxy pulse pvm quagga radvd \
 rpc rpcuser rpm shutdown squid sshd sync uucp vcsa xfs
zstyle '*' single-ignored show
