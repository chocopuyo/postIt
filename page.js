// Generated by CoffeeScript 1.3.3
var Page;

Page = (function() {

  function Page(x, y, page_number, postits) {
    var page, system,
      _this = this;
    this.x = x;
    this.y = y;
    this.page_number = page_number;
    this.postits = postits != null ? postits : new Array;
    page = document.createElement('div');
    page.style.backgroundColor = '#fff';
    page.style.left = this.x + 'px';
    page.style.top = this.y + 'px';
    page.style.width = System.page_size_width + 'px';
    page.style.height = System.page_size_height + 'px';
    page.style.position = 'absolute';
    page.style.border = 'solid 1px #000';
    page.id = this.page_number;
    system = document.getElementById("system");
    system.appendChild(page);
    page.addEventListener('click', function(e) {
      var postit, rect;
      rect = event.target.getBoundingClientRect();
      postit = new Postit(e.x - rect.left, e.y - rect.top, e.target.id);
      return postit.focus();
    }, false);
  }

  Page.prototype.push = function(postit) {
    return this.postit.push(postit);
  };

  return Page;

})();
