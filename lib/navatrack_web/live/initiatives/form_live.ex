defmodule NavatrackWeb.Initiatives.FormLive do
  use NavatrackWeb, :live_view
  alias Navatrack.Works.Initiative, as: X

  require Logger

  @doc """
  Mount the LiveView:
  - Update an item via an item id.
  - Create a new item.
  """

  def mount(%{"id" => id}, _session, socket) do
    form = AshPhoenix.Form.for_create(X, :edit)
    x = Ash.get!(X, id)

    {:ok, assign(socket,
      page_title: "Update #{X.singular_title_case}",
      form: to_form(form),
      x: x
    )}
  end

  def mount(_params, _session, socket) do
    form = AshPhoenix.Form.for_create(X, :create)

    {:ok, assign(socket,
      page_title: "Create #{X.singular_title_case}",
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

        <.input field={form[:sign]} label="Sign" type="select"
          options={["🆘", "⚠️", "✅", "⚪️", "🔴", "🟠", "🟡", "🟢", "🔵", "🟣"]}
          value="⚪️"
        />
        <.input field={form[:kind]} label="Kind" type="select"
          options={["Plan", "Practice", "Process", "Proof", "Product", "Project", "Programme", "Portfolio"]}
          value="Plan"
        />
        <.input field={form[:title]} label="name" autofocus />
        <.input field={form[:status]} label="Status" />
        <.input
          field={form[:tags]}
          label="Tags"
          value={
            case @form[:tags].value do
              tags when is_list(tags) -> tags
              tags when is_binary(tags) -> [tags]
              _ -> ""
            end
          }
        />

        <.section id="contact" title="Tracking">
          <.input field={form[:sign]} label="Sign (one character such as an emoji)" />
        </.section>

        <.section id="contact" title="Contacts">
          <.input field={form[:url]} type="url" label="URL" placeholder="https://example.com" />
          <.input field={form[:email]} type="email" label="Email" placeholder="example@example.com" />
          <.input field={form[:phone]} type="tel" label="Phone" placeholder="+1-415-555-5555"/>
          <.input field={form[:messaging]} label="Messaging" placeholder="https://bsky.app/profile/example"/>
          <.input field={form[:postal]} label="Postal" placeholder="123 Main St, San Francisco, CA, US, 94100, US"/>
          <.input field={form[:orcid_pid]} label="ORCID PID" placeholder="0009-0000-4681-282X" />
          <.input field={form[:rdf_type]} label="RDF Type" />
        </.section>

        <.section id="agents" title="AGENTS.md">
          <.input field={form[:agents_as_url]} type="url" label="URL" placeholder="https://example.com"/>
          <.input field={form[:agents_as_markdown]} type="textarea" label="Text" />
        </.section>

        <.section id="charts" title="Chart">
          <.input field={form[:apache_echart_as_url]} type="url" label="URL" placeholder="https://example.com" />
          <.input field={form[:apache_echart_as_typescript]} label="TypeScript" />
        </.section>

        <.section id="images" title="Images">

          <h3 class="h3">Avatar 400x400</h3>

          <.input field={form[:avatar_image_400x400_url]} label="URL" placeholder="https://example.com" />
          <.input field={form[:avatar_image_400x400_alt]} label="Alt" />

          <h3 class="h3">Splash 1080x1080 square</h3>

          <.input field={form[:main_image_1080x1080_url]} label="URL" placeholder="https://example.com" />
          <.input field={form[:main_image_1080x1080_alt]} label="Alt" />

          <h3 class="h3">Splash 1920x1080 landscape</h3>

          <.input field={form[:main_image_1920x1080_url]} label="URL" placeholder="https://example.com" />
          <.input field={form[:main_image_1920x1080_alt]} label="Alt" />

          <h3 class="h3">Splash 1920x1080 portrait</h3>

          <.input field={form[:main_image_1080x1920_url]} label="URL" placeholder="https://example.com" />
          <.input field={form[:main_image_1080x1920_alt]} label="Alt" />

        </.section>

        <.section id="links" title="Links">

          <.input field={form[:home_emoji_url]} label="🏠 Home" placeholder="https://example.com" />
          <.input field={form[:bellhop_bell_emoji_url]} label="🛎️ Concierge" placeholder="https://example.com" />
          <.input field={form[:target_emoji_url]} label="🎯 Target" placeholder="https://example.com" />
          <.input field={form[:gear_emoji_url]} label="⚙️ Technical Contact" placeholder="https://example.com" />
          <.input field={form[:spiral_calendar_emoji_url]} label="🗓️ Calendar" placeholder="https://example.com" />
          <.input field={form[:sparkles_emoji_url]} label="✨ AI" placeholder="https://example.com" />
          <.input field={form[:speech_bubble_emoji_url]} label="💬 Chat" placeholder="https://example.com" />
          <.input field={form[:newspaper_emoji_url]} label="📰 News" placeholder="https://example.com" />
          <.input field={form[:bar_chart_emoji_url]} label="📊 Charts" placeholder="https://example.com" />
          <.input field={form[:movie_camera_emoji_url]} label="🎥 Videos" placeholder="https://example.com" />
          <.input field={form[:construction_worker_emoji_url]} label="👷 Contruction Worker" placeholder="https://example.com" />
          <.input field={form[:crystal_ball_emoji_url]} label="🔮 Future" placeholder="https://example.com" />
          <.input field={form[:butterfly_emoji_url]} label="🦋 Feature Tracker" placeholder="https://example.com" />
          <.input field={form[:lady_beetle_emoji_url]} label="🐞 Bug Tracker" placeholder="https://example.com" />

        </.section>

        <.section id="deeper_dive" title="Deeper Dive">

          <.input field={form[:note]} label="Note" />
          <.input field={form[:email_distribution_list]} label="Email distribution list" />
          <.input field={form[:daisyui_timeline_html]} label="DaisyUI timeline HTML" />
          <.input field={form[:org_mode]} label="Org Mode" />
          <.input field={form[:task_list_as_markdown]} type="textarea" label="Task list as markdown" />
          <.input field={form[:ways_of_working_as_markdown]} type="textarea" label="Ways Of Working " />
          <.input field={form[:objectives_and_key_results_as_markdown]} type="textarea" label="Objectives and Key Results (OKRs) " />
          <.input field={form[:key_performance_indicators_as_markdown]} type="textarea" label="Key Performance Indicators (KPIs) " />

        </.section>

        <.section id="business_analysis" title="Business Analysis">

          <h3 class="h3">Six-Pager Double-Sider</h3>

          <.input field={form[:six_pager_as_url]} type="url" label="URL" placeholder="https://example.com" />
          <.input field={form[:six_pager_as_markdown]} type="textarea" label="Text" />

          <h3 class="h3">Strengths Weaknesses Opportunities Threats (SWOT)</h3>

          <.input field={form[:swot_as_url]} type="url" label="URL" placeholder="https://example.com" />
          <.input field={form[:swot_as_markdown]} type="textarea" label="Text" />

          <h3 class="h3">Porter's Five Forces</h3>

          <.input field={form[:porters_five_forces_as_url]} type="url" label="URL" placeholder="https://example.com" />
          <.input field={form[:porters_five_forces_as_markdown]} type="textarea" label="Text" />

          <h3 class="h3">Political, Economic, Social, Technological, Legal, Environmental (PESTLE)</h3>

          <.input field={form[:pestle_as_url]} type="url" label="URL" placeholder="https://example.com" />
          <.input field={form[:pestle_as_markdown]} type="textarea" label="Text" />

        </.section>

        <.section id="touchpoints" title="Touchpoints">

          <h3 class="h3">Glossary</h3>

          <.input field={form[:glossary_as_url]} type="url" label="URL" placeholder="https://example.com" />
          <.input field={form[:glossary_as_markdown]} type="textarea" label="Text" />

          <h3 class="h3">Roles and Responsibilities</h3>

          <.input field={form[:roles_and_responsibilities_as_url]} type="url" label="URL" placeholder="https://example.com" />
          <.input field={form[:roles_and_responsibilities_as_markdown]} type="textarea" label="Text" />

          <h3 class="h3">Responsibility Assignment Matrix (RAM)</h3>

          <.input field={form[:responsibility_assignment_matrix_as_url]} type="url" label="URL" placeholder="https://example.com" />
          <.input field={form[:responsibility_assignment_matrix_as_markdown]} type="textarea" label="Text" />

          <h3 class="h3">Code of Conduct</h3>

          <.input field={form[:code_of_conduct_url]} label="URL" placeholder="https://example.com" />
          <.input field={form[:code_of_conduct_as_markdown]} type="textarea" label="Text" />

          <h3 class="h3">License</h3>

          <.input field={form[:license_url]} label="URL" placeholder="https://example.com" />
          <.input field={form[:license_as_markdown]} type="textarea" label="Text" />

        </.section>

        <.section id="arc42" title="Arc42">

          <h3 class="h3">Arc42 full documentation</h3>

          <.input field={form[:arc42_as_url]} type="url" label="URL" placeholder="https://example.com" />
          <.input field={form[:arc42_as_markdown]} type="textarea" label="Text" />

          <h3 class="h3">Arc42 sections</h3>

          <.input field={form[:arc42_01_introduction_and_goals_as_markdown]} type="textarea" label="Arc42 section 01: Introduction and Goals " />
          <.input field={form[:arc42_02_constraints_as_markdown]} type="textarea" label="Arc42 section 02: Constraints " />
          <.input field={form[:arc42_03_context_and_scope_as_markdown]} type="textarea" label="Arc42 section 03: Context and Scope " />
          <.input field={form[:arc42_04_solution_strategy_as_markdown]} type="textarea" label="Arc42 section 04: Solution Strategy " />
          <.input field={form[:arc42_05_building_block_view_as_markdown]} type="textarea" label="Arc42 section 05: Building Block View " />
          <.input field={form[:arc42_06_runtime_view_as_markdown]} type="textarea" label="Arc42 section 06: Runtime View " />
          <.input field={form[:arc42_07_deployment_view_as_markdown]} type="textarea" label="Arc42 section 07: Deployment View " />
          <.input field={form[:arc42_08_crosscutting_concepts_as_markdown]} type="textarea" label="Arc42 section 08: Crosscutting Concerns " />
          <.input field={form[:arc42_09_architectural_decisions_as_markdown]} type="textarea" label="Arc42 section 09: Architectural Decisions " />
          <.input field={form[:arc42_10_quality_requirements_as_markdown]} type="textarea" label="Arc42 section 10: Quality Requirements" />
          <.input field={form[:arc42_11_risks_and_technical_debt_as_markdown]} type="textarea" label="Arc42 section 11: Risks and Technical Debt" />
          <.input field={form[:arc42_12_glossary_as_markdown]} type="textarea" label="Arc42 section 12: Glossary" />

        </.section>

        <.section id="explain" title="Explain To Joiners">

          <.input field={form[:explain_stakeholders_as_markdown]} type="textarea" label="Explain Stakeholders " />
          <.input field={form[:explain_history_as_markdown]} type="textarea" label="Explain History " />
          <.input field={form[:explain_authentication_as_markdown]} type="textarea" label="Explain Authentication " />
          <.input field={form[:explain_authorization_as_markdown]} type="textarea" label="Explain Authorization " />
          <.input field={form[:explain_use_cases_as_markdown]} type="textarea" label="Explain Use Cases " />
          <.input field={form[:explain_demographics_as_markdown]} type="textarea" label="Explain Demographics " />
          <.input field={form[:explain_ui_as_markdown]} type="textarea" label="Explain UI " />
          <.input field={form[:explain_api_as_markdown]} type="textarea" label="Explain API " />
          <.input field={form[:explain_data_as_markdown]} type="textarea" label="Explain Data " />
          <.input field={form[:explain_mobile_as_markdown]} type="textarea" label="Explain Mobile " />
          <.input field={form[:explain_legal_as_markdown]} type="textarea" label="Explain Legal " />
          <.input field={form[:explain_financial_as_markdown]} type="textarea" label="Explain Financial " />
          <.input field={form[:explain_service_level_agreement_as_markdown]} type="textarea" label="Explain Service Level Agreement (SLA) " />
          <.input field={form[:explain_disaster_recovery_as_markdown]} type="textarea" label="Explain Disaster Recover (DR) " />

        </.section>

        <.section id="system_quality_attributes" title="System Quality Attributes">

          <.input field={form[:quality_availability_as_markdown]} type="textarea" label="Availability " />
          <.input field={form[:quality_certifiability_as_markdown]} type="textarea" label="Certifiability " />
          <.input field={form[:quality_compatibility_as_markdown]} type="textarea" label="Compatibility " />
          <.input field={form[:quality_efficiency_as_markdown]} type="textarea" label="Efficiency " />
          <.input field={form[:quality_governability_as_markdown]} type="textarea" label="Governability " />
          <.input field={form[:quality_maintainability_as_markdown]} type="textarea" label="Maintainability " />
          <.input field={form[:quality_observability_as_markdown]} type="textarea" label="Observability " />
          <.input field={form[:quality_operability_as_markdown]} type="textarea" label="Operability " />
          <.input field={form[:quality_recoverability_as_markdown]} type="textarea" label="Recoverability " />
          <.input field={form[:quality_scalability_as_markdown]} type="textarea" label="Scalability " />
          <.input field={form[:quality_security_as_markdown]} type="textarea" label="Security " />
          <.input field={form[:quality_suitability_as_markdown]} type="textarea" label="Suitability " />
          <.input field={form[:quality_testability_as_markdown]} type="textarea" label="Testability " />
          <.input field={form[:quality_transferability_as_markdown]} type="textarea" label="Transferability " />
          <.input field={form[:quality_translatability_as_markdown]} type="textarea" label="Translatability " />
          <.input field={form[:quality_warrantability_as_markdown]} type="textarea" label="Warrantability " />

        </.section>

        <.section id="net_promoter_score" title="Net Promoter Score">

          <h3 class="h3">Customer Net Promoter Score (CNPS)</h3>

          <.input field={form[:customer_net_promoter_score_actual_value]} label="Actual Value" />
          <.input field={form[:customer_net_promoter_score_target_value]} label="Target Value" />
          <.input field={form[:customer_net_promoter_score_unit]} label="Unit" />
          <.input field={form[:customer_net_promoter_score_description_as_markdown]} type="textarea" label="Description " />

          <h3 class="h3">User Net Promoter Score (UNPS)</h3>

          <.input field={form[:user_net_promoter_score_actual_value]} label="Actual Value" />
          <.input field={form[:user_net_promoter_score_target_value]} label="Target Value" />
          <.input field={form[:user_net_promoter_score_unit]} label="Unit" />
          <.input field={form[:user_net_promoter_score_description_as_markdown]} type="textarea" label="Description " />

          <h3 class="h3">Worker Net Promoter Score (WNPS)</h3>

          <.input field={form[:worker_net_promoter_score_actual_value]} label="Actual Value" />
          <.input field={form[:worker_net_promoter_score_target_value]} label="Target Value" />
          <.input field={form[:worker_net_promoter_score_unit]} label="Unit" />
          <.input field={form[:worker_net_promoter_score_description_as_markdown]} type="textarea" label="Description " />

        </.section>

        <.section id="user_metrics" title="User Metrics">

          <h3 class="h3">Active Users</h3>

          <.input field={form[:active_users_actual_value]} label="Actual Value" />
          <.input field={form[:active_users_target_value]} label="Target Value" />
          <.input field={form[:active_users_unit]} label="Unit" />
          <.input field={form[:active_users_description]} type="textarea" label="Description " />

          <h3 class="h3">Uptime Percentage</h3>

          <.input field={form[:uptime_percentage_actual_value]} label="Actual Value" />
          <.input field={form[:uptime_percentage_target_value]} label="Target Value" />
          <.input field={form[:uptime_percentage_unit]} label="Unit" />
          <.input field={form[:uptime_percentage_description]} type="textarea" label="Description " />

        </.section>

        <.section id="burn_rate" title="Burn Rate">

          <h3 class="h3">Net Cash Per Week</h3>

          <.input field={form[:burn_rate_net_cash_per_week_actual_value]} label="Actual Value" />
          <.input field={form[:burn_rate_net_cash_per_week_target_value]} label="Target Value" />
          <.input field={form[:burn_rate_net_cash_per_week_unit]} label="Unit" />
          <.input field={form[:burn_rate_net_cash_per_week_description]} type="textarea" label="Description " />

          <h3 class="h3">Hours Per Week</h3>

          <.input field={form[:burn_rate_hours_per_week_actual_value]} label="Actual Value" />
          <.input field={form[:burn_rate_hours_per_week_target_value]} label="Target Value" />
          <.input field={form[:burn_rate_hours_per_week_unit]} label="Unit" />
          <.input field={form[:burn_rate_hours_per_week_description]} type="textarea" label="Description " />

        </.section>

        <.section id="total_project_control" title="Earned Value Management (EVM)">

          <.input field={form[:earned_value_management_planned_value]} label="Planned Value (PV)" />
          <.input field={form[:earned_value_management_earned_value]} label="Earned Value (EV)" />
          <.input field={form[:earned_value_management_actual_cost]} label="Actual Cost (AC)" />

        </.section>

        <.section id="total_project_control" title="Total Project Control (TPC)">

          <.input field={form[:total_project_control_dipp]} label="DIPP" />
          <.input field={form[:total_project_control_dipp_progress_index_ratio]} label="Progress Index (ratio)" />
          <.input field={form[:total_project_control_dipp_progress_index_numerator]} label="Progress Index (numerator)" />
          <.input field={form[:total_project_control_dipp_progress_index_denominator]} label="Progress Index (denominator)" />
          <.input field={form[:total_project_control_expected_monetary_value]} label="Expected Monetary Value" />
          <.input field={form[:total_project_control_cost_estimate_to_complete]} label="Cost Estimate To Complete" />

        </.section>

        <.section id="dora_metrics" title="DORA Metrics">

          <h3 class="h3">Deployment Frequency</h3>

          <.input field={form[:deployment_frequency_actual_value]} label="Actual Value" />
          <.input field={form[:deployment_frequency_target_value]} label="Target Value" />
          <.input field={form[:deployment_frequency_unit]} label="Unit" />
          <.input field={form[:deployment_frequency_description]} type="textarea" label="Description " />

          <h3 class="h3">Lead Time For Changes</h3>

          <.input field={form[:lead_time_for_changes_actual_value]} label="Actual Value" />
          <.input field={form[:lead_time_for_changes_target_value]} label="Target Value" />
          <.input field={form[:lead_time_for_changes_unit]} label="Unit" />
          <.input field={form[:lead_time_for_changes_description]} type="textarea" label="Description " />

          <h3 class="h3">Change Failure Rate</h3>

          <.input field={form[:change_failure_rate_actual_value]} label="Actual Value" />
          <.input field={form[:change_failure_rate_target_value]} label="Target Value" />
          <.input field={form[:change_failure_rate_unit]} label="Unit" />
          <.input field={form[:change_failure_rate_description]} type="textarea" label="Description " />

          <h3 class="h3">Mean Time To Recovery</h3>

          <.input field={form[:mean_time_to_recovery_actual_value]} label="Actual Value" />
          <.input field={form[:mean_time_to_recovery_target_value]} label="Target Value" />
          <.input field={form[:mean_time_to_recovery_unit]} label="Unit" />
          <.input field={form[:mean_time_to_recovery_description]} type="textarea" label="Description " />

        </.section>

        <.section id="code_metrics" title="Code Metrics">

          <h3 class="h3">Maintainability Index</h3>

          <.input field={form[:maintainability_index_actual_value]} label="Actual Value" />
          <.input field={form[:maintainability_index_target_value]} label="Target Value" />
          <.input field={form[:maintainability_index_unit]} label="Unit" />
          <.input field={form[:maintainability_index_description]} type="textarea" label="Description " />

          <h3 class="h3">Line Count</h3>

          <.input field={form[:line_count_actual_value]} label="Actual Value" />
          <.input field={form[:line_count_target_value]} label="Target Value" />
          <.input field={form[:line_count_unit]} label="Unit" />
          <.input field={form[:line_count_description]} type="textarea" label="Description " />

          <h3 class="h3">Test Automation Code Coverage</h3>

          <.input field={form[:test_automation_code_coverage_actual_value]} label="Actual Value" />
          <.input field={form[:test_automation_code_coverage_target_value]} label="Target Value" />
          <.input field={form[:test_automation_code_coverage_unit]} label="Unit" />
          <.input field={form[:test_automation_code_coverage_description]} type="textarea" label="Description " />

          <h3 class="h3">Halstead Complexity Volume</h3>

          <.input field={form[:halstead_complexity_volume_actual_value]} label="Actual Value" />
          <.input field={form[:halstead_complexity_volume_target_value]} label="Target Value" />
          <.input field={form[:halstead_complexity_volume_unit]} label="Unit" />
          <.input field={form[:halstead_complexity_volume_description]} type="textarea" label="Description " />

          <h3 class="h3">Halstead Complexity Difficulty</h3>

          <.input field={form[:halstead_complexity_difficulty_actual_value]} label="Actual Value" />
          <.input field={form[:halstead_complexity_difficulty_target_value]} label="Target Value" />
          <.input field={form[:halstead_complexity_difficulty_unit]} label="Unit" />
          <.input field={form[:halstead_complexity_difficulty_description]} type="textarea" label="Description " />

          <h3 class="h3">Halstead Complexity Effort</h3>

          <.input field={form[:halstead_complexity_effort_actual_value]} label="Actual Value" />
          <.input field={form[:halstead_complexity_effort_target_value]} label="Target Value" />
          <.input field={form[:halstead_complexity_effort_unit]} label="Unit" />
          <.input field={form[:halstead_complexity_effort_description]} type="textarea" label="Description " />

        </.section>

        <.button type="primary">Save</.button>
      </.form>
    </Layouts.app>
    """
  end

  @doc """
  Render a form section using a DaisyUI collapse UI/UX to save screen spaces.
  The function uses a section id, section title, and section inner block.
  """

  attr :id, :string, required: true
  attr :title, :string, required: true
  slot :inner_block, required: true

  def section(assigns) do
    ~H"""
    <section id={"section_#{@id}"} class="collapse collapse-arrow bg-base-100 border border-base-300 my-4" phx-update="ignore">
      <input id={"section_#{@id}_input"} type="checkbox" class="collapse-toggle" />
      <div class="collapse-title">{@title}</div>
      <div class="collapse-content">
        <%= render_slot(@inner_block) %>
      </div>
    </section>
    """
  end

  @doc """
  Handle event:
    - update now to try to work around DaisyUI collapse bug
    - validate form data
    - save form data to the database
  """

  def handle_event("updater", _params, socket) do
    IO.inspect("handle_event updater")
    {:noreply, socket}
  end

  def handle_event("validate", %{"form" => form_data}, socket) do
    form_data = convert_tags_param(form_data)

    {:noreply,
      update(
          socket,
          :form,
          fn form -> AshPhoenix.Form.validate(form, form_data)
      end)
    }
  end

  def handle_event("save", %{"form" => form_data}, socket) do
    IO.inspect(form_data, label: "form_data")
    form_data = convert_tags_param(form_data)
    case AshPhoenix.Form.submit(socket.assigns.form, params: form_data) do
      {:ok, _x} ->
        {:noreply,
          socket
          |> put_flash(:info, "Saved.")
          |> push_navigate(to: path_index(X))
        }

      {:error, form} ->
        # Print all errors
        IO.inspect(form.errors, label: "Form errors")

        # Print Ash built-in error formatting
        IO.inspect(AshPhoenix.Form.errors(form), label: "Changeset errors")

        # Print the full form for debugging
        IO.inspect(form, label: "Full form")

        IO.inspect(form.source.params, label: "form.source.params (before processing)")
        IO.inspect(form.params, label: "form.params (after processing)")

        {:noreply,
          socket
          |> put_flash(:error, "Save failed.")
          |> assign(:form, form)
      }

    end
  end

end
