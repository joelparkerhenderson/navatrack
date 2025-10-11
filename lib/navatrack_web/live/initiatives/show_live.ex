defmodule NavatrackWeb.Initiatives.ShowLive do
  use NavatrackWeb, :live_view
  alias Navatrack.Works.Initiative, as: X

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
          <.button navigate={Path.join(["/", X.plural_snake_case(), @x.id, "edit"])}>
            Edit
          </.button>
        </:actions>
      </.header>
      <main>

        <ul>
          <li>📛 Name: {@x.name}</li>
          <li>🚦 Status: {@x.status}</li>
          <li>🏷️ Tags: {@x.tagging}</li>
        </ul>

        <.section id="contact" title="Contact">
          <li>🔗 URL: {@x.url}</li>
          <li>📧 Email: {@x.email}</li>
          <li>📱 Phone: {@x.phone}</li>
          <li>💬 Messaging: {@x.messaging}</li>
          <li>📫 Postal: {@x.postal}</li>
          <li>🌺 ORCID PID: {@x.orcid_pid}</li>
          <li>🖇️ RDF Type: {@x.rdf_type}</li>
        </.section>

        <.section id="agents" title="AGENTS.md">
          <li>URL: {@x.agents_as_url}</li>
          <li>Markdown: {@x.agents_as_markdown}</li>
        </.section>

        <.section id="charts" title="Chart">
          <li>URL: {@x.apache_echart_as_url}</li>
          <li>TypeScript: {@x.apache_echart_as_typescript}</li>
        </.section>

        <.section id="socials" title="Socials">
          <ul>
            <li>LinkedIn URL: {@x.linkedin_url}</li>
            <li>GitHub URL: {@x.github_url}</li>
            <li>Codeberg URL: {@x.codeberg_url}</li>
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

        <.section id="links" title="Links">
          <ul>
            <li>🏠 Home: {@x.home_emoji_url}</li>
            <li>🛎️ Concierge: {@x.bellhop_bell_emoji_url}</li>
            <li>🎯 Target: {@x.target_emoji_url}</li>
            <li>⚙️ Technical Contact: {@x.gear_emoji_url}></li>
            <li>🗓️ Calendar: {@x.spiral_calendar_emoji_url}</li>
            <li>✨ AI: {@x.sparkles_emoji_url}</li>
            <li>💬 Chat: {@x.speech_bubble_emoji_url}</li>
            <li>📰 News: {@x.newspaper_emoji_url}</li>
            <li>📊 Charts: {@x.bar_chart_emoji_url}</li>
            <li>🎥 Videos: {@x.movie_camera_emoji_url}</li>
            <li>👷 Workers: {@x.construction_worker_emoji_url}</li>
            <li>🔮 Future: {@x.crystal_ball_emoji_url}</li>
            <li>🦋 Feature Tracker: {@x.butterfly_emoji_url}</li>
            <li>🐞 Bug Tracker: {@x.lady_beetle_emoji_url}</li>
          </ul>
        </.section>

        <.section id="deeper_dive" title="Deeper Dive">
          <ul>
            <li>Note: {@x.note}</li>
            <li>Email distribution list: {@x.email_distribution_list}</li>
            <li>DaisyUI timeline HTML: {@x.daisyui_timeline_html}</li>
            <li>Org Mode: {@x.org_mode}</li>
            <li>Task list: {@x.task_list_as_markdown}</li>
            <li>Ways Of Working (WOW): {@x.ways_of_working_as_markdown}</li>
            <li>Objectives and Key Results (OKRs): {@x.objectives_and_key_results_as_markdown}</li>
            <li>Key Performance Indicators (KPIs): {@x.key_performance_indicators_as_markdown}</li>
          </ul>
        </.section>

        <.section id="business_analysis" title="Business Analysis">

          <h3 class="h3">
            Six-Pager Double-Sider
          </h3>

          <ul>
            <li>URL: {@x.six_pager_double_sider_as_url}</li>
            <li>Markdown: {@x.six_pager_double_sider_as_markdown}</li>
          </ul>

        </.section>

        <.section id="swot" title="Strengths Weaknesses Opportunities Threats (SWOT)">

          <ul>
            <li>URL: {@x.swot_as_url}</li>
            <li>Strengths: {@x.swot_strengths_as_markdown}</li>
            <li>Weaknesses: {@x.swot_weaknesses_as_markdown}</li>
            <li>Opportunities: {@x.swot_opportunities_as_markdown}</li>
            <li>Threats: {@x.swot_threats_as_markdown}</li>
          </ul>

        </.section>

        <.section id="porters_five_forces" title="Porter's Five Forces">

          <ul>
            <li>URL: {@x.porters_five_forces_as_url}</li>
            <li>Threat Of Entrants: {@x.porters_five_forces_entrants_as_markdown}</li>
            <li>Threat Of Substitutes: {@x.porters_five_forces_substitutes_as_markdown}</li>
            <li>Bargaining Power Of Customers: {@x.porters_five_forces_customers_as_markdown}</li>
            <li>Bargaining Power Of Suppliers: {@x.porters_five_forces_suppliers_as_markdown}</li>
            <li>Rivalry Of Competitors: {@x.porters_five_forces_competitors_as_markdown}</li>
          </ul>

        </.section>

        <.section id="steeple" title="Social, Technological, Economic, Environmental, Political, Legal, Ethical (STEEPLE)">

          <ul>
            <li>URL: {@x.steeple_as_url}</li>
            <li>Social: {@x.steeple_social_as_markdown}</li>
            <li>Technological: {@x.steeple_technological_as_markdown}</li>
            <li>Economic: {@x.steeple_economic_as_markdown}</li>
            <li>Environmental: {@x.steeple_environmental_as_markdown}</li>
            <li>Political: {@x.steeple_political_as_markdown}</li>
            <li>Legal: {@x.steeple_legal_as_markdown}</li>
            <li>Ethical: {@x.steeple_ethical_as_markdown}</li>
          </ul>

        </.section>

        <.section id="touchpoints" title="Touchpoints">

          <h3 class="h3">
            Glossary
          </h3>

          <ul>
            <li>URL: {@x.glossary_as_url}</li>
            <li>Markdown: {@x.glossary_as_markdown}</li>
          </ul>

          <h3 class="h3">
            Roles and Responsibilities
          </h3>

          <ul>
            <li>URL: {@x.roles_and_responsibilities_as_url}</li>
            <li>Markdown: {@x.roles_and_responsibilities_as_markdown}</li>
          </ul>

          <h3 class="h3">
            Responsibility Assignment Matrix (RAM)
          </h3>

          <ul>
            <li>URL: {@x.responsibility_assignment_matrix_as_url}</li>
            <li>Markdown: {@x.responsibility_assignment_matrix_as_markdown}</li>
          </ul>

          <h3 class="h3">
            Code of Conduct
          </h3>

          <ul>
            <li>URL: {@x.code_of_conduct_url}</li>
            <li>Markdown: {@x.code_of_conduct_as_markdown}</li>
          </ul>

          <h3 class="h3">
            License
          </h3>

          <ul>
            <li>URL: {@x.license_url}</li>
            <li>Markdown: {@x.license_as_markdown}</li>
          </ul>

          </.section>

        <.section id="sipoc" title="Suppliers Inputs Processes Outputs Customers (SIPOC)">

        <h3 class="h3">
          Suppliers
        </h3>

          <ul>
            <li>URL: {@x.sipoc_suppliers_as_url}</li>
            <li>Markdown: {@x.sipoc_suppliers_as_markdown}</li>
          </ul>

          <h3 class="h3">
            Inputs
          </h3>

          <ul>
            <li>URL: {@x.sipoc_inputs_as_url}</li>
            <li>Markdown: {@x.sipoc_inputs_as_markdown}</li>
          </ul>

          <h3 class="h3">
            Processes
          </h3>

          <ul>
            <li>URL: {@x.sipoc_processes_as_url}</li>
            <li>Markdown: {@x.sipoc_processes_as_markdown}</li>
          </ul>

          <h3 class="h3">
            Outputs
          </h3>

          <ul>
            <li>URL: {@x.sipoc_outputs_as_url}</li>
            <li>Markdown: {@x.sipoc_outputs_as_markdown}</li>
          </ul>

          <h3 class="h3">
            Customers
          </h3>

          <ul>
            <li>URL: {@x.sipoc_customers_as_url}</li>
            <li>Markdown: {@x.sipoc_customers_as_markdown}</li>
          </ul>

        </.section>

        <.section id="arc42" title="Arc42">

          <ul>
            <li>URL: {@x.arc42_as_url}</li>
            <li>01: Introduction and Goals: {@x.arc42_01_introduction_and_goals_as_markdown}</li>
            <li>02: Constraints: {@x.arc42_02_constraints_as_markdown}</li>
            <li>03: Context and Scope: {@x.arc42_03_context_and_scope_as_markdown}</li>
            <li>04: Solution Strategy: {@x.arc42_04_solution_strategy_as_markdown}</li>
            <li>05: Building Block View: {@x.arc42_05_building_block_view_as_markdown}</li>
            <li>06: Runtime View: {@x.arc42_06_runtime_view_as_markdown}</li>
            <li>07: Deployment View: {@x.arc42_07_deployment_view_as_markdown}</li>
            <li>08: Crosscutting Concepts: {@x.arc42_08_crosscutting_concepts_as_markdown}</li>
            <li>09: Architectural Decisions: {@x.arc42_09_architectural_decisions_as_markdown}</li>
            <li>10: Quality Requirements: {@x.arc42_10_quality_requirements_as_markdown}</li>
            <li>11: Risks and Technical Debt: {@x.arc42_11_risks_and_technical_debt_as_markdown}</li>
            <li>12: Glossary: {@x.arc42_12_glossary_as_markdown}</li>
          </ul>

        </.section>

        <.section id="explain" title="Explain">
          <ul>
            <li>Explain Stakeholders: {@x.explain_stakeholders_as_markdown}</li>
            <li>Explain History: {@x.explain_history_as_markdown}</li>
            <li>Explain Authentication: {@x.explain_authentication_as_markdown}</li>
            <li>Explain Authorization: {@x.explain_authorization_as_markdown}</li>
            <li>Explain Use Cases: {@x.explain_use_cases_as_markdown}</li>
            <li>Explain Demographics: {@x.explain_demographics_as_markdown}</li>
            <li>Explain UI: {@x.explain_ui_as_markdown}</li>
            <li>Explain API: {@x.explain_api_as_markdown}</li>
            <li>Explain Data: {@x.explain_data_as_markdown}</li>
            <li>Explain Mobile: {@x.explain_mobile_as_markdown}</li>
            <li>Explain Legal: {@x.explain_legal_as_markdown}</li>
            <li>Explain Financial: {@x.explain_financial_as_markdown}</li>
            <li>Explain Service Level Agreement (SLA): {@x.explain_service_level_agreement_as_markdown}</li>
            <li>Explain Disaster Recovery (DR): {@x.explain_disaster_recovery_as_markdown}</li>
          </ul>
        </.section>

        <.section id="system_quality_attributes" title="System Quality Attributes (SQA)">
          <ul>
            <li>Availability: {@x.quality_availability_as_markdown}</li>
            <li>Certifiability: {@x.quality_certifiability_as_markdown}</li>
            <li>Compatibility: {@x.quality_compatibility_as_markdown}</li>
            <li>Efficiency: {@x.quality_efficiency_as_markdown}</li>
            <li>Governability: {@x.quality_governability_as_markdown}</li>
            <li>Maintainability: {@x.quality_maintainability_as_markdown}</li>
            <li>Observability: {@x.quality_observability_as_markdown}</li>
            <li>Operability: {@x.quality_operability_as_markdown}</li>
            <li>Recoverability: {@x.quality_recoverability_as_markdown}</li>
            <li>Scalability: {@x.quality_scalability_as_markdown}</li>
            <li>Security: {@x.quality_security_as_markdown}</li>
            <li>Suitability: {@x.quality_suitability_as_markdown}</li>
            <li>Testability: {@x.quality_testability_as_markdown}</li>
            <li>Transferability: {@x.quality_transferability_as_markdown}</li>
            <li>Translatability: {@x.quality_translatability_as_markdown}</li>
            <li>Warrantability: {@x.quality_warrantability_as_markdown}</li>
          </ul>
        </.section>

        <.section id="net_promoter_score" title="Net Promoter Score (NPS)">

          <h3 class="h3">
            Customer Perspective
          </h3>

          <ul>
            <li>Actual Value: {@x.net_promoter_score_customer_perspective_actual_value}</li>
            <li>Target Value: {@x.net_promoter_score_customer_perspective_target_value}</li>
            <li>Unit: {@x.net_promoter_score_customer_perspective_unit}</li>
            <li>Description: {@x.net_promoter_score_customer_perspective_description_as_markdown}</li>
          </ul>

          <h3 class="h3">
            User Perspective
          </h3>

          <ul>
            <li>Actual Value: {@x.net_promoter_score_user_perspective_actual_value}</li>
            <li>Target Value: {@x.net_promoter_score_user_perspective_target_value}</li>
            <li>Unit: {@x.net_promoter_score_user_perspective_unit}</li>
            <li>Description: {@x.net_promoter_score_user_perspective_description_as_markdown}</li>
          </ul>

          <h3 class="h3">
            Worker Perspective
          </h3>

          <ul>
            <li>Actual Value: {@x.net_promoter_score_worker_perspective_actual_value}</li>
            <li>Target Value: {@x.net_promoter_score_worker_perspective_target_value}</li>
            <li>Unit: {@x.net_promoter_score_worker_perspective_unit}</li>
            <li>Description: {@x.net_promoter_score_worker_perspective_description_as_markdown}</li>
          </ul>

        </.section>

        <.section id="user_metrics" title="User Metrics">

          <h3 class="h3">
            Active Users
          </h3>

          <ul>
            <li>Actual Value: {@x.active_users_actual_value}</li>
            <li>Target Value: {@x.active_users_target_value}</li>
            <li>Unit: {@x.active_users_unit}</li>
            <li>Description: {@x.active_users_description}</li>
          </ul>

          <h3 class="h3">
            Uptime Percentage
          </h3>

          <ul>
            <li>Actual Value: {@x.uptime_percentage_actual_value}</li>
            <li>Target Value: {@x.uptime_percentage_target_value}</li>
            <li>Unit: {@x.uptime_percentage_unit}</li>
            <li>Description: {@x.uptime_percentage_description}</li>
          </ul>

        </.section>

        <.section id="burn_rate" title="Burn Rate">

          <h3 class="h3">
            Net Cash Per Week
          </h3>

          <ul>
            <li>Actual Value: {@x.burn_rate_net_cash_per_week_actual_value}</li>
            <li>Target Value: {@x.burn_rate_net_cash_per_week_target_value}</li>
            <li>Unit: {@x.burn_rate_net_cash_per_week_unit}</li>
            <li>Description: {@x.burn_rate_net_cash_per_week_description}</li>
          </ul>

          <h3 class="h3">
            Net Hours Per Week
          </h3>

          <ul>
            <li>Actual Value: {@x.burn_rate_hours_per_week_actual_value}</li>
            <li>Target Value: {@x.burn_rate_hours_per_week_target_value}</li>
            <li>Unit: {@x.burn_rate_hours_per_week_unit}</li>
            <li>Description: {@x.burn_rate_hours_per_week_description}</li>
          </ul>

        </.section>

        <.section id="earned_value_management" title="Earned Value Management (EVM)">
          <ul>
            <li>Planned Value (PV): {@x.earned_value_management_planned_value}</li>
            <li>Earned Value (EV): {@x.earned_value_management_earned_value}</li>
            <li>Actual Cost (AC): {@x.earned_value_management_actual_cost}</li>
            <li>Cost Variance: {@x.earned_value_management_cost_variance}</li>
            <li>Cost Variance Ratio: {@x.earned_value_management_cost_variance_ratio}</li>
            <li>Cost Performance Index: {@x.earned_value_management_cost_performance_index}</li>
            <li>Schedule Variance: {@x.earned_value_management_schedule_variance}</li>
            <li>Schedule Variance Ratio: {@x.earned_value_management_schedule_variance_ratio}</li>
            <li>Schedule Performance Index: {@x.earned_value_management_schedule_performance_index}</li>
          </ul>
        </.section>

        <.section id="total_project_control" title="Total Project Control (TPC)">
          <ul>
            <li>DIPP: {@x.total_project_control_dipp}</li>
            <li>Progress Index (ratio): {@x.total_project_control_dipp_progress_index_ratio}</li>
            <li>Progress Index (numerator): {@x.total_project_control_dipp_progress_index_numerator}</li>
            <li>Progress Index (denominator): {@x.total_project_control_dipp_progress_index_denominator}</li>
            <li>Expected Monetary Value: {@x.total_project_control_expected_monetary_value}</li>
            <li>Cost Estimate To Complete: {@x.total_project_control_cost_estimate_to_complete}</li>
          </ul>
        </.section>

        <.section id="dora_metrics" title="DORA Metrics">

          <h3 class="h3">
            Deployment Frequency
          </h3>

          <ul>
            <li>Actual Value: {@x.deployment_frequency_actual_value}</li>
            <li>Target Value: {@x.deployment_frequency_target_value}</li>
            <li>Ratio: {@x.deployment_frequency_ratio}</li>
            <li>Unit: {@x.deployment_frequency_unit}</li>
            <li>Description: {@x.deployment_frequency_description}</li>
          </ul>

          <h3 class="h3">
            Lead Time For Changes
          </h3>

          <ul>
            <li>Actual Value: {@x.lead_time_for_changes_actual_value}</li>
            <li>Target Value: {@x.lead_time_for_changes_target_value}</li>
            <li>Unit: {@x.lead_time_for_changes_unit}</li>
            <li>Description: {@x.lead_time_for_changes_description}</li>
          </ul>

          <h3 class="h3">
            Change Failure Rate
          </h3>

          <ul>
            <li>Actual Value: {@x.change_failure_rate_actual_value}</li>
            <li>Target Value: {@x.change_failure_rate_target_value}</li>
            <li>Unit: {@x.change_failure_rate_unit}</li>
            <li>Description: {@x.change_failure_rate_description}</li>
          </ul>

          <h3 class="h3">
            Mean Time To Recovery
          </h3>

          <ul>
            <li>Actual Value: {@x.mean_time_to_recovery_actual_value}</li>
            <li>Target Value: {@x.mean_time_to_recovery_target_value}</li>
            <li>Unit: {@x.mean_time_to_recovery_unit}</li>
            <li>Description: {@x.mean_time_to_recovery_description}</li>
          </ul>

        </.section>

        <.section id="code_metrics" title="Code Metrics">

          <h3 class="h3">
            Maintainability Index
          </h3>

          <ul>
            <li>Actual Value: {@x.maintainability_index_actual_value}</li>
            <li>Target Value: {@x.maintainability_index_target_value}</li>
            <li>Ratio: {@x.maintainability_index_ratio}</li>
            <li>Unit: {@x.maintainability_index_unit}</li>
            <li>Description: {@x.maintainability_index_description}</li>
          </ul>

          <h3 class="h3">
            Line Count
          </h3>

          <ul>
            <li>Actual Value: {@x.line_count_actual_value}</li>
            <li>Target Value: {@x.line_count_target_value}</li>
            <li>Ratio: {@x.line_count_ratio}</li>
            <li>Unit: {@x.line_count_unit}</li>
            <li>Description: {@x.line_count_description}</li>
          </ul>

          <h3 class="h3">
            Test Automation Code Coverage
          </h3>

          <ul>
            <li>Actual Value: {@x.test_automation_code_coverage_actual_value}</li>
            <li>Target Value: {@x.test_automation_code_coverage_target_value}</li>
            <li>Ratio: {@x.test_automation_code_coverage_ratio}</li>
            <li>Unit: {@x.test_automation_code_coverage_unit}</li>
            <li>Description: {@x.test_automation_code_coverage_description}</li>
          </ul>

          <h3 class="h3">
            Halstead Complexity Volume
          </h3>

          <ul>
            <li>Actual Value: {@x.halstead_complexity_volume_actual_value}</li>
            <li>Target Value: {@x.halstead_complexity_volume_target_value}</li>
            <li>Ratio: {@x.halstead_complexity_volume_ratio}</li>
            <li>Unit: {@x.halstead_complexity_volume_unit}</li>
            <li>Description: {@x.halstead_complexity_volume_description}</li>
          </ul>

          <h3 class="h3">
            Halstead Complexity Difficulty
          </h3>

          <ul>
            <li>Actual Value: {@x.halstead_complexity_difficulty_actual_value}</li>
            <li>Target Value: {@x.halstead_complexity_difficulty_target_value}</li>
            <li>Ratio: {@x.halstead_complexity_difficulty_ratio}</li>
            <li>Unit: {@x.halstead_complexity_difficulty_unit}</li>
            <li>Description: {@x.halstead_complexity_difficulty_description}</li>
          </ul>

          <h3 class="h3">
            Halstead Complexity Effort
          </h3>

          <ul>
            <li>Actual Value: {@x.halstead_complexity_effort_actual_value}</li>
            <li>Target Value: {@x.halstead_complexity_effort_target_value}</li>
            <li>Ratio: {@x.halstead_complexity_effort_ratio}</li>
            <li>Unit: {@x.halstead_complexity_effort_unit}</li>
            <li>Description: {@x.halstead_complexity_effort_description}</li>
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
        Logger.warning("Delete failed for initiative '#{id}':
          #{inspect(error)}")

        {:noreply,
         socket
         |> put_flash(:error, "Delete failed.")}
    end
  end
end
