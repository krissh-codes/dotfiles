set -Ux JAVA_HOME /Library/Java/JavaVirtualMachines/zulu-11.jdk/Contents/Home
set BREW_PATH /opt/homebrew/bin/brew
set MYSQL_PATH /usr/local/mysql/bin
set PSQL_PATH /Applications/Postgres.app/Contents/Versions/latest/bin
set -U PG_DATA /Users/krishna-13961/Library/Application\ Support/Postgres/var-9.5
set NPM_GLOBAL ~/node_modules/.bin:~/node_modules/grunt-cli/bin
set -Ux ECLIPSEZIDEPATH /Users/krishna-13961/dev/
set ZIDE_SCRIPTS /Users/krishna-13961/zoho/scripts

set -a PATH $PSQL_PATH:$BREW_PATH:$MYSQL_PATH:$NPM_GLOBAL:$ZIDE_SCRIPTS

set -g LDFLAGS "-L/opt/homebrew/opt/postgresql@9.5/lib"
set -g CPPFLAGS "-I/opt/homebrew/opt/postgresql@9.5/include"
set -Ux STARSHIP_CONFIG /Users/krishna-13961/.config/starship/config.toml
set -Ux STARSHIP_CACHE /Users/krishna-13961/.config/starship/cache

source /opt/homebrew/opt/asdf/libexec/asdf.fish
