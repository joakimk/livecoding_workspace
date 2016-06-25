# Livecoding workspace

A javascript live coding (hot code reload) workspace set up using Elixir and Phoenix.

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

# Exporting the final result to a HTML file

    mix release

See release.html

# How it works

0. Brunch detects the file change and compiles all files matching the rule for `live_update.js` in brunch-config.coffee.
0. Elixir detects the new `live_update.js` file using file system events.
0. We use Phoenix web sockets to push out the new code.
0. `app.js` disables the old version of the code and loads the new version.
0. The app continues from where it was previously by using the data in `window.previousModelData`.

