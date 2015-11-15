# Description
#   『お疲れ様です』と読める言葉に『やめろ』って答えるやつ
#
# Configuration:
#   MECAB_API_HIRAGANA_URL - mecab-api-hiraganaのURL
#
# Commands:
#   None
#
# Author:
#   knjcode <knjcode@gmail.com>

baseUrl = process.env.MECAB_API_HIRAGANA_URL
if !baseUrl
  console.error("ERROR: You should set MECAB_API_HIRAGANA_URL env variables.")

module.exports = (robot) ->
  robot.hear /.*?/i, (msg) ->
    if !baseUrl
      robot.logger.error("You should set MECAB_API_HIRAGANA_URL env variables.")
      return

    # スペース除去
    input = msg.message.text.replace(/\s+/g,"")

    # 普通のお疲れさまは無視
    if /お(疲|つか)れ(様|さま)です/.test(input)
      return

    # ローマ字のお疲れさま
    if /o(tsu|tu)karesamadesu/.test(input)
      msg.send("やめろ")
      return

    data = JSON.stringify {
        "sentence": input
        "output_type": "hiragana"
    }

    robot.http(baseUrl+"/hiragana")
      .header("Content-type", "application/json")
      .post(data) (err, res, body) ->
        if err
          robot.logger.error("#{err}")
          return
        try
          result = JSON.parse(body)
          trim = result.converted.replace(/\s+/g,"")
          if ~trim.indexOf("おつかれさまです")
            msg.send("やめろ")
        catch e
          robot.logger.error("#{e}")
