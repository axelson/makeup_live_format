defmodule MakeupLiveWeb.PageController do
  use MakeupLiveWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def makeup(conn, _params) do
    source = File.read!(__ENV__.file)

    styles = Makeup.stylesheet()
    highlighted_html = Makeup.highlight(source)
    html = """
    <html>
      <head>
      <style>#{styles}</style>
    </head>
    <body>#{highlighted_html}</body>
    </html>
    """

    html(conn, html)
  end
end
