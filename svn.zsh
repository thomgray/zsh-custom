export SVN_EDITOR=vim

alias svnu="svn up"
alias svnl="svn log | less"
alias svnlq="svn log | head -n 20"
alias svnco="svn checkout"
alias svncm="svn commit -m"
alias svnc="svn commit"

prompt_svn() {
    local rev branch
    if in_svn; then
        rev=$(svn_get_rev_nr)
        branch=$(svn_get_branch_name)
        if [ `svn_dirty_choose_pwd 1 0` -eq 1 ]; then
            prompt_segment yellow black
            echo -n "$rev@$branch"
            echo -n "±"
        else
            prompt_segment green black
            echo -n "$rev@$branch"
        fi
    fi
}

svns() {
  case "$1" in
    "" )
      svn status
      ;;
    "u" | "U" | "?" )
      svn status | grep --color=never "^?"
      ;;
    "a" | "A" )
      svn status | grep --color=never "^A"
      ;;
    "m" | "M" )
      svn status | grep --color=never "^M"
      ;;
    "d" | "D" )
      svn status | grep --color=never "^D"
      ;;
    "staged" | "s" | "S" )
      svn status | grep --color=never -v "^?"
      ;;
    * )
      echo "didn't recognise that command, use 'm', 'u|?', 'a', 'staged|s'"
  esac
}
