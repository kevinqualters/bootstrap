{% from "bootstrap/map.jinja" import config with context %}

include:
  - bootstrap.homeshick

{% for dir in ['.vim/bundle','.fonts','.fonts.conf.d'] %}
Create {{ dir }}:
  file.directory:
    - name: {{ config.home }}/{{ dir }}
    - user: {{ config.user }}
    - group: {{ config.group }}
    - makedirs: True
{% endfor %}

https://github.com/gmarik/Vundle.vim.git:
  git.latest:
    - target: {{ config.home }}/.vim/bundle/Vundle.vim
    - user: {{ config.user }}
    - rev: master

vim +PluginInstall +qall:
  cmd.run:
    - user: {{ config.user }}
    - env:
      - HOME: {{ config.home }}

fc-cache -vf:
  cmd.run

