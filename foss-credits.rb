

def foss_credits_html(info)
  return "<html><head>#{js}#{css}</head><body>#{body(info)}</body></html>"
end


def body(info)
  arr = []
  info[:items].each_index do |i|
    item = info[:items][i]
    arr.push('  <div class="item">
    <table class="header">
      <tr>
        <td class="header_left">
          ' + item[:name] + '
        </td>
        <td class="header_right">
          <a href="' + item[:website] + '">website</a>
          &ndash;
          <a href="#"
                onclick="toggleLicense(' + i.to_s + ');"
                id="toggler_' + i.to_s + '">
            show license
          </a>
        </td>
      </tr>
    </table>
    <div class="license" id="license_' + i.to_s + '">
      <pre>
' + item[:license] + '
</pre>
    </div>
  </div>')
  end
  arr.join "\n\n"
end


def js()
  <<-END
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
  END
end

def css()
  <<-END
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
  END
end

