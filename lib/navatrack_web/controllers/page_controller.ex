defmodule NavatrackWeb.PageController do
  use NavatrackWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
