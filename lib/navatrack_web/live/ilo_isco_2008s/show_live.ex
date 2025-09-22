defmodule NavatrackWeb.ILOISCO2008s.ShowLive do
  use NavatrackWeb, :live_view
  alias Navatrack.Codes.ILOISCO2008, as: X

  require Logger

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def handle_params(%{"id" => id}, _url, socket) do
    x = Ash.get!(X, id)

    {:noreply,
      socket
      |> assign(:page_title, x.title)
      |> assign(:x, x)
    }
  end

  def render(assigns) do
    ~H"""
    <Layouts.app {assigns}>
      <.header>
        {@page_title}
        <:actions>
          <.button
            data-confirm={"Are you sure you want to delete #{@x.title}?"}
            phx-click={"delete-#{@x.id}"}
          >
            Delete
          </.button>
          <.button
            navigate={~p"/skills/#{@x.id}/edit"}
          >
            Edit
          </.button>
        </:actions>
      </.header>
      <main>
        {@x.title}
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
         |> push_navigate(to: path_index(X))
        }
      {:error, error} ->
          Logger.warning("Delete failed for skill '#{id}':
          #{inspect(error)}")
          {:noreply,
            socket
            |> put_flash(:error, "Delete failed.")
          }
    end
  end

end
