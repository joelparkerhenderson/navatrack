defmodule NavatrackWeb.Users.IndexLive do
  use NavatrackWeb, :live_view
  alias Navatrack.Accounts.User, as: X

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
            navigate={~p"/users/new"}
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
          <:col :let={x} field="sign" filter sort search>{x.sign}</:col>
          <:col :let={x} field="email" filter sort search>{x.email}</:col>
          <:col :let={x} field="status" filter sort search>{x.status}</:col>
          <:col :let={x} field="tags" filter sort search>{x.tags}</:col>
        </Cinder.Table.table>
      <% end %>
    </Layouts.app>
    """
  end

end
