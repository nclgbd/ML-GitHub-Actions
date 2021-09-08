#!/bin/bash --login

# mkdir -p ./media/ ./incorrect_images/ ./saved_models/

# # get zip file from google doc
# wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1CHWKCgTiasvlkp7JvP4nG_1KmaWa4U3v' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1CHWKCgTiasvlkp7JvP4nG_1KmaWa4U3v" -O data.zip && rm -rf /tmp/cookies.txt
# unzip data.zip
# rm data.zip
