defmodule NavatrackWeb.IloIsco2008s.IndexLive do
  use NavatrackWeb, :live_view
  alias Navatrack.Codes.IloIsco2008, as: X

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

      <Cinder.Table.table  theme={Cinder.Themes.Smart} resource={X}>
          <:col :let={x} field="id" sort search>
              <.link
                  navigate={Path.join(["/", X.plural_snake_case(), x.id])}
                  data-role="x-id"
              >
                  🔗
              </.link>
          </:col>
          <:col :let={x} field="code" sort search>{x.code}</:col>
          <:col :let={x} field="name" sort search>{x.name}</:col>
      </Cinder.Table.table>
    </Layouts.app>
    """
  end

end
