defmodule NavatrackWeb.Users.ShowLive do
  use NavatrackWeb, :live_view
  alias Navatrack.Accounts.User, as: X

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
          <.button navigate={~p"/users/#{@x.id}/edit"}>
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
            <li>RDF type: {@x.rdf_type}</li>
            <li>LinkedIn URL: {@x.linkedin_url}</li>
            <li>GitHub URL: {@x.github_url}</li>
            <li>Codeberg URL: {@x.codeberg_url}</li>
          </ul>
        </.section>

        <.section id="location" title="Location">
          <ul>
            <li>ISO 3166-1 alpha 2: {@x.location_iso_3166_1_alpha_2}</li>
            <li>ISO 3166-2: {@x.location_iso_3166_2}</li>
            <li>Postal code: {@x.location_postal_code}</li>
            <li>Latitude as decimal degrees: {@x.location_latitude_as_decimal_degrees}</li>
            <li>Longitude as decimal degrees: {@x.location_longitude_as_decimal_degrees}</li>
          </ul>
        </.section>

        <.section id="about" title="About">
          <ul>
            <li>Note: {@x.note}</li>
            <li>DaisyUI timeline HTML: {@x.daisyui_timeline_html}</li>
            <li>Org mode: {@x.org_mode}</li>
            <li>Task list as markdown: {@x.task_list_as_markdown}</li>
            <li>Ways of working as markdown: {@x.ways_of_working_as_markdown}</li>
            <li>Objectives and Key Results (OKRs) as markdown: {@x.objectives_and_key_results_as_markdown}</li>
            <li>Key Performance Indicators (KPIs) as markdown: {@x.key_performance_indicators_as_markdown}</li>
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

        <.section id="work_profile" title="Work Profile">
          <ul>
            <li>Résumé as PDF URL: {@x.work_profile_resume_as_pdf_url}</li>
            <li>Résumé as markdown: {@x.work_profile_resume_as_markdown}</li>
            <li>Curriculum vitae as PDF URL: {@x.work_profile_curriculum_vitae_as_pdf_url}</li>
            <li>Curriculum vitae as markdown: {@x.work_profile_curriculum_vitae_as_markdown}</li>
          </ul>
        </.section>

        <.section id="work_role" title="Work Role">
          <ul>
            <li>Name: {@x.work_role_name}</li>
            <li>Start date: {@x.work_role_start_date}</li>
            <li>Stop date: {@x.work_role_stop_date}</li>
            <li>Level: {@x.work_role_level}</li>
            <li>Description as markdown: {@x.work_role_description_as_markdown}</li>
            <li>Professional development plan as markdown: {@x.work_role_professional_development_plan_as_markdown}</li>
            <li>Onet SOC 2019 code: {@x.work_role_onet_soc_2019_code}</li>
            <li>UK Civil Service Grade abbreviation: {@x.work_role_uk_civil_service_grade_abbreviation}</li>
            <li>UK SOC 2020 code: {@x.work_role_uk_soc_2020_code}</li>
            <li>UK GDAD PCF URL: {@x.work_role_uk_gdad_pcf_url}</li>
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
        Logger.warning("Delete failed for user '#{id}':
          #{inspect(error)}")

        {:noreply,
         socket
         |> put_flash(:error, "Delete failed.")}
    end
  end
end
