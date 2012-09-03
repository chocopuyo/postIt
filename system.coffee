#ポストイットシステム全体のクラス
#@pagesにページを内包
class System
  #クラス変数を定義
  @margin_left = 30;@margin_top = 30#systemのマージン
  @power=0.5 #倍率 
  @page_x = 20;@page_y = 50 #1ページ目の初期位置
  @page_size_width = 210*System.power; @page_size_height =297*System.power #ページ縦横幅
  @postit_size_width = 100;@postit_size_height=30 #ポストイットのサイズ可変になる予定
  #コンストラクタ
  constructor: (@x=0,@y=0,@pages=new Array)->
    system =document.getElementById("system")
    ###  
        system.addEventListener('click',(e)=>
      #  rect = system.getBoundingClientRect()
      #postit = new Postit(e.x-System.page_x-rect.left,e.y-System.page_y-rect.top)
      #@pages[0].push postit
      #this.draw()
    ,false)
    ###
  #絶対座標を表示する(test用)
  pos: ->
    "x:#{@x},y:#{@y}"
    #pageを追加する
  page_add: ->
    page = new Page(-(System.margin_left+System.page_size_width*(@pages.length%2))+$(window).width()/2,System.margin_top+System.page_size_height*Math.floor(@pages.length/2),@pages.length+1)
    @pages.push page
  #listを表示するウィンドウを追加
  list_view:->
    list = document.createElement 'ul'
    list.innerHTML = 'postIt list'
    list.style.right = 0
    list.style.position = 'absolute'
    list.style.width = '200px'
    list.style.backgroundColor = '#fff'
    list.id = 'post_it_list'
    system = document.getElementById "system"
    system.appendChild list
