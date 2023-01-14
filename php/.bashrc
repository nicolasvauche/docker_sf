# SF ALIASES
alias sf="php bin/console"
alias sfserve="symfony server:start --no-tls"
alias sfcc="sf cache:clear"
alias sfdbdr="sf doctrine:database:drop --force"
alias sfdbc="sf doctrine:database:create"
alias sfm="sf doctrine:migrations:migrate --no-interaction"
alias sfix="sf doctrine:fixtures:load --no-interaction"
alias sfdbd="sfdbdr && sfdbc && sfm && sfix && sfcc"

# TESTING ALIASES
alias pu="php bin/phpunit"
alias puc="pu --coverage-html public/test-coverage"

# GIT ALIASES
alias gta="git status"
alias gco="git checkout"
alias gfp="git fetch --all --prune && git pull --all"
alias gcm="git commit -m"
alias gba="git branch -a"
alias gbd="git branch -D "
