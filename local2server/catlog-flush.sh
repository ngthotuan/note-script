#!/bin/bash
. ./setenv.sh
ssh -p "$SSH_PORT" "$UPLOAD_SERVER" "pm2 flush"
