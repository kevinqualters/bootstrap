{% from 'bootstrap/map.jinja' import bootstrap %}

Git pull down ohmyzsh:
  git.latest:
    - name: {{ bootstrap.ohmyzsh_repo }}
    - rev: master
    - target: {{ bootstrap.home }}/.oh-my-zsh
    - user: {{ bootstrap.user }}

Change {{ bootstrap.user }}'s shell to zsh:
  user.present:
    - name: {{ bootstrap.user }}
    - remove_groups: False
    - shell: /usr/bin/zsh

{% if grains['os_family'] == 'Debian' %}
Source profile to zshrc:
  cmd.run:
    - name: echo 'source /etc/profile' >> /etc/zsh/zprofile
    - unless: echo 'source /etc/profile' >> /etc/zsh/zprofile
{% endif %}
