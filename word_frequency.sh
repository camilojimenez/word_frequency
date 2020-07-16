#!/bin/bash

# pure word count, remove all straneous characters

cat raw_data/OpenSubtitles.en-pl.pl \
| tr '{}+=0-1234_56789:!@#$%^&*(),.?"/\\][' ' ' \
| sed 's/-/ /g' \
| tr ' ' '\n' \
| tr '[A-Z]' '[a-z]' \
| sort \
| uniq -c \
| sort -nk1 \
| awk '$1>100' \
> words/word_frequencies 

