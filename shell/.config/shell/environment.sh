# source /opt/homebrew/opt/asdf/libexec/asdf.sh
export ASDF_DATA_DIR="$HOME/.asdf"
export JAVA_HOME=$HOME/.asdf/installs/java/zulu-17.62.17/zulu-17.jdk/Contents/Home/
ASDF_BIN="$ASDF_DATA_DIR/bin"
ASDF_SHIMS="$ASDF_DATA_DIR/shims"

export BREW_PATH=/opt/homebrew/bin/brew
export BREW_BIN=/opt/homebrew/bin

export MYSQL_PATH=/usr/local/mysql/bin
export PG_DATA=~/Library/Application\ Support/Postgres/crm
export PSQL_PATH=/Applications/Postgres.app/Contents/Versions/9.6/bin

export NPM_GLOBAL=~/node_modules/.bin
export GRUNT_PATH=~/node_modules/grunt-cli/bin
export BUN_INSTALL="$HOME/.bun"
export BUN_PATH="$BUN_INSTALL/bin"

export PATH=$PATH:$PSQL_PATH:$BREW_PATH:$BREW_BIN:$MYSQL_PATH:$NPM_GLOBAL:$GRUNT_PATH:$BUN_PATH:$ASDF_BIN:$ASDF_SHIMS

export ECLIPSEZIDEPATH=~/dev/

export LDFLAGS="-L/opt/homebrew/opt/postgresql@9.6/lib"
export CPPFLAGS="-I/opt/homebrew/opt/postgresql@9.6/include"

# starship
export STARSHIP_CONFIG=~/.config/starship/config.toml
export STARSHIP_CACHE=~/.config/starship/cache

export NODE_EXTRA_CA_CERTS="$HOME/.config/cert/corporate-ca.pem"