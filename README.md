# Livecoding workspace

A javascript live coding (hot code reload) workspace set up using Elixir and Phoenix.

Mostly set up to do WebGL using three.js.

![](https://s3.amazonaws.com/f.cl.ly/items/0w1l0e2z3g3v0x172s3D/livecoding_workspace.gif?v=a98f7faa)

# Installing

    mix deps.get
    npm install

# Usage

Start the server

    mix phoenix.server

0. Visit <http://localhost:4000>
  0. If you get a "no process" error in the console, reload the page once.
0. Then edit [web/static/js/cube.coffee](web/static/js/cube.coffee) and see the changes appear in the browser right away.
0. Realise that you can open the app on a secondary computer over the network (like an iPad)...

# Exporting the final result to a HTML file

    mix release

See release.html

# How it works

0. Brunch detects the file change and compiles all files matching the rule for `live_update.js` in brunch-config.coffee.
0. Elixir detects the new `live_update.js` file using file system events.
0. We use Phoenix web sockets to push out the new code.
0. `app.js` disables the old version of the code and loads the new version.
0. The app continues from where it was previously by using the data in `window.previousModelData`.

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
