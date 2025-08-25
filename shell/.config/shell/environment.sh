# !sh /bin/bash
export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.58.25/Contents/Home

export BREW_PATH=/opt/homebrew/bin/brew
export BREW_BIN=/opt/homebrew/bin

export MYSQL_PATH=/usr/local/mysql/bin
export PG_DATA=~/Library/Application\ Support/Postgres/var-9.5
export PSQL_PATH=/Applications/Postgres.app/Contents/Versions/latest/bin

export NPM_GLOBAL=~/node_modules/.bin
export GRUNT_PATH=~/node_modules/grunt-cli/bin

export PATH=$PATH:$PSQL_PATH:$BREW_PATH:$BREW_BIN:$MYSQL_PATH:$NPM_GLOBAL:$GRUNT_PATH

export ECLIPSEZIDEPATH=~/dev/

export LDFLAGS="-L/opt/homebrew/opt/postgresql@9.5/lib"
export CPPFLAGS="-I/opt/homebrew/opt/postgresql@9.5/include"

# starship
export STARSHIP_CONFIG=~/.config/starship/config.toml
export STARSHIP_CACHE=~/.config/starship/cache

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

eval "$(/opt/homebrew/bin/brew shellenv)"
