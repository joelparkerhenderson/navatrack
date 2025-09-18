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
            navigate={~p"/organizations/new"}
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
        <ul>
          <li :for={x <- @xx}>
            <.render_organization x={x} />
          </li>
        </ul>
      <% end %>
    </Layouts.app>
    """
  end

  def render_organization(assigns) do
    ~H"""
    <.link
      navigate={~p"/organizations/#{@x.id}"}
      data-role="x-name"
    >
      {@x.title}
    </.link>
    """
  end

end
