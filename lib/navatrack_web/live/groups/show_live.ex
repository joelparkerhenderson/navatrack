defmodule NavatrackWeb.Groups.ShowLive do
  use NavatrackWeb, :live_view
  alias Navatrack.Works.Group, as: X

  require Logger

  on_mount {NavatrackWeb.LiveUserAuth, :live_user_required}

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
          <.button navigate={Path.join(["/", X.plural_snake_case(), @x.id, "edit"])}>
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

        <.section id="contact" title="Contact">
          <ul>
            <li>URL: {@x.url}</li>
            <li>Email: {@x.email}</li>
            <li>Phone: {@x.phone}</li>
            <li>Messaging: {@x.messaging}</li>
            <li>Postal: {@x.postal}</li>
            <li>ORCID PID: {@x.orcid_pid}</li>
            <li>RDF Type: {@x.rdf_type}</li>
          </ul>
        </.section>

        <.section id="socials" title="Socials">
          <ul>
            <li>LinkedIn URL: {@x.linkedin_url}</li>
            <li>GitHub URL: {@x.github_url}</li>
            <li>Codeberg URL: {@x.codeberg_url}</li>
          </ul>
        </.section>

        <.section id="location" title="Locations">
          <ul>
            <li>Country code ISO 3166-1 Alpha 2: {@x.location_iso_3166_1_alpha_2}</li>
            <li>Subcountry code ISO 3166-2: {@x.location_iso_3166_2}</li>
            <li>location_postal_code: {@x.location_postal_code}</li>
            <li>Latitude: {@x.location_latitude_as_decimal_degrees}</li>
            <li>Longitude: {@x.location_longitude_as_decimal_degrees}</li>
          </ul>
        </.section>

        <.section id="agents" title="AGENTS.md">
          <ul>
            <li>URL: {@x.agents_as_url}</li>
            <li>Markdown: {@x.agents_as_markdown}</li>
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

        <.section id="deeper_dive" title="Deeper Dive">
          <ul>
            <li>Note: {@x.note}</li>
            <li>DaisyUI timeline html: {@x.daisyui_timeline_html}</li>
            <li>Org mode: {@x.org_mode}</li>
            <li>Task list: {@x.task_list_as_markdown}</li>
            <li>Ways of Working: {@x.ways_of_working_as_markdown}</li>
            <li>Objectives and Key Results (OKRs): {@x.objectives_and_key_results_as_markdown}</li>
            <li>Key Performance Indicators (KPIs): {@x.key_performance_indicators_as_markdown}</li>
          </ul>
        </.section>

        <.section id="gs1" title="GS1 codes">
          <ul>
            <li>GS1 digital link: {@x.gs1_digital_link}</li>
            <li>GS1 country code: {@x.gs1_country_code}</li>
            <li>GS1 global location number: {@x.gs1_global_location_number}</li>
          </ul>
        </.section>

        <.section id="isic_v4" title="International Standard Industrial Classification V4">
          <ul>
            <li>ISIC v4 code: {@x.isic_v4_code}</li>
            <li>ISIC v4 name: {@x.isic_v4_name}</li>
          </ul>
        </.section>

        <.section id="policies" title="Policies">
          <h3 class="h3">
            Ethics Policy
          </h3>

          <ul>
            <li>URL: {@x.ethics_policy_as_url}</li>
            <li>Markdown: {@x.ethics_policy_as_markdown}</li>
          </ul>

          <h3 class="h3">
            Copyright Policy
          </h3>

          <ul>
            <li>URL: {@x.copyright_policy_as_url}</li>
            <li>Markdown: {@x.copyright_policy_as_markdown}</li>
          </ul>

          <h3 class="h3">
            Corrections Policy
          </h3>

          <ul>
            <li>URL: {@x.corrections_policy_as_url}</li>
            <li>Markdown: {@x.corrections_policy_as_markdown}</li>
          </ul>

          <h3 class="h3">
            Legal Policy
          </h3>

          <ul>
            <li>URL: {@x.legal_policy_as_url}</li>
            <li>Markdown: {@x.legal_policy_as_markdown}</li>
          </ul>

          <h3 class="h3">
            Privacy Policy
          </h3>

          <ul>
            <li>URL: {@x.privacy_policy_as_url}</li>
            <li>Markdown: {@x.privacy_policy_as_markdown}</li>
          </ul>

          <h3 class="h3">
            Security Policy
          </h3>

          <ul>
            <li>URL: {@x.security_policy_as_url}</li>
            <li>Markdown: {@x.security_policy_as_markdown}</li>
          </ul>

          <h3 class="h3">
            Coordinated Disclosure Policy
          </h3>

          <ul>
            <li>URL: {@x.coordinated_disclosure_policy_as_url}</li>
            <li>Markdown: {@x.coordinated_disclosure_policy_as_markdown}</li>
          </ul>

          <h3 class="h3">
            Open Source Policy
          </h3>

          <ul>
            <li>URL: {@x.open_source_policy_as_url}</li>
            <li>Markdown: {@x.open_source_policy_as_markdown}</li>
          </ul>

          <h3 class="h3">
            Code of Conduct Policy
          </h3>

          <ul>
            <li>URL: {@x.code_of_conduct_policy_as_url}</li>
            <li>Markdown: {@x.code_of_conduct_policy_as_markdown}</li>
          </ul>

          <h3 class="h3">
            Equal Opportunity Policy
          </h3>

          <ul>
            <li>URL: {@x.equal_opportunity_policy_as_url}</li>
            <li>Markdown: {@x.equal_opportunity_policy_as_markdown}</li>
          </ul>

          <h3 class="h3">
            Social Network Policy
          </h3>

          <ul>
            <li>URL: {@x.social_network_policy_as_url}</li>
            <li>Markdown: {@x.social_network_policy_as_markdown}</li>
          </ul>

          <h3 class="h3">
            Health &amp; Safety Policy
          </h3>

          <ul>
            <li>URL: {@x.health_and_safety_policy_as_url}</li>
            <li>Markdown: {@x.health_and_safety_policy_as_markdown}</li>
          </ul>

          <h3 class="h3">
            Employee Handbook Policy
          </h3>

          <ul>
            <li>URL: {@x.employee_handbook_policy_as_url}</li>
            <li>Markdown: {@x.employee_handbook_policy_as_markdown}</li>
          </ul>

          <h3 class="h3">
            Human Resources Policy
          </h3>

          <ul>
            <li>URL: {@x.human_resources_policy_as_url}</li>
            <li>Markdown: {@x.human_resources_policy_as_markdown}</li>
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
        Logger.warning("Delete failed for group '#{id}':
          #{inspect(error)}")

        {:noreply,
         socket
         |> put_flash(:error, "Delete failed.")}
    end
  end
end
