#!/bin/bash
. ./setenv.sh

echo 'Restart server'
ssh -p "$SSH_PORT" "$UPLOAD_SERVER" "cd $UPLOAD_PATH/$PROJECT_NAME && pm2 restart ecosystem.config.js --env production"
echo '***** Completed ! *****'