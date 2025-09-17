defmodule NavatrackWeb.Products.IndexLive do
  use NavatrackWeb, :live_view
  alias Navatrack.Works.Product, as: X

  require Logger

  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(:page_title, "Products")

    {:ok, socket}
  end

  def handle_params(_params, _url, socket) do
    xx = X
    |> Ash.Query.for_read(:read)
    |> Ash.read!()

    {:noreply,
      socket
      |> assign(:page_title, "Products")
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
            navigate={~p"/products/new"}
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
            <.render_product x={x} />
          </li>
        </ul>
      <% end %>
    </Layouts.app>
    """
  end

  def render_product(assigns) do
    ~H"""
    <.link
      navigate={~p"/products/#{@x.id}"}
      data-role="x-name"
    >
      {@x.title}
    </.link>
    """
  end

end
