system = new System(100,100)
page = new Page(20,20)
system.push page
#alert system.pages[0].pos()
window.onload  = ->
  system.draw()
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
