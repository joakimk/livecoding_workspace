# Livecoding workspace

A javascript live coding (hot code reload) workspace set up using Elixir and Phoenix.

Mostly set up to do WebGL using three.js.

![](https://s3.amazonaws.com/f.cl.ly/items/0w1l0e2z3g3v0x172s3D/livecoding_workspace.gif?v=a98f7faa)

# Installing

Before you start, ensure you have Node and Elixir installed. I'm using Elixir 1.3.0 and Node v5.5.0, but other versions will likely work as well.

    mix deps.get
    npm install

# Usage

Start the server

    mix phoenix.server

0. Visit <http://localhost:4000>
  0. If you get a "no process" error in the console, reload the page once.
0. Then edit [web/static/js/cube.coffee](web/static/js/cube.coffee) and see the changes appear in the browser right away.
0. Realise that you can open the app on a secondary computer over the network (like an iPad or a TV)...

# Exporting the final result to a HTML file

    mix release

See release.html

# Multiple apps

As this is meant to be a workspace where you can try out various things, it supports multiple "apps".

For example, try <http://localhost:4000?app=Demo> to load the code from Demo.coffee. Any top level function that in turn exposes an `init()` to return the root element can be used by this.

This also works with release.html, e.g. `release.html?app=Demo` will display that app.

## Using this to create a demo

[web/static/js/demo.coffee](web/static/js/demo.coffee) is a tiny demo with movement synced to music using <https://github.com/kusma/rocket/>. To see the end result, go to: <http://localhost:4000/?app=Demo>.

If you have the "GNU rocket" tracker installed and started, go to <http://localhost:4000/?tracker=true&app=Demo> and the rotation tracks will appear in the editor (given that you compiled it with QT5 which has websocket support). Press space and the demo will run. Keep in mind it won't do anything unless you enter numbers into the tracks.

For an example of a real demo created using a version of this setup, see [xa-006](https://github.com/joakimk/xa-006).

## Demo music sync gotcha

You may experience an issue where the player resets to the start after pausing, moving in the editor and then playing again. This is because setting "audio.currentTime" to anything in that situation causes "audio.currentTime" to return 0 (browser bug). This seems to be an issue related to streaming and can be fixed by loading the music using a data-uri ([see example](https://github.com/joakimk/xa-006/commit/27d47b13cb2b81d6460b513058513e9de55880dd)). 

# How it works

0. Brunch detects the file change and compiles all files matching the rule for `live_update.js` in brunch-config.coffee.
0. Elixir detects the new `live_update.js` file using file system events.
0. We use Phoenix web sockets to push out the new code.
0. `app.js` disables the old version of the code and loads the new version.
0. The app continues from where it was previously by using the data in `window.previousModelData`.
  0. If any error occurs, the data is reset to defaults and the page is reloaded.

## Projects using this as a base

* <https://github.com/joakimk/xa-006>
* know of any more? ping me

## Credits

Borrowed the example music from the javascript example of https://github.com/kusma/rocket for "Demo".

## License

Copyright (c) 2016 [Joakim Kolsjö](https://twitter.com/joakimk)

MIT License

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
