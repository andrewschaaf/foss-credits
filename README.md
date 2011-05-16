
## Example

![](//github.com/andrewschaaf/foss-credits/raw/master/docs/example.png)

## Usage: Command-line + [foss-credits-collection](https://github.com/andrewschaaf/foss-credits-collection)

Prereqs:

* coffee-script
* foss-credits-collection in the same folder as foss-credits

<pre>
cd foss-credits
coffee foss-credits.coffee foss_credits chromium node gem__oily_png ... > credits.html
</pre>


## Usage: htmlsFor
<pre>
html = htmlsFor({
  items: [
    {
      "name": "Foo",
      "website": "http://example.com",
      "license": "....full license text..."
    }
  ]
})
</pre>
