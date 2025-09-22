defmodule NavatrackWeb.ILOISCO2008s.IndexLive do
  use NavatrackWeb, :live_view
  alias Navatrack.Codes.ILOISCO2008, as: X

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
        <:actions>
          <.button
            navigate={Path.join(["/", X.plural_snake_case(), "new"])}
          >
            New
          </.button>
        </:actions>
      </.header>

      <%= if @xx == [] do %>
        <div>
          None.
        </div>
      <% else %>
        <Cinder.Table.table
          resource={X}
          row_click={fn x -> JS.navigate(path_show(x)) end}
        >
          <:col :let={x} field="id" sort search>
            <.link navigate={path_show(x)} data-role="x-id">➡️</.link>
          </:col>
          <:col :let={x} field="code" filter sort search>{x.code}</:col>
          <:col :let={x} field="title" filter sort search>{x.title}</:col>
          <:col :let={x} field="definition" filter sort search>{x.definition}</:col>
        </Cinder.Table.table>
      <% end %>
    </Layouts.app>
    """
  end

end
