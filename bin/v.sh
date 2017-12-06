#!/usr/bin/env bash
if [ -n "$TMUX"  ]; then
  # we are in a tmux session...
  for i in  `tmux list-panes -a |cut -f 7 -d " "`
  do
    # loop through panes in active tmux session and find first active vim pane
    cmd="$(tmux display -p -t $i '#{pane_current_command}')" #look at this pane's running command
    cmd="$(basename "$cmd" | tr A-Z a-z)" #normalize basename and lowercase paranoid
    if [ "${cmd%m}" = "vi"  ]; then
      # We have found a pane with vim running lets send it to the pane with :e (change for split/buffer/tab)
      if [ "$#" -gt 0 ]; then
          #exit terminal mode in vim
          tmux send-keys -t $i C-\\ C-n
          for var in $@; do
              if [[ $var = /*  ]]; then
                  #path already looks absolute...
                  absfilepath="$var"
              else
                  #path not absolute,  lets prefix with pwd...
                  absfilepath="$PWD/${var#./}"
              fi
              # only sendkeys to vim if there were args (like a file name or path), if not we just change to the vim window/pane
              # use bash's printf to escape chars like vim likes.
              tmux send-keys -t $i ":tabnew $(printf "%q" "$absfilepath")" C-m
          done
      fi
      # lets make the tmux window that had the first vim pane active 
      tmux list-panes -a  -s |grep "$i" |cut -f2 -d: |xargs tmux select-window -t
      # lets make that pane in that window active.
      tmux select-pane -t $i
      # we are done, lets exit
      exit
    fi
  done

  # if we made it here,  we are running this command inside of tmux but found no vim running in panes 
  # and will just pass all to vim normally then exit.
  # this is useful if you want to place code here to force vim to start in a certain pane/window if it is the first run.
  vim $@
  exit
fi
# if we made it here,  we are running this command outside of tmux and will just pass all to vim normally.
vim $@