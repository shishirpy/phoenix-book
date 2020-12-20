defmodule BookWeb.PageController do
  use BookWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
