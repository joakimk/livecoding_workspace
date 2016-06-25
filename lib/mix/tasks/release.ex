defmodule Mix.Tasks.Release do
  use Mix.Task

  @shortdoc "Generate a release.html file containing your javascript app."

  def run(_args) do
    Mix.shell.info "Compiling assets..."
    Mix.shell.cmd("node_modules/brunch/bin/brunch build")

    Mix.shell.info "Downloading three.js..."
    three_js_code = Application.get_env(:livecoding_workspace, :three_js_url) |> get

    code = File.read!("priv/static/js/live_update.js")

    page = """
    <!DOCTYPE html>
    <html lang="en">
      <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Demo</title>
      </head>

      <body>
    <div id="js-container" />
        <script type="text/javascript">
          #{three_js_code}
        </script>
        <script type="text/javascript">
          #{code}
        </script>

        <script type="text/javascript">
          element = Cube.init()
          container = document.getElementById("js-container")
          container.appendChild(element)
        </script>
    </body>
    </html>
    """

    Mix.shell.info "Writing release.html"
    File.write! "release.html", page
    Mix.shell.info "Done"
  end

  defp get(url) do
    { :ok, {_, _, body} } = :httpc.request(:get, { String.to_char_list(url), [] }, [], [])
    List.to_string(body)
  end
end
