// Generated by CoffeeScript 1.3.3
var System;

System = (function() {

  System.power = 1.8;

  System.page_x = 20;

  System.page_y = 50;

  System.page_size_width = 210;

  System.page_size_height = 297;

  System.postit_size_width = 100;

  System.postit_size_height = 30;

  function System(x, y, pages) {
    var canvas,
      _this = this;
    this.x = x;
    this.y = y;
    this.pages = pages != null ? pages : new Array;
    canvas = document.getElementById("postit");
    canvas.addEventListener('mousedown', function(e) {
      var postit, rect;
      rect = canvas.getBoundingClientRect();
      postit = new Postit(e.x - System.page_x - rect.left, e.y - System.page_y - rect.top);
      _this.pages[0].push(postit);
      return _this.draw();
    }, false);
  }

  System.prototype.pos = function() {
    return "x:" + this.x + ",y:" + this.y;
  };

  System.prototype.push = function(page) {
    return this.pages.push(page);
  };

  System.prototype.draw = function() {
    var canvas, ctx, key, num, page_x, page_y, postit, _results;
    canvas = document.getElementById('postit');
    if (!canvas || !canvas.getContext) {
      return false;
    }
    ctx = canvas.getContext('2d');
    ctx.beginPath();
    _results = [];
    for (key in this.pages) {
      ctx.strokeRect((key % 2) * System.page_size_width * System.power + System.page_x, Math.floor(key / 2) * System.page_size_height * System.power + System.page_y, System.page_size_width * System.power, System.page_size_height * System.power);
      _results.push((function() {
        var _results1;
        _results1 = [];
        for (num in this.pages[key].postits) {
          postit = this.pages[key].postits[num];
          page_x = (key % 2) * System.page_size_width * System.power + System.page_x;
          page_y = Math.floor(key / 2) * System.page_size_height * System.power + System.page_y;
          _results1.push(ctx.strokeRect(postit.x + page_x, postit.y + page_y, System.postit_size_width * System.power, System.postit_size_height * System.power));
        }
        return _results1;
      }).call(this));
    }
    return _results;
  };

  return System;

})();
