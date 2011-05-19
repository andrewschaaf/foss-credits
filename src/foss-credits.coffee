
{licenses} = require 'foss-credits-collection'
optimist = require 'optimist'


exports.main = main = () ->
  slugs = optimist.argv._
  
  items = []
  for x in slugs
    if licenses[x]
      items.push licenses[x]
    else
      console.log "Error: couldn't find a license for #{JSON.stringify(x)}"
      process.exit 1
  
  process.stdout.write htmlFor {
    items: (licenses[x] for x in slugs)
  }


htmlFor = (info) ->
  "<html><head>#{JS}#{CSS}</head><body>#{bodyFor(info)}</body></html>"


bodyFor = (info) ->
  arr = []
  for item, i in info.items
    arr.push """<div class="item">
    <table class="header">
      <tr>
        <td class="header_left">
          #{item.name}
        </td>
        <td class="header_right">
          <a href="#{item.website}">website</a>
          &ndash;
          <a href="#"
                onclick="toggleLicense(#{i});"
                id="toggler_#{i}">
            show license
          </a>
        </td>
      </tr>
    </table>
    <div class="license" id="license_#{i}">
      <pre>
#{item.license}
</pre>
    </div>
  </div>"""
  arr.join "\n\n"


JS = """
  <script type="text/javascript" charset="utf-8">
    var toggleLicense = function(n) {
      var license = document.getElementById("license_" + n);
      var toggler = document.getElementById("toggler_" + n);
      if (license.style.display == 'block') {
        // hide license
        license.style.display = 'none';
        toggler.innerHTML = "show license";
      }
      else {
        // show license
        license.style.display = 'block';
        toggler.innerHTML = "hide license";
      }
    };
  </script>
"""


CSS = """

  <style type="text/css" media="screen">
    
    body {
      font-family: Arial, sans-serif;
    }
    
    .item {
      margin: 15px;
      background: #B7B7B7;
      -webkit-border-radius: 5px;
      padding-left: 14px;
      padding-right: 14px;
      padding-bottom: 1px;
    }
    .header {
      width: 100%;
      cellspacing: 0;
    }
    .header_left {
      text-align: left;
      font-size: 18px;
      font-weight: bold;
    }
    .header_right {
      text-align: right;
    }
    .license {
      display: none;
      background: #FBFBFB;
      -webkit-border-radius: 5px;
    }
    .license pre {
      padding: 10px;
    }
    
  </style>

"""

if not module.parent
  main()

