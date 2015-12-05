#! /bin/bash

if [ -z "$1" ]; then
    echo "Syntax: graph_models.sh <app(s)>"
fi

pip install pyparsing==1.5.7 pydot
python manage.py graph_models $1 -g -o models_graph.png

echo "Generated image: `pwd`/models_graph.png"

exit 0
