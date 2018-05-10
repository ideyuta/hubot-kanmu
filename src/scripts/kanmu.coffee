# Description:
#   Kanmu YEAH!
#
# Configuration:
#
# Commands:
#   hubot 8maki - 8maki画像をランダムに返す
#   hubot sakai - sakai画像をランダムに返す
#   hubot achiku - achiku画像をランダムに返す
#   hubot moqada - moqada画像をランダムに返す
#   hubot ide - ide画像をランダムに返す
#   hubot takeya - takeya画像をランダムに返す
#   hubot koyama - koyama画像をランダムに返す
#   hubot iruka - iruka画像をランダムに返す
#   hubot hiroakis - hiroakis画像をランダムに返す
#   hubot yuta - yuta画像をランダムに返す
#   hubot [name] kc - [name]のクソコラ画像をランダムに返す
#
# Author:
#   ideyuta

DATA_URL = 'https://raw.githubusercontent.com/ideyuta/hubot-kanmu/master/src/data/data.json'

module.exports = (robot) ->

  ##
  # @desc
  # 名前に応じてそいつの画像を返す
  ##
  robot.respond /(achiku|8maki|moqada|sakai|ide|takeya|koyama|iruka|hiroakis|yuta)( kc)?$/i, (msg) ->
    msg.http(DATA_URL)
      .get() (err, res, body) ->
        data = JSON.parse body
        name =  msg.match[1]
        images = if msg.match[2] then data[name].kc else data[name].normal
        if images?
          msg.send "@#{name} #{msg.random images}"
        else
          msg.reply "画像ないから追加しろ"

  ##
  # @desc
  # ほう
  ##
  robot.hear /^ほう$/i, (msg) ->
    msg.reply "ほう"
