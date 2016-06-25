# Livecoding workspace

A javascript live coding workspace written using Elixir and Phoenix. You can do this with pure js tools, but I like Elixir better :)

This works by using file system events, websockets and hot code reloading.

![](https://s3.amazonaws.com/f.cl.ly/items/0w1l0e2z3g3v0x172s3D/livecoding_workspace.gif?v=a98f7faa)

# TODO

- add export instructions

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

TODO: instructions
