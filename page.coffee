#ページのクラス
class Page
  constructor: (@postits=new Array)->#相対座標
#ページの座標はおそらく使わない
#ポストイットをページに追加する
  push: (postit)->
    @postits.push postit
