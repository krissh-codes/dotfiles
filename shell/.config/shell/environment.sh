# !sh /bin/bash
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-17.0.2.jdk/Contents/Home
export BREW_PATH=/opt/homebrew/bin/brew
export MYSQL_PATH=/usr/local/mysql/bin
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin:$BREW_PATH:$MYSQL_PATH
export PATH="$PATH:~/node_modules/.bin":"./node_modules/grunt-cli/bin"
export PG_DATA=/Users/krishna-13961/Library/Application\ Support/Postgres/var-9.5
export ECLIPSEZIDEPATH=/Users/krishna-13961/dev/
export PATH=$PATH:/Users/krishna-13961/zoho/scripts

export LDFLAGS="-L/opt/homebrew/opt/postgresql@9.5/lib"
export CPPFLAGS="-I/opt/homebrew/opt/postgresql@9.5/include"
export STARSHIP_CONFIG="~/.config/starship/config.toml"
export STARSHIP_CACHE="~/.config/starship/cache"
