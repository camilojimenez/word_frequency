#!/usr/bin/env bash
cat raw_data/OpenSubtitles.en-pl.pl \
| tr '{}+=0-1234_56789:!@#$%^&*(),.?"/\\][' ' ' \
| tr '[A-Z]' '[a-z]' \
| sed -e 's/  */ /g' \
| sed -e 's/^ *//g' \
| sed -e 's/ *$//g' \
| sort \
| uniq -c \
| awk '$1>1' \
| sort -n \
> words/sentence_frequencies

