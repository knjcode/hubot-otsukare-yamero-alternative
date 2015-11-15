# hubot-otsukare-yamero-alternative

『お疲れ様です』と読める言葉に『やめろ』って答えるやつ

See [`src/otsukare-yamero-alternative.coffee`](src/otsukare-yamero-alternative.coffee) for full documentation.

## Installation

In hubot project repo, run:

`npm install hubot-otsukare-yamero-alternative --save`

Then add **hubot-otsukare-yamero-alternative** to your `external-scripts.json`:

```json
[
  "hubot-otsukare-yamero-alternative"
]
```

## Settings

If you don't have a mecab-api-hiragana environtment, set up your [mecab-api-hiragana](https://github.com/knjcode/mecab-api-hiragana).
Then set the environment variable MECAB_API_HIRAGANA_URL to value this mecab-api-hiragana's URL.

## Sample Interaction

```
user1>> オツカレサマデス
hubot>> やめろ
```

## Reference

https://twitter.com/rosylilly/status/545491798907318272
