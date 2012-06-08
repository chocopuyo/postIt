#ページのクラス
class Page
  constructor: (@x,@y)->#相対座標
#ページの座標はおそらく使わない
  pos: ->
    "x:#{@x},y:#{@y}"

