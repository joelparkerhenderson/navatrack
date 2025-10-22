defmodule NavatrackWeb.Traits.ShowLive do
  use NavatrackWeb, :live_view
  alias Navatrack.Works.Trait, as: X

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
        <.section id="about" title="About">
          <ul>
            <li>Summary: {@x.summary_as_markdown}</li>
            <li>Description: {@x.description_as_markdown}</li>
          </ul>
        </.section>

        <.show_live_section_images x={@x} />

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
