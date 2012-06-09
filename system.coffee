#ポストイットシステム全体のクラス
#@pagesにページを内包
class System
  #クラス変数を定義
  @power=1.8 #倍率 
  @page_x = 20;@page_y = 50 #1ページ目の初期位置
  @page_size_width = 210; @page_size_height =297 #ページ縦横幅
  @postit_size_width = 100;@postit_size_height=30 #ポストイットのサイズ可変になる予定
  #コンストラクタ
  constructor: (@x,@y,@pages=new Array)->
    canvas=document.getElementById("postit")
    canvas.addEventListener('mousedown',(e)=>
      rect = canvas.getBoundingClientRect()
      postit = new Postit(e.x-System.page_x-rect.left,e.y-System.page_y-rect.top)
      @pages[0].push postit
      this.draw()
    ,false)
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
    ctx = canvas.getContext('2d');
    ctx.beginPath();
    #ページを一枚づつ描画する
    for key of @pages
      ctx.strokeRect((key%2)*System.page_size_width*System.power+System.page_x,
        Math.floor(key/2)*System.page_size_height*System.power+System.page_y,
        System.page_size_width*System.power ,
        System.page_size_height*System.power
      );
      for num of @pages[key].postits
        postit = @pages[key].postits[num]
        page_x = (key%2)*System.page_size_width*System.power+System.page_x
        page_y = Math.floor(key/2)*System.page_size_height*System.power+System.page_y
        ctx.strokeRect(postit.x+page_x,postit.y+page_y,System.postit_size_width*System.power,System.postit_size_height*System.power)


