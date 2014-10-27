# Description:
#   Kanmu YEAH!
#
# Configuration:
#
# Commands:
#   hubot 8maki - 8maki画像をランダムに返す
#   hubot js - js画像をランダムに返す
#   hubot achiku - achiku画像をランダムに返す
#   hubot moqada - moqada画像をランダムに返す
#   hubot ide - ide画像をランダムに返す
#   hubot tky - tky画像をランダムに返す
#   hubot [name] kc - [name]のクソコラ画像をランダムに返す
#
# Author:
#   ideyuta

data = require '../data/data.json'

module.exports = (robot) ->

  robot.respond /(achiku|8maki|moqada|js|ide|tky)( kc)?$/i, (msg) ->
    name =  msg.match[1]
    images = if msg.match[2] then data[name].kc else data[name].normal
    if images?
      msg.send "@#{name} #{msg.random images}"
    else
      msg.reply "画像ないから追加しろ"
