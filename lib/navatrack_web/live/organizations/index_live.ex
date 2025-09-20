defmodule NavatrackWeb.Organizations.IndexLive do
  use NavatrackWeb, :live_view
  alias Navatrack.Accounts.Organization, as: X

  require Logger

  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(:page_title, "Organizations")

    {:ok, socket}
  end

  def handle_params(_params, _url, socket) do
    xx = X
    |> Ash.Query.for_read(:read)
    |> Ash.read!()

    {:noreply,
      socket
      |> assign(:page_title, "Organizations")
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
            navigate={~p"/#{X.plural_snake_case}/new"}
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
        <table>
          <tr :for={x <- @xx}>
            <.render_x x={x} />
          </tr>
        </table>
      <% end %>
    </Layouts.app>
    """
  end

  def render_x(assigns) do
    ~H"""
    <td>
      <.link
        navigate={~p"/#{X.plural_snake_case}/#{@x.id}"}
        data-role="x-title"
      >
        {@x.title}
      </.link>
    </td>
    <td>
      {@x.status}
    </td>
    <td>
      {@x.tags}
    </td>
    """
  end

end
