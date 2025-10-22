defmodule NavatrackWeb.AccessAssignments.ShowLive do
  use NavatrackWeb, :live_view
  alias Navatrack.Accounts.AccessAssignment, as: X

  require Logger

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def handle_params(%{"id" => id}, _url, socket) do
    x = Ash.get!(X, id)

    {:noreply,
     socket
     |> assign(:page_title, "#{X} #{id}")
     |> assign(:x, x)}
  end

  def render(assigns) do
    ~H"""
    <Layouts.app {assigns}>
      <.header>
        {@page_title}
        <:actions>
          <.button
            data-confirm={"Are you sure you want to delete?"}
            phx-click={"delete-#{@x.id}"}
          >
            Delete
          </.button>
          <.button navigate={~p"/access_assignments/#{@x.id}/edit"}>
            Edit
          </.button>
        </:actions>
      </.header>
      <main>
        <ul>
          <li>Id: <%= @x.id %></li>
          <li>User Id: <%= @x.user_id %></li>
          <li>Access Attribute Id: <%= @x.access_attribute_id %></li>
        </ul>
      </main>
    </Layouts.app>
    """
  end

  def handle_event("delete-" <> id, _params, socket) do
    case Ash.get!(X, id) |> Ash.destroy() do
      :ok ->
        {:noreply,
         socket
         |> put_flash(:info, "Deleted.")
         |> push_navigate(to: path_index(X))}

      {:error, error} ->
        Logger.warning("Delete failed for #{X} #{id}:
          #{inspect(error)}")

        {:noreply,
         socket
         |> put_flash(:error, "Delete failed.")}
    end
  end
end
