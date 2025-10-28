defmodule NavatrackWeb.EventReviews.ShowLive do
  use NavatrackWeb, :live_view
  alias Navatrack.Works.EventReview, as: X

  require Logger

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def handle_params(%{"id" => id}, _url, socket) do
    x = Ash.get!(X, id)

    {:noreply,
     socket
     |> assign(:page_title, x.name)
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
          <.button navigate={~p"/traits/#{@x.id}/edit"}>
            Edit
          </.button>
        </:actions>
      </.header>
      <main>
        <.show_live_lede x={@x} />
        <ul>
          <li>From: {@x.by_user_id}</li>
          <li>To: {@x.to_event_id}</li>
        </ul>
        <ul>
          <li>What is the person&#39;s key strength? {@x.strength}</li>
          <li>What should the person start doing in order to be effective? {@x.start}</li>
          <li>What should the person stop doing in order to be effective? {@x.stop}</li>
          <li>What should the person continue doing in order to be effective? {@x.continue}</li>
          <li>What should the person change doing in order to be effective? {@x.change}</li>
          <li>What more advice can help them? {@x.advice}</li>
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
