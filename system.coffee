#ポストイットシステム全体のクラス
#@pagesにページを内包
class System
  constructor: (@x,@y,@pages=new Array)->
    #絶対座標を表示する(test用)
  pos: ->
    "x:#{@x},y:#{@y}"
    #pageを追加する
  push: (page)->
    @pages.push page
#pageを描画する
  draw: ->
    #canvasを取得
    canvas = document.getElementById('postit');
    if ( ! canvas || ! canvas.getContext ) 
      return false;
    #描画する
    ctx = canvas.getContext('2d');
    ctx.beginPath();
    ctx.arc(70, 70, 60, 10 * Math.PI / 180, 80 * Math.PI / 180, true);
    ctx.stroke();

