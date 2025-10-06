defmodule NavatrackWeb.IloIsco2008s.ShowLive do
  use NavatrackWeb, :live_view
  alias Navatrack.Codes.IloIsco2008, as: X

  require Logger

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def handle_params(%{"id" => id}, _url, socket) do
    x = Ash.get!(X, id)

    {:noreply,
      socket
      |> assign(:page_title, x.name)
      |> assign(:x, x)
    }
  end

  def render(assigns) do
    ~H"""
    <Layouts.app {assigns}>
      <.header>
        {@page_title}
      </.header>
      <main>
        <ul>
          <li>Id: {@x.id}</li>
          <li>Locale: {@x.locale_code}</li>
          <li>Code: {@x.name}</li>
          <li>Name: {@x.name}</li>
          <li>Definition: {@x.definition}</li>
        </ul>
      </main>
    </Layouts.app>
    """
  end

end
