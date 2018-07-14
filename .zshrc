# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/home/josevictor/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="bullet-train"
ZSH_THEME="rainbow"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias docs="cd /home/josevictor/Documentos"
alias aprestart="sudo service apache2 restart"
alias lojas="cd /var/www/lojas"
alias modulos="cd /var/www/modulos"
alias back="cd /var/www/backups"
alias msql="mysql -u root -p"
alias cacheclr="sudo rm -r var/cache"
alias sessionclr="sudo rm -r var/session"
alias permvar="chmod -R 777 var/"
alias permedia="chmod -R 777 media/"
alias permreport="sudo chmod -R 777 var/report"
alias permall="sudo chmod -R 777 var/"
alias know="vi /home/josevictor/Documentos/knowledge/knowledge.wiki"
alias todo="vi /home/josevictor/Documentos/todo.wiki"
alias annot="vi /home/josevictor/Documentos/annotations.wiki"
alias freemem="sync; echo 2 | sudo tee /proc/sys/vm/drop_caches"
alias mailclr="sudo postsuper -d ALL"
alias wsdlclr="sudo rm -r /tmp/wsdl*"

l=/var/www/lojas
alias netrestart="sudo service network-manager restart"

fullclr() {
  cacheclr
  sessionclr
  aprestart
}

restoredb() {
  pv $1 | mysql -u root -pbis123 $2
}

mon() {
	xrandr --output DP-1-1 --brightness $1
}

mon1() {
	xrandr --output VGA-1 --brightness $1
}

createdb() {
  mysql -u root -pbis123 -e "create database $1"
}

dropdb() {
  mysql -u root -pbis123 -e "drop database $1"
}

showdbs() {
  mysql -u root -pbis123 -e "show databases"
}

gitpick_commit()
{
    git --git-dir=../../$1/.git format-patch -k -1 --stdout $2 | git am -3 -k --ignore-whitespace
}

gitpick_commit_noprevious()
{
    git --git-dir=../../$1/.git format-patch -k -1 --stdout $2 | git am --reject -k --ignore-whitespace
}

gitamendnow(){
    git commit --amend --date="$(date -R)" --author="José Victor <jose.victor@bistwobis.com.br>" --no-edit
}

initmodule()
{
    mkdir -p app/code/community/BIS2BIS/$1/etc
    mkdir -p app/code/community/BIS2BIS/$1/Helper
    touch app/code/community/BIS2BIS/$1/etc/config.xml
    touch app/code/community/BIS2BIS/$1/Helper/Data.php
    touch app/etc/modules/BIS2BIS_$1.xml
    MODULELOWER=`python -c "print('$1'.lower())"`
    STRHELPER="<?php

/**
 * @author José Victor
 */

class BIS2BIS_$1_Helper_Data extends Mage_Core_Helper_Abstract
{

}

?>"
    STRCONFIG="<?xml version='1.0' encoding='UTF-8'?>

<config>
    <modules>
        <BIS2BIS_$1>
            <version>0.1.0</version>
        </BIS2BIS_$1>
    </modules>
    <global>
        <helpers>
            <$MODULELOWER>
                <class>BIS2BIS_$1_Helper</class>
            </$MODULELOWER>
        </helpers>
    </global>
</config>"
    STRMODULES="<?xml version='1.0'?>
<config>
    <modules>
        <BIS2BIS_$1>
            <active>true</active>
            <codePool>community</codePool>
        </BIS2BIS_$1>
    </modules>
</config>"
    echo $STRHELPER >> app/code/community/BIS2BIS/$1/Helper/Data.php
    echo $STRCONFIG >> app/code/community/BIS2BIS/$1/etc/config.xml
    echo $STRMODULES >> app/etc/modules/BIS2BIS_$1.xml

    echo "Módulo $1 criado."
}

initinstall() {
    MODULE=`python -c "print('$1'.lower())"`
    mkdir -p "app/code/community/BIS2BIS/$1/sql/"${MODULE}"_setup/"
    touch "app/code/community/BIS2BIS/$1/sql/"${MODULE}"_setup/mysql4-install-0.1.0.php"
    TEXT="<?php

/**
 * @author José Victor
 */

\$installer = \$this;
\$installer->startSetup();

\$installer->endSetup();

?>"
    echo $TEXT >> "app/code/community/BIS2BIS/$1/sql/"${MODULE}"_setup/mysql4-install-0.1.0.php"

    resource="        <resources>
            <${MODULE}_setup>
                <setup>
                    <module>BIS2BIS_${1}</module>
                </setup>
                <connection>
                    <use>core_setup</use>
                </connection>
            </${MODULE}_setup>
            <${MODULE}_write>
                <connection>
                    <use>core_write</use>
                </connection>
            </${MODULE}_write>
            <${MODULE}_read>
                <connection>
                    <use>core_read</use>
                </connection>
            </${MODULE}_read>
        </resources>"

    line=`awk '/global/{ print NR; exit }' app/code/community/BIS2BIS/$1/etc/config.xml`
    newline=$((line + 1))
    awk -v "n=${newline}" -v "s=${resource}" '(NR==n) { print s } 1' app/code/community/BIS2BIS/$1/etc/config.xml >> app/code/community/BIS2BIS/$1/etc/config.xml.new
    mv -f app/code/community/BIS2BIS/$1/etc/config.xml.new app/code/community/BIS2BIS/$1/etc/config.xml

    echo "Installer do módulo $1 criado."
}

showline() {
    line=`awk '/global/{ print NR; exit }' app/code/community/BIS2BIS/$1/etc/config.xml`
    echo $line
}

renewdb() {
    dropdb $1
    createdb $1
    restoredb $2 $1
}

preparedb() {
    mysql -u root -pbis123 $1 -e \ "insert into core_config_data (scope, scope_id, path, value) values ('default', 0, 'web/unsecure/base_url', 'http://localhost/$2/');insert into core_config_data (scope, scope_id, path, value) values ('default', 0, 'web/secure/base_url', 'http://localhost/$2/');update admin_user set password = md5('admin') where user_id = 1;
"
}

install() {
    python3 ~/instalacao.py $1 $2 $3
}

notes() {
  if [ -z $1 ]; then
    # Using the "$@" here will take all parameters passed into
    # this function so we can place everything into our file.
    echo $2 >> ~/Documentos/notes.wiki
  elif [ -v $1 ]; then
    vi ~/Documentos/notes.wiki
  else
    # If no arguments were passed we will take stdin and place
    # it into our notes instead.
    cat ~/Documentos/notes.wiki
  fi
}

report() {
    sudo vi var/report/$(ls -Art var/report | tail -n 1)
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export MAIL=~/Maildir
export MAIL=~/Maildir

export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

export PATH=$PATH:$HOME/.config/composer/vendor/bin
export PATH=$PATH:$HOME/skim/skim/release
export PATH=$PATH:$HOME/.composer/vendor/bin

updatebaseurl()
{
        db_name=$1
        baseurl=$2

        echo "Executando rotinas..."
        mysql -uroot -proot -D $db_name -e "UPDATE core_config_data SET value = '$baseurl' WHERE path LIKE 'web/unsecure/base_url';"
        mysql -uroot -proot -D $db_name -e "UPDATE core_config_data SET value = '$baseurl' WHERE path LIKE 'web/secure/base_url';"
        echo "Base URL atualizada com sucesso!!"
        notify-send "Configuração concluída" "O banco de dados $db_name foi configurado com sucesso!" -t 5000
}

export TERM=xterm-256color
