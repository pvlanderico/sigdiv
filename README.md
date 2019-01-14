# SADP
Sistema de Análise da Dívida Pública. É uma iniciativa da prefeitura municipal de Niterói, através da Secretaria Municipal de Fazenda para desenvolver um sistema que controla as dívidas públicas de um município.



## Ferramentas
- [Scrum](https://www.scrum.org/) para planejamento e acompanhamento de atividades
- [Git](https://git-scm.com/) para gerenciamento de versão
- [Github](https://www.github.com) como repositório de arquivos
- [Waffle](https://www.wafle.io) para gerenciamento de atividades

Ubuntu 18.04
rbenv

sudo apt update
sudo apt install git curl libssl-dev libreadline-dev zlib1g-dev autoconf bison build-essential libyaml-dev libreadline-dev libncurses5-dev libffi-dev libgdbm-dev
nano ~/.bashrc

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

Ruby 2.5.3p105
rbenv install 2.5.3
rbenv global 2.5.3
git clone https://github.com/smfazendaniteroi/sadp.git
cd sadp

gem install bundler -v 1.17.1
bundle
rbenv rehash
nano config/settings.yml -> Pedir senha do ftp

Postgresql
apt get install postgresql
sudo -u postgres psql
create role sadp with createdb login password 'passwordDB';
rails db:create
rails db:migrate
rails s




git
Download do projeto
