
## Example

![](//github.com/andrewschaaf/foss-credits/raw/master/docs/example.png)


## Usage: Command-line + [foss-credits-collection](https://github.com/andrewschaaf/foss-credits-collection)

<pre>
cd foss-credits
coffee foss-credits.coffee foss_credits chromium node gem__oily_png ... > credits.html
</pre>


## Usage: htmlFor
<pre>
html = htmlFor({
  items: [
    {
      "name": "Foo",
      "website": "http://example.com",
      "license": "....full license text..."
    }
  ]
})
</pre>

## See also

* [foss-credits-mac](https://github.com/andrewschaaf/foss-credits-mac)
