(function() {
  var CSS, JS, bodyFor, htmlFor, licenses, main, optimist;
  licenses = require('foss-credits-collection').licenses;
  optimist = require('optimist');
  exports.main = main = function() {
    var items, slugs, x, _i, _len;
    slugs = optimist.argv._;
    items = [];
    for (_i = 0, _len = slugs.length; _i < _len; _i++) {
      x = slugs[_i];
      if (licenses[x]) {
        items.push(licenses[x]);
      } else {
        console.log("Error: couldn't find a license for " + (JSON.stringify(x)));
        process.exit(1);
      }
    }
    return process.stdout.write(htmlFor({
      items: (function() {
        var _j, _len2, _results;
        _results = [];
        for (_j = 0, _len2 = slugs.length; _j < _len2; _j++) {
          x = slugs[_j];
          _results.push(licenses[x]);
        }
        return _results;
      })()
    }));
  };
  htmlFor = function(info) {
    return "<html><head>" + JS + CSS + "</head><body>" + (bodyFor(info)) + "</body></html>";
  };
  bodyFor = function(info) {
    var arr, i, item, _len, _ref;
    arr = [];
    _ref = info.items;
    for (i = 0, _len = _ref.length; i < _len; i++) {
      item = _ref[i];
      arr.push("<div class=\"item\">\n  <table class=\"header\">\n    <tr>\n      <td class=\"header_left\">\n        " + item.name + "\n      </td>\n      <td class=\"header_right\">\n        <a href=\"" + item.website + "\">website</a>\n        &ndash;\n        <a href=\"#\"\n              onclick=\"toggleLicense(" + i + ");\"\n              id=\"toggler_" + i + "\">\n          show license\n        </a>\n      </td>\n    </tr>\n  </table>\n  <div class=\"license\" id=\"license_" + i + "\">\n    <pre>\n" + item.license + "\n</pre>\n  </div>\n</div>");
    }
    return arr.join("\n\n");
  };
  JS = "<script type=\"text/javascript\" charset=\"utf-8\">\n  var toggleLicense = function(n) {\n    var license = document.getElementById(\"license_\" + n);\n    var toggler = document.getElementById(\"toggler_\" + n);\n    if (license.style.display == 'block') {\n      // hide license\n      license.style.display = 'none';\n      toggler.innerHTML = \"show license\";\n    }\n    else {\n      // show license\n      license.style.display = 'block';\n      toggler.innerHTML = \"hide license\";\n    }\n  };\n</script>";
  CSS = "\n<style type=\"text/css\" media=\"screen\">\n  \n  body {\n    font-family: Arial, sans-serif;\n  }\n  \n  .item {\n    margin: 15px;\n    background: #B7B7B7;\n    -webkit-border-radius: 5px;\n    padding-left: 14px;\n    padding-right: 14px;\n    padding-bottom: 1px;\n  }\n  .header {\n    width: 100%;\n    cellspacing: 0;\n  }\n  .header_left {\n    text-align: left;\n    font-size: 18px;\n    font-weight: bold;\n  }\n  .header_right {\n    text-align: right;\n  }\n  .license {\n    display: none;\n    background: #FBFBFB;\n    -webkit-border-radius: 5px;\n  }\n  .license pre {\n    padding: 10px;\n  }\n  \n</style>\n";
  if (!module.parent) {
    main();
  }
}).call(this);
