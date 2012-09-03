window.onload  = ->
  system = new System()
  system.page_add()
  add_button = document.getElementById('add_page')   
  add_button.addEventListener 'click',(e)=>
    system.page_add()
  ,false


  system.list_view()
 ###
  page1 = new Page()
  page2 = new Page()
  system.push page1

  postit1 = new Postit(0,100)
  page1.push postit1

  system.push page2

  postit2 = new Postit(0,200)
  page2.push postit2
  system.draw()
###
  #for key of system.pages
  #alert system.pages[key].pos()
#drawPage = ->
###
  canvas = document.getElementById('postit');
  if ( ! canvas || ! canvas.getContext ) 
    return false;
  ctx = canvas.getContext('2d');
  ctx.beginPath();
  ctx.arc(70, 70, 60, 10 * Math.PI / 180, 80 * Math.PI / 180, true);
  ctx.stroke();
###
