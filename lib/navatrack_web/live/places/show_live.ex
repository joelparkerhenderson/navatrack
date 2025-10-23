defmodule NavatrackWeb.Places.ShowLive do
  use NavatrackWeb, :live_view
  alias Navatrack.Works.Place, as: X

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
          <.button navigate={Path.join(["/", X.snake_case_plural(), @x.id, "edit"])}>
            Edit
          </.button>
        </:actions>
      </.header>
      <main>

        <.show_live_lede x={@x} />
        <.show_live_section_contact x={@x} />

        <.section id="charts" title="Chart">
          <p>URL: <a href={@x.apache_echart_as_url}>{@x.apache_echart_as_url}</a></p>
          <p>TypeScript: {@x.apache_echart_as_typescript}</p>
        </.section>

        <.show_live_section_socials x={@x} />

        <.section id="location" title="Location">
          <p>Country code ISO 3166-1 Alpha 2: {@x.location_iso_3166_1_alpha_2}</p>
          <p>Subcountry code ISO 3166-2: {@x.location_iso_3166_2}</p>
          <p>Postal code: {@x.location_postal_code}</p>
          <p>Latitude: {@x.location_latitude_as_decimal_degrees}</p>
          <p>Longitude: {@x.location_longitude_as_decimal_degrees}</p>
          <p>Altitude Above Ground Level: {@x.location_altitude_agl_as_meters}</p>
          <p>Altitude Mean Sea Level: {@x.location_altitude_msl_as_meters}</p>
          <p>Elevation Above Ground Level: {@x.location_elevation_agl_as_meters}</p>
          <p>Elevation Mean Sea Level: {@x.location_elevation_msl_as_meters}</p>
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
        Logger.warning("Delete failed for plan '#{id}':
          #{inspect(error)}")

        {:noreply,
         socket
         |> put_flash(:error, "Delete failed.")}
    end
  end
end
