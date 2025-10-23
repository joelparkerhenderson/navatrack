defmodule NavatrackWeb.Groups.ShowLive do
  use NavatrackWeb, :live_view
  alias Navatrack.Works.Group, as: X

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

        <.section id="links" title="Links">
          <p>🏠 Home: <a href={@x.home_emoji_url}>{@x.home_emoji_url}</a></p>
          <p>🛎️ Concierge: <a href={@x.bellhop_bell_emoji_url}>{@x.bellhop_bell_emoji_url}</a></p>
          <p>🎯 Target: <a href={@x.target_emoji_url}>{@x.target_emoji_url}</a></p>
          <p>⚙️ Technical Contact: <a href={@x.gear_emoji_url}>{@x.gear_emoji_url}</a></p>
          <p>🗓️ Calendar: <a href={@x.spiral_calendar_emoji_url}>{@x.spiral_calendar_emoji_url}</a></p>
          <p>✨ AI: <a href={@x.sparkles_emoji_url}>{@x.sparkles_emoji_url}</a></p>
          <p>💬 Chat: <a href={@x.speech_bubble_emoji_url}>{@x.speech_bubble_emoji_url}</a></p>
          <p>📰 News: <a href={@x.newspaper_emoji_url}>{@x.newspaper_emoji_url}</a></p>
          <p>📊 Charts: <a href={@x.bar_chart_emoji_url}>{@x.bar_chart_emoji_url}</a></p>
          <p>🎥 Videos: <a href={@x.movie_camera_emoji_url}>{@x.movie_camera_emoji_url}</a></p>
          <p>👷 Workers: <a href={@x.construction_worker_emoji_url}>{@x.construction_worker_emoji_url}</a></p>
          <p>🔮 Future: <a href={@x.crystal_ball_emoji_url}>{@x.crystal_ball_emoji_url}</a></p>
          <p>🦋 Feature Tracker: <a href={@x.butterfly_emoji_url}>{@x.butterfly_emoji_url}</a></p>
          <p>🐞 Bug Tracker: <a href={@x.lady_beetle_emoji_url}>{@x.lady_beetle_emoji_url}</a></p>
        </.section>

        <.section id="deeper_dive" title="Deeper Dive">
          <p>Note: {@x.note}</p>
          <p>Email distribution list: {@x.email_distribution_list}</p>
          <p>DaisyUI timeline HTML: {@x.daisyui_timeline_html}</p>
          <p>Org Mode: {@x.org_mode}</p>
          <p>Task list: {@x.task_list_as_markdown}</p>
          <p>Ways Of Working (WOW): {@x.ways_of_working_as_markdown}</p>
          <p>Objectives and Key Results (OKRs): {@x.objectives_and_key_results_as_markdown}</p>
          <p>Key Performance Indicators (KPIs): {@x.key_performance_indicators_as_markdown}</p>
        </.section>

        <.section id="business_analysis" title="Business Analysis">

          <h3 class="h3">
            GS1 Codes
          </h3>

          <p>GS1 digital link: {@x.gs1_digital_link}</p>
          <p>GS1 country code: {@x.gs1_country_code}</p>
          <p>GS1 global location number: {@x.gs1_global_location_number}</p>

          <h3 class="h3">
            International Standard Industrial Classification V4
          </h3>

          <p>ISIC v4 code: {@x.isic_v4_code}</p>
          <p>ISIC v4 name: {@x.isic_v4_name}</p>

          <h3 class="h3">
            Six-Pager Double-Sider
          </h3>

          <p>URL: <a href={@x.six_pager_double_sider_as_url}>{@x.six_pager_double_sider_as_url}</a></p>
          <p>Markdown: {@x.six_pager_double_sider_as_markdown}</p>

        </.section>

        <.section id="swot" title="SWOT: Strengths Weaknesses Opportunities Threats">

          <p>URL: <a href={@x.swot_as_url}>{@x.swot_as_url}</a></p>
          <p>Strengths: {@x.swot_strengths_as_markdown}</p>
          <p>Weaknesses: {@x.swot_weaknesses_as_markdown}</p>
          <p>Opportunities: {@x.swot_opportunities_as_markdown}</p>
          <p>Threats: {@x.swot_threats_as_markdown}</p>

        </.section>

        <.section id="sipoc" title="SIPOC: Suppliers Inputs Processes Outputs Customers">
          <p>URL: <a href={@x.sipoc_as_url}>{@x.sipoc_as_url}</a></p>
          <p>Suppliers: {@x.sipoc_suppliers_as_markdown}</p>
          <p>Inputs: {@x.sipoc_inputs_as_markdown}</p>
          <p>Processes: {@x.sipoc_processes_as_markdown}</p>
          <p>Outputs: {@x.sipoc_outputs_as_markdown}</p>
          <p>Customers: {@x.sipoc_customers_as_markdown}</p>

        </.section>

        <.section id="steeple" title="STEEPLE: Social Technological Economic Environmental Political Legal Ethical">

          <p>URL: <a href={@x.steeple_as_url}>{@x.steeple_as_url}</a></p>
          <p>Social: {@x.steeple_social_as_markdown}</p>
          <p>Technological: {@x.steeple_technological_as_markdown}</p>
          <p>Economic: {@x.steeple_economic_as_markdown}</p>
          <p>Environmental: {@x.steeple_environmental_as_markdown}</p>
          <p>Political: {@x.steeple_political_as_markdown}</p>
          <p>Legal: {@x.steeple_legal_as_markdown}</p>
          <p>Ethical: {@x.steeple_ethical_as_markdown}</p>

        </.section>

        <.section id="porters_five_forces" title="Porter's Five Forces">

          <p>URL: <a href={@x.porters_five_forces_as_url}>{@x.porters_five_forces_as_url}</a></p>
          <p>Threat Of Entrants: {@x.porters_five_forces_entrants_as_markdown}</p>
          <p>Threat Of Substitutes: {@x.porters_five_forces_substitutes_as_markdown}</p>
          <p>Bargaining Power Of Customers: {@x.porters_five_forces_customers_as_markdown}</p>
          <p>Bargaining Power Of Suppliers: {@x.porters_five_forces_suppliers_as_markdown}</p>
          <p>Rivalry Of Competitors: {@x.porters_five_forces_competitors_as_markdown}</p>

        </.section>

        <.section id="touchpoints" title="Touchpoints">

          <h3 class="h3">
            Glossary
          </h3>

          <p>URL: <a href={@x.glossary_as_url}>{@x.glossary_as_url}</a></p>
          <p>Markdown: {@x.glossary_as_markdown}</p>

          <h3 class="h3">
            Roles and Responsibilities
          </h3>

          <p>URL: <a href={@x.roles_and_responsibilities_as_url}>{@x.roles_and_responsibilities_as_url}</a></p>
          <p>Markdown: {@x.roles_and_responsibilities_as_markdown}</p>

          <h3 class="h3">
            Responsibility Assignment Matrix (RAM)
          </h3>

          <p>URL: <a href={@x.responsibility_assignment_matrix_as_url}>{@x.responsibility_assignment_matrix_as_url}</a></p>
          <p>Markdown: {@x.responsibility_assignment_matrix_as_markdown}</p>

        </.section>

        <.section id="explain" title="Explain">
          <p>Explain Stakeholders: {@x.explain_stakeholders_as_markdown}</p>
          <p>Explain History: {@x.explain_history_as_markdown}</p>
          <p>Explain Authentication: {@x.explain_authentication_as_markdown}</p>
          <p>Explain Authorization: {@x.explain_authorization_as_markdown}</p>
          <p>Explain Use Cases: {@x.explain_use_cases_as_markdown}</p>
          <p>Explain Demographics: {@x.explain_demographics_as_markdown}</p>
          <p>Explain UI: {@x.explain_ui_as_markdown}</p>
          <p>Explain API: {@x.explain_api_as_markdown}</p>
          <p>Explain Data: {@x.explain_data_as_markdown}</p>
          <p>Explain Mobile: {@x.explain_mobile_as_markdown}</p>
          <p>Explain Legal: {@x.explain_legal_as_markdown}</p>
          <p>Explain Financial: {@x.explain_financial_as_markdown}</p>
          <p>Explain Service Level Agreement (SLA): {@x.explain_service_level_agreement_as_markdown}</p>
          <p>Explain Disaster Recovery (DR): {@x.explain_disaster_recovery_as_markdown}</p>
        </.section>

        <.section id="net_promoter_score" title="Net Promoter Score (NPS)">

          <h3 class="h3">
            Customer Perspective
          </h3>

          <p>Actual Value: {@x.net_promoter_score_customer_perspective_actual}</p>
          <p>Target Value: {@x.net_promoter_score_customer_perspective_expect}</p>
          <p>Unit: {@x.net_promoter_score_customer_perspective_unit}</p>
          <p>Description: {@x.net_promoter_score_customer_perspective_description_as_markdown}</p>

          <h3 class="h3">
            User Perspective
          </h3>

          <p>Actual Value: {@x.net_promoter_score_user_perspective_actual}</p>
          <p>Target Value: {@x.net_promoter_score_user_perspective_expect}</p>
          <p>Unit: {@x.net_promoter_score_user_perspective_unit}</p>
          <p>Description: {@x.net_promoter_score_user_perspective_description_as_markdown}</p>

          <h3 class="h3">
            Worker Perspective
          </h3>

          <p>Actual Value: {@x.net_promoter_score_worker_perspective_actual}</p>
          <p>Target Value: {@x.net_promoter_score_worker_perspective_expect}</p>
          <p>Unit: {@x.net_promoter_score_worker_perspective_unit}</p>
          <p>Description: {@x.net_promoter_score_worker_perspective_description_as_markdown}</p>

        </.section>

        <.section id="user_metrics" title="User Metrics">

          <h3 class="h3">
            Active Users
          </h3>

          <p>Actual Value: {@x.active_users_actual}</p>
          <p>Target Value: {@x.active_users_expect}</p>
          <p>Unit: {@x.active_users_unit}</p>
          <p>Description: {@x.active_users_description}</p>

        </.section>

        <.section id="policies" title="Policies">

          <h3 class="h3">
            Code of Conduct Policy
          </h3>

          <p>URL: <a href={@x.code_of_conduct_policy_as_url}>{@x.code_of_conduct_policy_as_url}</a></p>
          <p>Markdown: {@x.code_of_conduct_policy_as_markdown}</p>

          <h3 class="h3">
            Coordinated Disclosure Policy
          </h3>

          <p>URL: <a href={@x.coordinated_disclosure_policy_as_url}>{@x.coordinated_disclosure_policy_as_url}</a></p>
          <p>Markdown: {@x.coordinated_disclosure_policy_as_markdown}</p>

          <h3 class="h3">
            Copyright Policy
          </h3>

          <p>URL: <a href={@x.copyright_policy_as_url}>{@x.copyright_policy_as_url}</a></p>
          <p>Markdown: {@x.copyright_policy_as_markdown}</p>

          <h3 class="h3">
            Corrections Policy
          </h3>

          <p>URL: <a href={@x.corrections_policy_as_url}>{@x.corrections_policy_as_url}</a></p>
          <p>Markdown: {@x.corrections_policy_as_markdown}</p>

          <h3 class="h3">
            Diversity Policy
          </h3>

          <p>URL: <a href={@x.diversity_policy_as_url}>{@x.diversity_policy_as_url}</a></p>
          <p>Markdown: {@x.diversity_policy_as_markdown}</p>

          <h3 class="h3">
            Equal Opportunity Policy
          </h3>

          <p>URL: <a href={@x.equal_opportunity_policy_as_url}>{@x.equal_opportunity_policy_as_url}</a></p>
          <p>Markdown: {@x.equal_opportunity_policy_as_markdown}</p>

          <h3 class="h3">
            Ethics Policy
          </h3>

          <p>URL: <a href={@x.ethics_policy_as_url}>{@x.ethics_policy_as_url}</a></p>
          <p>Markdown: {@x.ethics_policy_as_markdown}</p>

          <h3 class="h3">
            Legal Policy
          </h3>

          <p>URL: <a href={@x.legal_policy_as_url}>{@x.legal_policy_as_url}</a></p>
          <p>Markdown: {@x.legal_policy_as_markdown}</p>

          <h3 class="h3">
            License Policy
          </h3>

          <p>URL: <a href={@x.license_policy_as_url}>{@x.license_policy_as_url}</a></p>
          <p>Markdown: {@x.license_policy_as_markdown}</p>

          <h3 class="h3">
            Privacy Policy
          </h3>

          <p>URL: <a href={@x.privacy_policy_as_url}>{@x.privacy_policy_as_url}</a></p>
          <p>Markdown: {@x.privacy_policy_as_markdown}</p>

          <h3 class="h3">
            Security Policy
          </h3>

          <p>URL: <a href={@x.security_policy_as_url}>{@x.security_policy_as_url}</a></p>
          <p>Markdown: {@x.security_policy_as_markdown}</p>

          <h3 class="h3">
            Open Source Policy
          </h3>

          <p>URL: <a href={@x.open_source_policy_as_url}>{@x.open_source_policy_as_url}</a></p>
          <p>Markdown: {@x.open_source_policy_as_markdown}</p>

          <h3 class="h3">
            Safety Policy
          </h3>

          <p>URL: <a href={@x.safety_policy_as_url}>{@x.safety_policy_as_url}</a></p>
          <p>Markdown: {@x.safety_policy_as_markdown}</p>

          <h3 class="h3">
            Socials Policy
          </h3>

          <p>URL: <a href={@x.socials_policy_as_url}>{@x.socials_policy_as_url}</a></p>
          <p>Markdown: {@x.socials_policy_as_markdown}</p>

          <h3 class="h3">
            Staff Policy
          </h3>

          <p>URL: <a href={@x.staff_policy_as_url}>{@x.staff_policy_as_url}</a></p>
          <p>Markdown: {@x.staff_policy_as_markdown}</p>

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
