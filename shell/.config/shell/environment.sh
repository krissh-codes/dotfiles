source /opt/homebrew/opt/asdf/libexec/asdf.sh
export JAVA_HOME=/Users/krishna-13961/.asdf/installs/java/zulu-17.62.17/zulu-17.jdk/Contents/Home/

export BREW_PATH=/opt/homebrew/bin/brew
export BREW_BIN=/opt/homebrew/bin

export MYSQL_PATH=/usr/local/mysql/bin
export LOCAL_BIN=/usr/local/bin
export PG_DATA=~/Library/Application\ Support/Postgres/crm
export PSQL_PATH=/Applications/Postgres.app/Contents/Versions/9.6/bin

export NPM_GLOBAL=~/node_modules/.bin
export GRUNT_PATH=~/node_modules/grunt-cli/bin
export BUN_INSTALL="$HOME/.bun"
export BUN_PATH="$BUN_INSTALL/bin"

export PATH=$PATH:$PSQL_PATH:$BREW_PATH:$BREW_BIN:$MYSQL_PATH:$NPM_GLOBAL:$GRUNT_PATH:$LOCAL_BIN:$BUN_PATH

export ECLIPSEZIDEPATH=~/dev/

export LDFLAGS="-L/opt/homebrew/opt/postgresql@9.6/lib"
export CPPFLAGS="-I/opt/homebrew/opt/postgresql@9.6/include"

# starship
export STARSHIP_CONFIG=~/.config/starship/config.toml
export STARSHIP_CACHE=~/.config/starship/cache
