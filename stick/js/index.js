// Generated by CoffeeScript 1.6.3
var root;

root = typeof module !== "undefined" && module !== null ? module : window;

$(function() {
  return $.stick = (function() {
    var getvalue, setvalue, stick, uuid;
    stick = {};
    uuid = function(length) {
      var id;
      if (length == null) {
        length = 7;
      }
      id = "";
      while (id.length < length) {
        id += Math.random().toString(36).substr(2);
      }
      return "id" + id.substr(0, length);
    };
    stick.reset = function() {
      root.fb.set({});
      return $(root.sel).each(function(i, d) {
        var el;
        el = $(this);
        return setvalue(el, "");
      });
    };
    stick.init = function(account, namespace, sel) {
      if (namespace == null) {
        namespace = uuid();
      }
      if (sel == null) {
        sel = ".stick";
      }
      root.sel = sel;
      root.fb = new Firebase("http://" + account + ".firebaseio.com").child(namespace);
      return $(root.sel).each(function(i, d) {
        var el, key, tag;
        el = $(this);
        tag = el.prop('tagName') || "";
        key = el.attr("id") || ("id" + tag + i);
        el.attr("stick-id", key);
        return root.fb.on("value", function(snapshot) {
          var obj;
          obj = snapshot.val() || {};
          Object.keys(obj).forEach(function(key) {
            var e;
            e = $("[stick-id=\"" + key + "\"]");
            if (getvalue(e) !== obj[key]) {
              return setvalue(e, obj[key]);
            }
          });
          el.change(function() {
            return stick.update(el);
          });
          if (el.attr('contentEditable', true)) {
            return el.on("blur", function() {
              return el.trigger("change");
            });
          }
        });
      });
    };
    stick.update = function(el) {
      var obj;
      obj = {};
      return root.fb.once('value', function(snapshot) {
        obj = snapshot.val() || {};
        console.log(obj);
        obj[el.attr("stick-id")] = getvalue(el);
        return root.fb.set(obj);
      });
    };
    getvalue = function(el) {
      if (el.is("input") && el.attr("type") === "checkbox") {
        return el.is(':checked');
      } else if (el.is("input")) {
        return el.val();
      } else if (el.is("textarea")) {
        return el.val();
      } else if (el.attr('contentEditable', true)) {
        return el.html();
      } else {
        return el.val() || el.html();
      }
    };
    setvalue = function(el, val) {
      if (el.is("input") && el.attr("type") === "checkbox") {
        return el.prop('checked', val);
      } else if (el.is("input")) {
        return el.val(val);
      } else if (el.is("textarea")) {
        return el.val(val);
      } else if (el.attr('contentEditable', true)) {
        return el.html(val);
      } else {
        return el.val(val);
      }
    };
    return stick;
  })();
});

/*
//@ sourceMappingURL=index.map
*/