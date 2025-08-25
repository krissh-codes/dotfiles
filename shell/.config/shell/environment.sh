# !sh /bin/bash
export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.58.25/Contents/Home
export BREW_PATH=/opt/homebrew/bin/brew
export BREW_BIN=/opt/homebrew/bin
export MYSQL_PATH=/usr/local/mysql/bin
export PSQL_PATH=/Applications/Postgres.app/Contents/Versions/latest/bin
export PATH=$PATH:$PSQL_PATH:$BREW_PATH:$MYSQL_PATH
export PATH="$PATH:~/node_modules/.bin":"./node_modules/grunt-cli/bin"
export PG_DATA=/Users/krishna-13961/Library/Application\ Support/Postgres/var-9.5
export ECLIPSEZIDEPATH=/Users/krishna-13961/dev/
export PATH=$PATH:/Users/krishna-13961/zoho/scripts:$BREW_BIN

export LDFLAGS="-L/opt/homebrew/opt/postgresql@9.5/lib"
export CPPFLAGS="-I/opt/homebrew/opt/postgresql@9.5/include"
export STARSHIP_CONFIG="/Users/krishna-13961/.config/starship/config.toml"
export STARSHIP_CACHE="/Users/krishna-13961/.config/starship/cache"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
