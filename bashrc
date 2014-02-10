source $HOME/.aliases

bold='\['`tput bold`'\]'        ; [ $bold = '\[\]' ] && bold=
normal='\['`tput sgr0`'\]'       ; [ $normal = '\[\]' ] && normal=
green='\['`tput setaf 2`'\]'       ; [ $green = '\[\]' ] && green=
blue='\['`tput setaf 4`'\]'       ; [ $green = '\[\]' ] && green=

export PS1="$green\u$normal@$green\h$normal: $bold\w$normal\n$ "

