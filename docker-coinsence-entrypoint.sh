#!/usr/bin/env bash

# check if repo is already cloned
if ! [ -d .git/ ]; then

    # clone humhub repo
    echo >&2 "Humhub repo not initialised in $PWD - cloning.."
    git clone https://github.com/Coinsence/humhub .
    echo >&2 "Complete! successfully cloned in $PWD"

fi

echo >&2 "Installing yii2 deps"
composer install

if [[ $(ls -l "index.php" | awk '{print $4}') != "www-data" ]]; then
    echo >&2 "Fixing permissions.."

    chown -R 1000:www-data *
    find assets/ protected/config/ protected/modules/ protected/runtime/ uploads/ -type f -exec chmod 664 {} \;
    find assets/ protected/config/ protected/modules/ protected/runtime/ uploads/ -type d -exec chmod 775 {} \;
    chmod +x protected/yii*

fi

# finish it with launching the apache server
exec apache2-foreground
