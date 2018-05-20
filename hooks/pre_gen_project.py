import sys

# Workaround while conditional prompt is released for cookiecutter
use_drifter = '{{ cookiecutter.use_drifter }}'
use_webpack = '{{ cookiecutter.use_webpack }}'

if use_webpack == 'y' and use_drifter != 'y':
    print('ERROR: Drifter is required in order to use the webpack role')
    sys.exit(1)
