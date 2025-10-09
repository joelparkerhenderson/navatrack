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
            data-confirm={"Are you sure you want to delete #{@x.name}?"}
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
        <ul>
          <li>Id: {@x.id}</li>
          <li>Created at: {@x.created_at}</li>
          <li>Updated at: {@x.updated_at}</li>
          <li>Deleted at: {@x.deleted_at}</li>
          <li>Locale code: {@x.locale_code}</li>
          <li>📛 Name: {@x.name}</li>
          <li>🚦 Status: {@x.status}</li>
          <li>🏷️ Tags: {@x.tagging}</li>
        </ul>
        <.section id="about" title="About">
          <ul>
            <li>Summary: {@x.summary_as_markdown}</li>
            <li>Description: {@x.description_as_markdown}</li>
          </ul>
        </.section>

        <.section id="images" title="Images">

          <h3 class="h3">
            Avatar image 400x400
          </h3>

          <ul>
            <li>URL: {@x.avatar_image_400x400_url}</li>
            <li>Alt: {@x.avatar_image_400x400_alt}</li>
          </ul>

          <h3 class="h3">
            Main image 1080x1080 square
          </h3>

          <ul>
            <li>URL: {@x.main_image_1080x1080_url}</li>
            <li>Alt: {@x.main_image_1080x1080_alt}</li>
          </ul>

          <h3 class="h3">
            Main image 1920x1080 landscape
          </h3>

          <ul>
            <li>URL: {@x.main_image_1920x1080_url}</li>
            <li>Alt: {@x.main_image_1920x1080_alt}</li>
          </ul>

          <h3 class="h3">
            Main image 1080x1920 portrait
          </h3>

          <ul>
            <li>URL: {@x.main_image_1080x1920_url}</li>
            <li>Alt: {@x.main_image_1080x1920_alt}</li>
          </ul>

        </.section>

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
        Logger.warning("Delete failed for trait '#{id}':
          #{inspect(error)}")

        {:noreply,
         socket
         |> put_flash(:error, "Delete failed.")}
    end
  end
end
