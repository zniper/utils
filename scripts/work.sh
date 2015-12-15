#!/bin/bash
sudo service postgresql start
xfce4-terminal \
    --tab -T EDITOR -e 'env PROMPT_COMMAND="unset PROMPT_COMMAND; workon '${1}'; vim" bash' \
    --tab -T MC -e 'env PROMPT_COMMAND="unset PROMPT_COMMAND; workon '${1}'; mc" bash'
env PROMPT_COMMAND="workon '${1}'; r" bash
