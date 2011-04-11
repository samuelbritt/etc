#!/bin/bash

# to upload and cat the public key to authorized_keys in one line

REMOTE=$1
ssh $REMOTE "cat >> .ssh/authorized_keys" < ~/.ssh/id_rsa.pub
