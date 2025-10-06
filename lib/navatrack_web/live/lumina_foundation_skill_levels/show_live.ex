defmodule NavatrackWeb.LuminaFoundationSkillLevels.ShowLive do
  use NavatrackWeb, :live_view
  alias Navatrack.Codes.LuminaFoundationSkillLevel, as: X

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
        {@x.name}
      </main>
    </Layouts.app>
    """
  end

end
