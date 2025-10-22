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
            data-confirm={"Are you sure you want to delete?"}
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

        <.show_live_lede x={@x} />
        <.show_live_section_contact x={@x} />
        <.show_live_section_socials x={@x} />

        <.section id="location" title="Location">
          <p>ISO 3166-1 alpha 2: {@x.location_iso_3166_1_alpha_2}</p>
          <p>ISO 3166-2: {@x.location_iso_3166_2}</p>
          <p>Postal code: {@x.location_postal_code}</p>
          <p>Latitude as decimal degrees: {@x.location_latitude_as_decimal_degrees}</p>
          <p>Longitude as decimal degrees: {@x.location_longitude_as_decimal_degrees}</p>
        </.section>

        <.section id="deeper_dive" title="Deeper Dive">
          <p>Email distribution list: {@x.email_distribution_list}</p>
          <p>DaisyUI timeline HTML: {@x.daisyui_timeline_html}</p>
          <p>Org mode: {@x.org_mode}</p>
          <p>Task list as markdown: {@x.task_list_as_markdown}</p>
          <p>Ways of working as markdown: {@x.ways_of_working_as_markdown}</p>
          <p>Objectives and Key Results (OKRs) as markdown: {@x.objectives_and_key_results_as_markdown}</p>
          <p>Key Performance Indicators (KPIs) as markdown: {@x.key_performance_indicators_as_markdown}</p>
        </.section>

        <.show_live_section_images x={@x} />

        <.section id="ideals" title="Ideals">
          <p>Purpose Statement: {@x.purpose_statement}</p>
          <p>Vision Statement: {@x.vision_statement}</p>
          <p>Mission Statement: {@x.mission_statement}</p>
          <p>Values Statement: {@x.values_statement}</p>
        </.section>

        <.section id="ai" title="AI Agent Instructions">
          <p>URL: <a href={@x.ai_agent_instructions_as_url}>{@x.ai_agent_instructions_as_url}</a></p>
          <p>Markdown: {@x.ai_agent_instructions_as_markdown}</p>
        </.section>

        <.section id="work_profile" title="Work Profile">
          <p>Résumé as PDF URL: <a href={@x.work_profile_resume_as_pdf_url}>{@x.work_profile_resume_as_pdf_url}</a></p>
          <p>Résumé as markdown: {@x.work_profile_resume_as_markdown}</p>
          <p>Curriculum vitae as PDF URL: <a href={@x.work_profile_curriculum_vitae_as_pdf_url}>{@x.work_profile_curriculum_vitae_as_pdf_url}</a></p>
          <p>Curriculum vitae as markdown: {@x.work_profile_curriculum_vitae_as_markdown}</p>
        </.section>

        <.section id="work_role" title="Work Role">
          <p>Name: {@x.work_role_name}</p>
          <p>Start date: {@x.work_role_start_date}</p>
          <p>Stop date: {@x.work_role_stop_date}</p>
          <p>Level: {@x.work_role_level}</p>
          <p>Description as markdown: {@x.work_role_description_as_markdown}</p>
          <p>Professional development plan as markdown: {@x.work_role_professional_development_plan_as_markdown}</p>
          <p>Onet SOC 2019 code: {@x.work_role_onet_soc_2019_code}</p>
          <p>UK Civil Service Grade abbreviation: {@x.work_role_uk_civil_service_grade_abbreviation}</p>
          <p>UK SOC 2020 code: {@x.work_role_uk_soc_2020_code}</p>
          <p>UK GDAD PCF URL: <a href={@x.work_role_uk_gdad_pcf_url}>{@x.work_role_uk_gdad_pcf_url}</a></p>
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
