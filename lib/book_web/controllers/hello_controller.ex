defmodule BookWeb.HelloController do
  use BookWeb, :controller

  def world(conn, %{"name" => name}) do
    render(conn, "world.html", name: name)
  end
end
