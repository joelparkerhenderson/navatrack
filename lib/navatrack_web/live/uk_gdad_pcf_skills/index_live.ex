defmodule NavatrackWeb.UkGdadPcfSkills.IndexLive do
  use NavatrackWeb, :live_view
  alias Navatrack.Codes.UkGdadPcfSkill, as: X

  require Logger

  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(:page_title, X.plural_title_case)

    {:ok, socket}
  end

  def handle_params(_params, _url, socket) do
    xx = X
    |> Ash.Query.for_read(:read)
    |> Ash.read!()

    {:noreply,
      socket
      |> assign(:page_title, X.plural_title_case)
      |> assign(:xx, xx)
    }
  end

  def render(assigns) do
    ~H"""
    <Layouts.app {assigns}>
      <.header>
        {@page_title}
      </.header>

      <.table id="xx" rows={@xx}>
          <:col :let={x} label="Id">
              <.link
                  navigate={Path.join(["/", X.plural_snake_case(), x.id])}
                  data-role="x-id"
              >
                  {x.id}
              </.link>
          </:col>
          <:col :let={x} label="Name">{x.name}</:col>
      </.table>
    </Layouts.app>
    """
  end

end
