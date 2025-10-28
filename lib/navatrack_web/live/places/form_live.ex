defmodule NavatrackWeb.Places.FormLive do
  use NavatrackWeb, :live_view
  alias Navatrack.Works.Place, as: X

  require Logger

  @doc """
  Mount the LiveView:
  - Update an item via an item id.
  - Create a new item.
  """

  def mount(%{"id" => id}, _session, socket) do
    form = AshPhoenix.Form.for_action(X, :update, domain: Navatrack.Works)
    x = Ash.get!(X, id)

    {:ok,
     assign(socket,
       page_title: "Edit #{X.title_case_singular()}",
       form: to_form(form),
       x: x
     )}
  end

  def mount(_params, _session, socket) do
    form = AshPhoenix.Form.for_create(X, :create)

    {:ok,
     assign(socket,
       page_title: "New #{X.title_case_singular()}",
       form: to_form(form)
     )}
  end

  @doc """
  Render.
  """
  def render(assigns) do
    ~H"""
    <Layouts.app {assigns}>
      <.header>
        {@page_title}
      </.header>

      <.form
        :let={form}
        id="x_form"
        for={@form}
        as={:form}
        phx-change="validate"
        phx-submit="save"
      >
        <h2 class="h2">Introduction</h2>

        <.input
          field={form[:name]}
          label="📛 Name"
          autofocus
        />
        <.input
          field={form[:sign]}
          label="🚦 Sign"
        />
        <.input
          field={form[:status]}
          label="📍 Status"
        />
        <.input
          field={form[:tagging]}
          label="🏷️ Tags"
        />
        <.input
          field={form[:note]}
          label="🗒️ Note"
        />

        <.section id="contacts" title="Contacts">

          <.input
            field={form[:web]}
            type="url"
            label="🌐 Web"
            placeholder="https://example.com"
          />
          <.input
            field={form[:email]}
            type="email"
            label="📧 Email"
            placeholder="example@example.com"
          />
          <.input
            field={form[:phone]}
            type="tel"
            label="📱 Phone"
            placeholder="+1-415-555-5555"
          />
          <.input
            field={form[:chat]}
            label="💬 Chat"
            placeholder=""
          />
          <.input
            field={form[:calendar]}
            label="🗓️ Calendar"
            placeholder=""
          />
          <.input
            field={form[:postal]}
            label="📫 Postal"
            placeholder="123 Main St, San Francisco, CA, US, 94100, US"
          />
          <.input
            field={form[:rdf_type]}
            label="🖇️ RDF Type"
          />
        </.section>

        <.section id="Socials" title="Socials">
          <.input
            field={form[:bluesky_as_url]}
            label="Bluesky URL"
            type="url"
            placeholder="https://bsky.app/profile/example"
          />
          <.input
            field={form[:codeberg_as_url]}
            label="Codeberg URL"
            type="url"
            placeholder="https://codeberg.com/example"
          />
          <.input
            field={form[:facebook_as_url]}
            label="Facebook URL"
            type="url"
            placeholder="https://facebook.com/example"
          />
          <.input
            field={form[:github_as_url]}
            label="GitHub URL"
            type="url"
            placeholder="https://github.com/in/example"
          />
          <.input
            field={form[:instagram_as_url]}
            label="Instagram URL"
            type="url"
            placeholder="https://instagram.com/example"
          />
          <.input
            field={form[:linkedin_as_url]}
            label="LinkedIn URL"
            type="url"
            placeholder="https://linkedin.com/in/example"
          />
          <.input
            field={form[:mastodon_as_url]}
            label="Mastodon URL"
            type="url"
            placeholder="https://mastodon.social/@xample"
          />
          <.input
            field={form[:orcid_as_url]}
            label="ORCID URL"
            type="url"
            placeholder="https://orcid.org/example"
          />
          <.input
            field={form[:tiktok_as_url]}
            label="TikTok URL"
            type="url"
            placeholder="https://tiktok.com/example"
          />
          <.input
            field={form[:wikipedia_as_url]}
            label="Wikipedia URL"
            type="url"
            placeholder="https://wikipedia.org/example"
          />
          <.input
            field={form[:youtube_as_url]}
            label="YouTube URL"
            type="url"
            placeholder="https://youtube.com/example"
          />
        </.section>


        <.section id="location" title="Location">
          <.input
            field={form[:location_iso_3166_1_alpha_2]}
            label="Country code (ISO 3166-1 Alpha 2)"
            placeholder="US"
          />
          <.input
            field={form[:location_iso_3166_2]}
            label="Subcountry code (ISO 3166-2)"
            placeholder="CA"
          />
          <.input
            field={form[:location_postal_code]}
            label="Postal code" placeholder="94100"
          />
          <.input
            field={form[:location_latitude_as_decimal_degrees]}
            label="Latitude"
            placeholder="37.7954"
          />
          <.input
            field={form[:location_longitude_as_decimal_degrees]}
            label="Longitude"
            placeholder="122.3936"
          />
          <.input
            field={form[:location_altitude_agl_as_meters]}
            label="Altitude above ground level as meters"
            placeholder="0"
          />
          <.input
            field={form[:location_altitude_msl_as_meters]}
            label="Altitude mean sea level as meters"
            placeholder="0"
          />
          <.input
            field={form[:location_elevation_agl_as_meters]}
            label="Elevation above ground level as meters"
            placeholder="0"
          />
          <.input
            field={form[:location_elevation_msl_as_meters]}
            label="Elevation mean sea level as meters"
            placeholder="0"
          />
          <.input
            field={form[:location_what3words]}
            label="What3Words.com"
            placeholder="alfa.bravo.charlie"
          />
          <.input
            field={form[:location_whatfreewords]}
            label="WhatFreeWords.org"
            placeholder="alfa.bravo.charlie"
          />
        </.section>

        <.section id="images" title="Images">

          <h3 class="h3">
            Avatar image 400x400
          </h3>

          <.input
            field={form[:avatar_image_400x400_url]}
            label="🔗 URL"
            placeholder="https://example.com"
          />
          <.input
            field={form[:avatar_image_400x400_alt]}
            label="Alt"
          />

          <h3 class="h3">
            Main image 1080x1080 square
          </h3>

          <.input
            field={form[:main_image_1080x1080_url]}
            label="🔗 URL"
            placeholder="https://example.com"
          />
          <.input
            field={form[:main_image_1080x1080_alt]}
            label="Alt"
          />

          <h3 class="h3">
            Main image 1920x1080 landscape
          </h3>

          <.input
            field={form[:main_image_1920x1080_url]}
            label="🔗 URL"
            placeholder="https://example.com"
          />
          <.input
            field={form[:main_image_1920x1080_alt]}
            label="Alt"
          />

          <h3 class="h3">
            Main image 1080x1920 portrait
          </h3>

          <.input
            field={form[:main_image_1080x1920_url]}
            label="🔗 URL"
            placeholder="https://example.com"
          />
          <.input
            field={form[:main_image_1080x1920_alt]}
            label="Alt"
          />
        </.section>

        <.button type="primary">Save</.button>
      </.form>
    </Layouts.app>
    """
  end

  @doc """
  Handle event:
    - update now to try to work around DaisyUI collapse bug
    - validate form data
    - save form data to the database
  """

  def handle_event("updater", _params, socket) do
    {:noreply, socket}
  end

  def handle_event("validate", %{"form" => form_data}, socket) do
    # form_data = convert_tags_param(form_data)
    {:noreply,
     update(
       socket,
       :form,
       fn form -> AshPhoenix.Form.validate(form, form_data) end
     )}
  end

  def handle_event("save", %{"form" => form_data}, socket) do
    # form_data = convert_tags_param(form_data)
    case AshPhoenix.Form.submit(socket.assigns.form, params: form_data) do
      {:ok, _x} ->
        {:noreply,
         socket
         |> put_flash(:info, "Saved.")
         |> push_navigate(to: path_index(X))}

      {:error, form} ->
        {:noreply,
         socket
         |> put_flash(:error, "Save failed.")
         |> assign(:form, form)}
    end
  end
end
