{{ cookiecutter.project_name }}
=======

{% if cookiecutter.use_drifter == 'y' %}
Installation
------------

```
vagrant up
```

Then SSH into the box by running `vagrant ssh` and run:

```
{% if cookiecutter.use_webpack == 'y' %}
npm install
npm run build
{%- endif %}
./manage.py runserver
```

Then point your browser to http://{{ cookiecutter.project_slug }}.lo/.

{% if cookiecutter.use_webpack == 'y' %}
Front-end development
-------------
SSH into the box and run:
```
npm start
```

Then point your browser to http://{{ cookiecutter.project_slug }}.lo:3000/.

{% endif %}
{% endif %}
