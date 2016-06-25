# Livecoding workspace

A javascript live coding (hot code reload) workspace set up using Elixir and Phoenix.

This works by using file system events, websockets and hot code reloading.

![](https://s3.amazonaws.com/f.cl.ly/items/170M2F1Q022X2V0L1n3Q/livecoding_workspace.gif?v=c3e548d4)

# Installing

    mix deps.get
    npm install

# Usage

Start the server

    mix phoenix.server

Visit http://localhost:4000

If you get a "no process" error in the console, reload the page once.

Then edit [web/static/js/cube.coffee](web/static/js/cube.coffee) and see the changes appear in the browser right away.

Now go and play around with the code :)

# Exporting the final result to a HTML file

    mix release

See release.html
