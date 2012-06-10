class Postit
  constructor: (@x,@y,@page_number,@text='何か入力してください')->
    #ポストイットのデザインを作る
    @postit_id = Math.random()
    postit = document.createElement 'div'
    postit.style.backgroundColor = '#fff'
    postit.style.left = @x+'px'
    postit.style.top = @y+'px'
    postit.style.position = 'absolute'
    postit.style.border = 'solid 1px #000'
    postit.style.padding = '2px'
    postit.style.background = 'red'
    postit.innerHTML = '☒'
    #formを作る
    form = document.createElement 'form'
    #inputを作る
    textarea = document.createElement 'textarea'
    textarea.value = @text
    textarea.style.width = '200px'
    textarea.style.height = '50px'
    textarea.id = @postit_id
    form.appendChild textarea
    #pageのIDから要素を取得
    page_id = @page_number
    page = document.getElementById page_id
    #要素をページに追加
    postit.appendChild form
    page.appendChild postit
  focus: ->
    #追加したpostitにフォーカスさせる
    #    (document.getElementById @postit_id).focus()
    added_postit = document.getElementById @postit_id
    added_postit.focus()
    added_postit.select()
