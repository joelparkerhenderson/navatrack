defmodule NavatrackWeb.Skills.IndexLive do
  use NavatrackWeb, :live_view
  alias Navatrack.Works.Skill, as: X

  require Logger

  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(:page_title, "Skills")

    {:ok, socket}
  end

  def handle_params(_params, _url, socket) do
    xx = X
    |> Ash.Query.for_read(:read)
    |> Ash.read!()

    {:noreply,
      socket
      |> assign(:page_title, "Skills")
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
            navigate={~p"/#{X.plural_snake_case()}/new"}
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
        <.table id="xx" rows={@xx}>
          <:col :let={x} label="id">
            <.link
              navigate={~p"/#{X.plural_snake_case()}/#{x.id}"}
              data-role="x-id"
            >
              {x.id}
            </.link>
          </:col>
          <:col :let={x} label="title">{x.title}</:col>
          <:col :let={x} label="status">{x.status}</:col>
          <:col :let={x} label="tags">{x.tags}</:col>
        </.table>
      <% end %>
    </Layouts.app>
    """
  end

end
