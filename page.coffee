#ページのクラス
class Page
  constructor: (@x,@y,@page_number,@postits=new Array)->#相対座標
    #ページをSystem上に作る
    #まずはページのスタイルを決める
    page = document.createElement 'div'
    page.style.backgroundColor = '#fff'
    page.style.left = @x+'px'
    page.style.top = @y+'px'
    page.style.width = System.page_size_width+'px'
    page.style.height = System.page_size_height+'px'
    page.style.position = 'absolute'
    page.style.border = 'solid 1px #000'
    page.id = @page_number
    #systemに追加
    system = document.getElementById "system"
    system.appendChild page
    #addEventListenerを追加
    page.addEventListener 'click',(e)=>
      rect = event.target.getBoundingClientRect()
      postit = new Postit(e.x-rect.left,e.y-rect.top,e.target.id)
      postit.focus()
    ,false
#ポストイットをページに追加する
  push: (postit)->
    @postit.push postit
