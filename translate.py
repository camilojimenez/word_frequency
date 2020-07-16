#!/usr/bin/env python
from googletrans import Translator
import json
import time

translator = Translator()

def translate_file(fn):
  f = open(fn, 'rb').read().decode('utf-8')
  lines = f.split('\n')[-600:]
  inp = [ " ".join(line.split()[1:]) for line in lines ]
  pairs = []
  for i in inp:
    try:
      res = translator.translate(
          i,
          src="pl",
          dest="en"
        )
      pair = {
          "pl": res.origin,
          "en": res.text,
          "extra": res.extra_data
        }
      pairs.append(pair)
      print(pair)
      time.sleep(1)
    except:
      pass

  return pairs




words = translate_file("words/word_frequencies")
open('pairs/words.json', 'w').write(json.dumps(words))

sentences = translate_file("words/word_frequencies")
open('pairs/sentences.json', 'w').write(json.dumps(sentences))
