defmodule NavatrackWeb.InitiativesTest do
  import Phoenix.LiveViewTest
  use NavatrackWeb.ConnCase
  use NavatrackWeb.AuthCase
  alias Navatrack.Works.Initiative, as: X

  defp x! do
    X
      |> Ash.Changeset.for_create(:create, %{
        locale_code: "en-US",
        name: "my-name",
        status: "my-status",
        tagging: "my-tagging",
        url: "https://my-url",
        email: "my-email@example.com",
        phone: "my-phone",
        messaging: "my-messaging",
        postal: "my-postal",
        orcid_pid: "my-orchid-pid",
        rdf_type: "my-rdf-type",
        linkedin_url: "https://linkedin.com/in/my-handle",
        github_url: "https://github.com/in/my-handle",
        codeberg_url: "https://codeberg.org/in/my-handle",
        note: "my-note",
        daisyui_timeline_html: "my-daisyui-timeline-html",
        org_mode: "my-org-mode",
        task_list_as_markdown: "my-task-list-as-markdown",
        ways_of_working_as_markdown: "my-ways-of-working-as-markdown",
        objectives_and_key_results_as_markdown: "my-objectives-and-key-results-as-markdown",
        key_performance_indicators_as_markdown: "my-key-performance-indicators-as-markdown",
        agents_as_url: "https://my-agents-as-markdown",
        agents_as_markdown: "my-agents-as-markdown",
        avatar_image_400x400_url: "https://my-avatar-image-400x400-url",
        avatar_image_400x400_alt: "my-avatar-image-400x400-alt",
        main_image_1080x1080_url: "https://my-main-image-1080x1080-url",
        main_image_1080x1080_alt: "my-main-image-1080x1080-alt",
        main_image_1920x1080_url: "https://my-main-image-1920x1080-url",
        main_image_1920x1080_alt: "my-main-image-1920x1080-alt",
        main_image_1080x1920_url: "https://my-main-image-1080x1920-url",
        main_image_1080x1920_alt: "my-main-image-1080x1920-alt",
        home_emoji_url: "https://my-home-emoji-url",
        bellhop_bell_emoji_url: "https://my-bellhop-bell-emoji-url",
        target_emoji_url: "https://my-target-emoji-url",
        gear_emoji_url: "https://my-gear-emoji-url",
        spiral_calendar_emoji_url: "https://my-spiral-calendar-emoji-url",
        sparkles_emoji_url: "https://my-sparkles-emoji-url",
        speech_bubble_emoji_url: "https://my-speech-bubble-emoji-url",
        newspaper_emoji_url: "https://my-newspaper-emoji-url",
        bar_chart_emoji_url: "https://my-bar-chart-emoji-url",
        movie_camera_emoji_url: "https://my-movie-camera-emoji-url",
        construction_worker_emoji_url: "https://my-construction-worker-emoji-url",
        crystal_ball_emoji_url: "https://my-crystal-ball-emoji-url",
        butterfly_emoji_url: "https://my-butterfly-emoji-url",
        lady_beetle_emoji_url: "https://my-lady-beetle-emoji-url",
        email_distribution_list: "my-email-distribution-list",
        glossary_as_url: "https://my-glossary-as-url",
        glossary_as_markdown: "my-glossary-as-markdown",
        six_pager_double_sider_as_url: "https://my-six_pager-double-sider-as-url",
        six_pager_double_sider_as_markdown: "my-six-pager-double-sider-as-markdown",
        swot_as_url: "https://my-swot-as-url",
        swot_as_markdown: "my-swot-as-markdown",
        porters_five_forces_as_url: "https://my-porters-five-forces-as-url",
        porters_five_forces_as_markdown: "my-porters-five-forces-as-markdown",
        pestle_as_url: "https://my-pestle-as-url",
        pestle_as_markdown: "my-pestle-as-markdown",
        roles_and_responsibilities_as_url: "https://my-roles-and-responsibilities-as-url",
        roles_and_responsibilities_as_markdown: "my-roles-and-responsibilities-as-markdown",
        responsibility_assignment_matrix_as_url: "https://my-responsibility-assignment-matrix-as-url",
        responsibility_assignment_matrix_as_markdown: "my-responsibility-assignment-matrix-as-markdown",
        code_of_conduct_url: "https://my-code-of-conduct-url",
        code_of_conduct_as_markdown: "my-code-of-conduct-as-markdown",
        license_url: "https://my-license-url",
        license_as_markdown: "my-license-as-markdown",
        sipoc_suppliers_as_url: "https://my-sipoc-suppliers-as-url",
        sipoc_suppliers_as_markdown: "my-sipoc-suppliers-as-markdown",
        sipoc_inputs_as_url: "https://my-sipoc-inputs-as-url",
        sipoc_inputs_as_markdown: "my-sipoc-inputs-as-markdown",
        sipoc_processes_as_url: "https://my-sipoc-processes-as-url",
        sipoc_processes_as_markdown: "my-sipoc-processes-as-markdown",
        sipoc_outputs_as_url: "https://my-sipoc-outputs-as-url",
        sipoc_outputs_as_markdown: "my-sipoc-outputs-as-markdown",
        sipoc_customers_as_url: "https://my-sipoc-customers-as-url",
        sipoc_customers_as_markdown: "my-sipoc-customers-as-markdown",
        arc42_as_url: "https://my-arc42-as-url",
        arc42_as_markdown: "my-arc42-as-markdown",
        arc42_01_introduction_and_goals_as_markdown: "my-arc42-01-introduction-and-goals-as-markdown",
        arc42_02_constraints_as_markdown: "my-arc42-02-constraints-as-markdown",
        arc42_03_context_and_scope_as_markdown: "my-arc42-03-context-and-scope-as-markdown",
        arc42_04_solution_strategy_as_markdown: "my-arc42-04-solution-strategy-as-markdown",
        arc42_05_building_block_view_as_markdown: "my-arc42-05-building-block-view-as-markdown",
        arc42_06_runtime_view_as_markdown: "my-arc42-06-runtime-view-as-markdown",
        arc42_07_deployment_view_as_markdown: "my-arc42-07-deployment-view-as-markdown",
        arc42_08_crosscutting_concepts_as_markdown: "my-arc42-08-crosscutting-concepts-as-markdown",
        arc42_09_architectural_decisions_as_markdown: "my-arc42-09-architectural-decisions-as-markdown",
        arc42_10_quality_requirements_as_markdown: "my-arc42-10-quality-requirements-as-markdown",
        arc42_11_risks_and_technical_debt_as_markdown: "my-arc42-11_risks-and-technical-debt-as-markdown",
        arc42_12_glossary_as_markdown: "my-arc42-12-glossary-as-markdown",
        explain_stakeholders_as_markdown: "my-explain-stakeholders-as-markdown",
        explain_history_as_markdown: "my-explain-history-as-markdown",
        explain_authentication_as_markdown: "my-explain-authentication-as-markdown",
        explain_authorization_as_markdown: "my-explain-authorization-as-markdown",
        explain_use_cases_as_markdown: "my-explain-use-cases-as-markdown",
        explain_demographics_as_markdown: "my-explain-demographics-as-markdown",
        explain_ui_as_markdown: "my-explain-ui-as-markdown",
        explain_api_as_markdown: "my-explain-api-as-markdown",
        explain_data_as_markdown: "my-explain-data-as-markdown",
        explain_mobile_as_markdown: "my-explain-mobile-as-markdown",
        explain_legal_as_markdown: "my-explain-legal-as-markdown",
        explain_financial_as_markdown: "my-explain-financial-as-markdown",
        explain_service_level_agreement_as_markdown: "my-explain-service-level-agreement-as-markdown",
        explain_disaster_recovery_as_markdown: "my-explain-disaster-recovery-as-markdown",
        quality_availability_as_markdown: "my-quality-availability-as-markdown",
        quality_certifiability_as_markdown: "my-quality-certifiability-as-markdown",
        quality_compatibility_as_markdown: "my-quality-compatibility-as-markdown",
        quality_efficiency_as_markdown: "my-quality-efficiency-as-markdown",
        quality_governability_as_markdown: "my-quality-governability-as-markdown",
        quality_maintainability_as_markdown: "my-quality-maintainability-as-markdown",
        quality_observability_as_markdown: "my-quality-observability-as-markdown",
        quality_operability_as_markdown: "my-quality-operability-as-markdown",
        quality_recoverability_as_markdown: "my-quality-recoverability-as-markdown",
        quality_scalability_as_markdown: "my-quality-scalability-as-markdown",
        quality_security_as_markdown: "my-quality-security-as-markdown",
        quality_suitability_as_markdown: "my-quality-suitability-as-markdown",
        quality_testability_as_markdown: "my-quality-testability-as-markdown",
        quality_transferability_as_markdown: "my-quality-transferability-as-markdown",
        quality_translatability_as_markdown: "my-quality-translatability-as-markdown",
        quality_warrantability_as_markdown: "my-quality-warrantability-as-markdown",
        apache_echart_as_url: "https://my-apache-echart-as-url",
        apache_echart_as_typescript: "my-apache-echart-as-typescript",
        net_promoter_score_customer_perspective_actual_value: 1.0,
        net_promoter_score_customer_perspective_target_value: 2.0,
        net_promoter_score_customer_perspective_unit: "my-net_promoter-score-customer-perspective-unit",
        net_promoter_score_customer_perspective_description_as_markdown: "my-net_promoter-score-customer-perspective-description-as-markdown",
        net_promoter_score_user_perspective_actual_value: 1.0,
        net_promoter_score_user_perspective_target_value: 2.0,
        net_promoter_score_user_perspective_unit: "my-net_promoter-score-user-perspective-unit",
        net_promoter_score_user_perspective_description_as_markdown: "my-net_promoter-score-user-perspective-description-as-markdown",
        net_promoter_score_worker_perspective_actual_value: 1.0,
        net_promoter_score_worker_perspective_target_value: 2.0,
        net_promoter_score_worker_perspective_unit: "my-net_promoter-score-worker-perspective-unit",
        net_promoter_score_worker_perspective_description_as_markdown: "my-net_promoter_score-worker-perspective-description-as-markdown",
        active_users_actual_value: 1.0,
        active_users_target_value: 2.0,
        active_users_unit: "my-active-users-unit",
        active_users_description: "my-active-users-description",
        uptime_percentage_actual_value: 1.0,
        uptime_percentage_target_value: 2.0,
        uptime_percentage_unit: "my-uptime-percentage-unit",
        uptime_percentage_description: "my-uptime-percentage-description",
        burn_rate_net_cash_per_week_actual_value: 1.0,
        burn_rate_net_cash_per_week_target_value: 2.0,
        burn_rate_net_cash_per_week_unit: "my-burn_rate_net-cash-per-week-unit",
        burn_rate_net_cash_per_week_description: "my-burn_rate_net-cash-per-week-description",
        burn_rate_hours_per_week_actual_value: 1.0,
        burn_rate_hours_per_week_target_value: 2.0,
        burn_rate_hours_per_week_unit: "my-burn_rate-hours-per-week-unit",
        burn_rate_hours_per_week_description: "my-burn_rate-hours-per-week-description",
        earned_value_management_planned_value: 1.0,
        earned_value_management_earned_value: 1.0,
        earned_value_management_actual_cost: 1.0,
        total_project_control_dipp: 1.0,
        total_project_control_dipp_progress_index_numerator: 1.0,
        total_project_control_dipp_progress_index_denominator: 2.0,
        total_project_control_expected_monetary_value: 1.0,
        total_project_control_cost_estimate_to_complete: 1.0,
        deployment_frequency_actual_value: 1.0,
        deployment_frequency_target_value: 2.0,
        deployment_frequency_unit: "my-deployment-frequency-unit",
        deployment_frequency_description: "my-deployment-frequency-description",
        lead_time_for_changes_actual_value: 1.0,
        lead_time_for_changes_target_value: 2.0,
        lead_time_for_changes_unit: "my-lead-time-for-changes-unit",
        lead_time_for_changes_description: "my-lead-time-for-changes-description",
        change_failure_rate_actual_value: 1.0,
        change_failure_rate_target_value: 2.0,
        change_failure_rate_unit: "my-change-failure-rate-unit",
        change_failure_rate_description: "my-change-failure-rate-description",
        mean_time_to_recovery_actual_value: 1.0,
        mean_time_to_recovery_target_value: 2.0,
        mean_time_to_recovery_unit: "my-mean-time-to-recovery-unit",
        mean_time_to_recovery_description: "my-mean-time-to-recovery-description",
        maintainability_index_actual_value: 1.0,
        maintainability_index_target_value: 2.0,
        maintainability_index_unit: "my-maintainability-index-unit",
        maintainability_index_description: "my-maintainability-index-description",
        line_count_actual_value: 1.0,
        line_count_target_value: 2.0,
        line_count_unit: "my-line-count-unit",
        line_count_description: "my-line-count-description",
        test_automation_code_coverage_actual_value: 1.0,
        test_automation_code_coverage_target_value: 2.0,
        test_automation_code_coverage_unit: "my-test-automation-code-coverage-unit",
        test_automation_code_coverage_description: "my-test-automation-code-coverage-description",
        halstead_complexity_volume_actual_value: 1.0,
        halstead_complexity_volume_target_value: 2.0,
        halstead_complexity_volume_unit: "my-halstead-complexity-volume-unit",
        halstead_complexity_volume_description: "my-halstead-complexity-volume-description",
        halstead_complexity_difficulty_actual_value: 1.0,
        halstead_complexity_difficulty_target_value: 2.0,
        halstead_complexity_difficulty_unit: "my-halstead-complexity-difficulty-unit",
        halstead_complexity_difficulty_description: "my-halstead-complexity-difficulty-description",
        halstead_complexity_effort_actual_value: 1.0,
        halstead_complexity_effort_target_value: 2.0,
        halstead_complexity_effort_unit: "my-halstead-complexity-effort-unit",
        halstead_complexity_effort_description: "my-halstead-complexity-effort-description",
      })
    |> Ash.create!()
  end
  setup %{conn: conn} do
    {:ok, user} = my_user()
    {:ok, user} = my_sign_in(user)

    conn =
      conn
      |> Phoenix.ConnTest.init_test_session(%{})
      |> AshAuthentication.Plug.Helpers.store_in_session(user)

    {:ok, conn: conn}
  end

  test "index", %{conn: conn} do
    conn = get(conn, ~p"/initiatives")
    response = html_response(conn, 200)
    assert response =~ "Initiatives"
    assert response =~ "➡️ Id"
    assert response =~ "📛 Name"
    assert response =~ "🚦 Status"
    assert response =~ "🏷️ Tags"
  end

  test "new", %{conn: conn} do
    conn = get(conn, ~p"/initiatives/new")
    response = html_response(conn, 200)
    assert response =~ "Initiatives"
    assert response =~ "Introduction"
    assert response =~ "📛 Name"
    assert response =~ "🚦 Status"
    assert response =~ "🏷️ Tags"
    assert response =~ "Contact"
    assert response =~ "🔗 URL"
    assert response =~ "📧 Email"
    assert response =~ "📱 Phone"
    assert response =~ "💬 Messaging"
    assert response =~ "📫 Postal"
    assert response =~ "🌺 ORCID PID"
    assert response =~ "🖇️ RDF Type"
    assert response =~ "AGENTS.md"
    assert response =~ "🔗 URL"
    assert response =~ "Text"
    assert response =~ "Chart"
    assert response =~ "🔗 URL"
    assert response =~ "TypeScript"
    assert response =~ "Images"
    assert response =~ "Avatar image 400x400"
    assert response =~ "Main image 1080x1080 square"
    assert response =~ "Main image 1920x1080 landscape"
    assert response =~ "Main image 1080x1920 portrait"
    assert response =~ "Links"
    assert response =~ "🏠 Home"
    assert response =~ "🛎️ Concierge"
    assert response =~ "🎯 Target"
    assert response =~ "⚙️ Technical Contact"
    assert response =~ "🗓️ Calendar"
    assert response =~ "✨ AI"
    assert response =~ "💬 Chat"
    assert response =~ "📰 News"
    assert response =~ "📊 Charts"
    assert response =~ "🎥 Videos"
    assert response =~ "👷 Construction Worker"
    assert response =~ "🔮 Future"
    assert response =~ "🦋 Feature Tracker"
    assert response =~ "🐞 Bug Tracker"
    assert response =~ "Deeper Dive"
    assert response =~ "Note"
    assert response =~ "Email distribution list"
    assert response =~ "DaisyUI timeline HTML"
    assert response =~ "Org Mode"
    assert response =~ "Task list as markdown"
    assert response =~ "Ways Of Working"
    assert response =~ "Objectives and Key Results (OKRs)"
    assert response =~ "Key Performance Indicators (KPIs)"
    assert response =~ "Business Analysis"
    assert response =~ "Six-Pager Double-Sider"
    assert response =~ "Strengths Weaknesses Opportunities Threats (SWOT)"
    assert response =~ "Porter's Five Forces"
    assert response =~ "Political, Economic, Social, Technological, Legal, Environmental (PESTLE)"
    assert response =~ "Touchpoints"
    assert response =~ "Glossary"
    assert response =~ "Roles and Responsibilities"
    assert response =~ "Responsibility Assignment Matrix (RAM)"
    assert response =~ "Code of Conduct"
    assert response =~ "License"
    assert response =~ "Arc42"
    assert response =~ "Arc42 full documentation"
    assert response =~ "Arc42 sections"
    assert response =~ "Arc42 section 01: Introduction and Goals"
    assert response =~ "Arc42 section 02: Constraints"
    assert response =~ "Arc42 section 03: Context and Scope"
    assert response =~ "Arc42 section 04: Solution Strategy"
    assert response =~ "Arc42 section 05: Building Block View"
    assert response =~ "Arc42 section 06: Runtime View"
    assert response =~ "Arc42 section 07: Deployment View"
    assert response =~ "Arc42 section 08: Crosscutting Concepts"
    assert response =~ "Arc42 section 09: Architectural Decisions"
    assert response =~ "Arc42 section 10: Quality Requirements"
    assert response =~ "Arc42 section 11: Risks and Technical Debt"
    assert response =~ "Arc42 section 12: Glossary"
    assert response =~ "Explain"
    assert response =~ "Explain Stakeholders"
    assert response =~ "Explain History"
    assert response =~ "Explain Authentication"
    assert response =~ "Explain Authorization"
    assert response =~ "Explain Use Cases"
    assert response =~ "Explain Demographics"
    assert response =~ "Explain UI"
    assert response =~ "Explain API"
    assert response =~ "Explain Data"
    assert response =~ "Explain Mobile"
    assert response =~ "Explain Legal"
    assert response =~ "Explain Financial"
    assert response =~ "Explain Service Level Agreement (SLA)"
    assert response =~ "Explain Disaster Recovery (DR)"
    assert response =~ "System Quality Attributes"
    assert response =~ "Availability"
    assert response =~ "Certifiability"
    assert response =~ "Compatibility"
    assert response =~ "Efficiency"
    assert response =~ "Governability"
    assert response =~ "Maintainability"
    assert response =~ "Observability"
    assert response =~ "Operability"
    assert response =~ "Recoverability"
    assert response =~ "Scalability"
    assert response =~ "Security"
    assert response =~ "Suitability"
    assert response =~ "Testability"
    assert response =~ "Transferability"
    assert response =~ "Translatability"
    assert response =~ "Warrantability"
    assert response =~ "Net Promoter Score"
    assert response =~ "Customer Perspective"
    assert response =~ "User Perspective"
    assert response =~ "Worker Perspective"
    assert response =~ "User Metrics"
    assert response =~ "Active Users"
    assert response =~ "Uptime Percentage"
    assert response =~ "Burn Rate"
    assert response =~ "Net Cash Per Week"
    assert response =~ "Hours Per Week"
    assert response =~ "Earned Value Management (EVM)"
    assert response =~ "Planned Value (PV)"
    assert response =~ "Earned Value (EV)"
    assert response =~ "Actual Cost (AC)"
    assert response =~ "Total Project Control (TPC)"
    assert response =~ "DIPP"
    assert response =~ "Progress Index (ratio)"
    assert response =~ "Progress Index (numerator)"
    assert response =~ "Progress Index (denominator)"
    assert response =~ "Expected Monetary Value"
    assert response =~ "Cost Estimate To Complete"
    assert response =~ "DORA Metrics"
    assert response =~ "Code Metrics"
    assert response =~ "Maintainability Index"
    assert response =~ "Line Count"
    assert response =~ "Test Automation Code Coverage"
    assert response =~ "Halstead Complexity Volume"
    assert response =~ "Halstead Complexity Difficulty"
    assert response =~ "Halstead Complexity Effort"
  end

  test "show", %{conn: conn} do
    x = x!()
    conn = get(conn, ~p"/initiatives/#{x.id}")
    response = html_response(conn, 200)

    assert response =~ "Introduction"

    assert response =~ "📛 Name: #{x.name}"
    assert response =~ "🚦 Status: #{x.status}"
    assert response =~ "🏷️ Tags: #{x.tagging}"

    assert response =~ "Contact"

    assert response =~ "URL: #{x.url}"
    assert response =~ "Email: #{x.email}"
    assert response =~ "Phone: #{x.phone}"
    assert response =~ "Messaging: #{x.messaging}"
    assert response =~ "Postal: #{x.postal}"
    assert response =~ "ORCID PID: #{x.orcid_pid}"
    assert response =~ "RDF Type: #{x.rdf_type}"

    assert response =~ "Socials"

    assert response =~ "LinkedIn URL: #{x.linkedin_url}"
    assert response =~ "GitHub URL: #{x.github_url}"
    assert response =~ "Codeberg URL: #{x.codeberg_url}"

    assert response =~ "AGENTS.md"

    assert response =~ "URL: #{x.agents_as_url}"
    assert response =~ "Markdown: #{x.agents_as_markdown}"

    assert response =~ "Images"

    assert response =~ "Avatar image 400x400"
    assert response =~ "URL: #{x.avatar_image_400x400_url}"
    assert response =~ "Alt: #{x.avatar_image_400x400_alt}"

    assert response =~ "Main image 1080x1080 square"
    assert response =~ "URL: #{x.main_image_1080x1080_url}"
    assert response =~ "Alt: #{x.main_image_1080x1080_alt}"

    assert response =~ "Main image 1920x1080 landscape"
    assert response =~ "URL: #{x.main_image_1920x1080_url}"
    assert response =~ "Alt: #{x.main_image_1920x1080_alt}"

    assert response =~ "Main image 1080x1920 portrait"
    assert response =~ "URL: #{x.main_image_1080x1920_url}"
    assert response =~ "Alt: #{x.main_image_1080x1920_alt}"

    assert response =~ "Deeper Dive"
    assert response =~ "Note: #{x.note}"
    assert response =~ "Email distribution list: #{x.email_distribution_list}"
    assert response =~ "DaisyUI timeline HTML: #{x.daisyui_timeline_html}"
    assert response =~ "Org Mode: #{x.org_mode}"
    assert response =~ "Task list: #{x.task_list_as_markdown}"
    assert response =~ "Ways Of Working (WOW): #{x.ways_of_working_as_markdown}"
    assert response =~ "Objectives and Key Results (OKRs): #{x.objectives_and_key_results_as_markdown}"
    assert response =~ "Key Performance Indicators (KPIs): #{x.key_performance_indicators_as_markdown}"

    assert response =~ "🏠 Home: #{x.home_emoji_url}"
    assert response =~ "🛎️ Concierge: #{x.bellhop_bell_emoji_url}"
    assert response =~ "🎯 Target: #{x.target_emoji_url}"
    assert response =~ "⚙️ Technical Contact: #{x.gear_emoji_url}"
    assert response =~ "🗓️ Calendar: #{x.spiral_calendar_emoji_url}"
    assert response =~ "✨ AI: #{x.sparkles_emoji_url}"
    assert response =~ "💬 Chat: #{x.speech_bubble_emoji_url}"
    assert response =~ "📰 News: #{x.newspaper_emoji_url}"
    assert response =~ "📊 Charts: #{x.bar_chart_emoji_url}"
    assert response =~ "🎥 Videos: #{x.movie_camera_emoji_url}"
    assert response =~ "👷 Workers: #{x.construction_worker_emoji_url}"
    assert response =~ "🔮 Future: #{x.crystal_ball_emoji_url}"
    assert response =~ "🦋 Feature Tracker: #{x.butterfly_emoji_url}"
    assert response =~ "🐞 Bug Tracker: #{x.lady_beetle_emoji_url}"

    assert response =~ "Touchpoints"

    assert response =~ "Glossary"
    assert response =~ "URL: #{x.glossary_as_url}"
    assert response =~ "Markdown: #{x.glossary_as_markdown}"

    assert response =~ "Six-Pager Double-Sider"
    assert response =~ "URL: #{x.six_pager_double_sider_as_url}"
    assert response =~ "Markdown: #{x.six_pager_double_sider_as_markdown}"

    assert response =~ "Strengths Weaknesses Opportunities Threats (SWOT)"
    assert response =~ "URL: #{x.swot_as_url}"
    assert response =~ "Markdown: #{x.swot_as_markdown}"

    assert response =~ "Porter's Five Forces"
    assert response =~ "URL: #{x.porters_five_forces_as_url}"
    assert response =~ "Markdown: #{x.porters_five_forces_as_markdown}"

    assert response =~ "Political, Economic, Social, Technological, Legal, Environmental (PESTLE)"
    assert response =~ "URL: #{x.pestle_as_url}"
    assert response =~ "Markdown: #{x.pestle_as_markdown}"

    assert response =~ "Roles and Responsibilities"
    assert response =~ "URL: #{x.roles_and_responsibilities_as_url}"
    assert response =~ "Markdown: #{x.roles_and_responsibilities_as_markdown}"

    assert response =~ "Responsibility Assignment Matrix (RAM)"
    assert response =~ "URL: #{x.responsibility_assignment_matrix_as_url}"
    assert response =~ "Markdown: #{x.responsibility_assignment_matrix_as_markdown}"

    assert response =~ "Code of Conduct"
    assert response =~ "URL: #{x.code_of_conduct_url}"
    assert response =~ "Markdown: #{x.code_of_conduct_as_markdown}"

    assert response =~ "License"
    assert response =~ "URL: #{x.license_url}"
    assert response =~ "Markdown: #{x.license_as_markdown}"

    assert response =~ "Suppliers Inputs Processes Outputs Customers (SIPOC)"

    assert response =~ "Suppliers"
    assert response =~ "URL: #{x.sipoc_suppliers_as_url}"
    assert response =~ "Markdown: #{x.sipoc_suppliers_as_markdown}"

    assert response =~ "Inputs"
    assert response =~ "URL: #{x.sipoc_inputs_as_url}"
    assert response =~ "Markdown: #{x.sipoc_inputs_as_markdown}"

    assert response =~ "Processes"
    assert response =~ "URL: #{x.sipoc_processes_as_url}"
    assert response =~ "Markdown: #{x.sipoc_processes_as_markdown}"

    assert response =~ "Outputs"
    assert response =~ "URL: #{x.sipoc_outputs_as_url}"
    assert response =~ "Markdown: #{x.sipoc_outputs_as_markdown}"

    assert response =~ "Customers"
    assert response =~ "URL: #{x.sipoc_customers_as_url}"
    assert response =~ "Markdown: #{x.sipoc_customers_as_markdown}"

    assert response =~ "Arc42"
    assert response =~ "URL: #{x.arc42_as_url}"
    assert response =~ "Markdown: #{x.arc42_as_markdown}"

    assert response =~ "01: Introduction and Goals: #{x.arc42_01_introduction_and_goals_as_markdown}"
    assert response =~ "02: Constraints: #{x.arc42_02_constraints_as_markdown}"
    assert response =~ "03: Context and Scope: #{x.arc42_03_context_and_scope_as_markdown}"
    assert response =~ "04: Solution Strategy: #{x.arc42_04_solution_strategy_as_markdown}"
    assert response =~ "05: Building Block View: #{x.arc42_05_building_block_view_as_markdown}"
    assert response =~ "06: Runtime View: #{x.arc42_06_runtime_view_as_markdown}"
    assert response =~ "07: Deployment View: #{x.arc42_07_deployment_view_as_markdown}"
    assert response =~ "08: Crosscutting Concepts: #{x.arc42_08_crosscutting_concepts_as_markdown}"
    assert response =~ "09: Architectural Decisions: #{x.arc42_09_architectural_decisions_as_markdown}"
    assert response =~ "10: Quality Requirements: #{x.arc42_10_quality_requirements_as_markdown}"
    assert response =~ "11: Risks and Technical Debt: #{x.arc42_11_risks_and_technical_debt_as_markdown}"
    assert response =~ "12: Glossary: #{x.arc42_12_glossary_as_markdown}"

    assert response =~ "Explain"
    assert response =~ "Stakeholders: #{x.explain_stakeholders_as_markdown}"
    assert response =~ "History: #{x.explain_history_as_markdown}"
    assert response =~ "Authentication: #{x.explain_authentication_as_markdown}"
    assert response =~ "Authorization: #{x.explain_authorization_as_markdown}"
    assert response =~ "Use Cases: #{x.explain_use_cases_as_markdown}"
    assert response =~ "Demographics: #{x.explain_demographics_as_markdown}"
    assert response =~ "UI: #{x.explain_ui_as_markdown}"
    assert response =~ "API: #{x.explain_api_as_markdown}"
    assert response =~ "Data: #{x.explain_data_as_markdown}"
    assert response =~ "Mobile: #{x.explain_mobile_as_markdown}"
    assert response =~ "Legal: #{x.explain_legal_as_markdown}"
    assert response =~ "Financial: #{x.explain_financial_as_markdown}"
    assert response =~ "Service Level Agreement (SLA): #{x.explain_service_level_agreement_as_markdown}"
    assert response =~ "Disaster Recovery (DR): #{x.explain_disaster_recovery_as_markdown}"

    assert response =~ "Quality"
    assert response =~ "Availability: #{x.quality_availability_as_markdown}"
    assert response =~ "Certifiability: #{x.quality_certifiability_as_markdown}"
    assert response =~ "Compatibility: #{x.quality_compatibility_as_markdown}"
    assert response =~ "Efficiency: #{x.quality_efficiency_as_markdown}"
    assert response =~ "Governability: #{x.quality_governability_as_markdown}"
    assert response =~ "Maintainability: #{x.quality_maintainability_as_markdown}"
    assert response =~ "Observability: #{x.quality_observability_as_markdown}"
    assert response =~ "Operability: #{x.quality_operability_as_markdown}"
    assert response =~ "Recoverability: #{x.quality_recoverability_as_markdown}"
    assert response =~ "Scalability: #{x.quality_scalability_as_markdown}"
    assert response =~ "Security: #{x.quality_security_as_markdown}"
    assert response =~ "Suitability: #{x.quality_suitability_as_markdown}"
    assert response =~ "Testability: #{x.quality_testability_as_markdown}"
    assert response =~ "Transferability: #{x.quality_transferability_as_markdown}"
    assert response =~ "Translatability: #{x.quality_translatability_as_markdown}"
    assert response =~ "Warrantability: #{x.quality_warrantability_as_markdown}"

    assert response =~ "Chart"
    assert response =~ "URL: #{x.apache_echart_as_url}"
    assert response =~ "TypeScript: #{x.apache_echart_as_typescript}"

    assert response =~ "Net Promoter Score (NPS)"

    assert response =~ "Customer Perspective"
    assert response =~ "Actual Value: #{x.net_promoter_score_customer_perspective_actual_value}"
    assert response =~ "Target Value: #{x.net_promoter_score_customer_perspective_target_value}"
    assert response =~ "Unit: #{x.net_promoter_score_customer_perspective_unit}"
    assert response =~ "Description: #{x.net_promoter_score_customer_perspective_description_as_markdown}"

    assert response =~ "User Perspective"
    assert response =~ "Actual Value: #{x.net_promoter_score_user_perspective_actual_value}"
    assert response =~ "Target Value: #{x.net_promoter_score_user_perspective_target_value}"
    assert response =~ "Unit: #{x.net_promoter_score_user_perspective_unit}"
    assert response =~ "Description: #{x.net_promoter_score_user_perspective_description_as_markdown}"

    assert response =~ "Worker Perspective"
    assert response =~ "Actual Value: #{x.net_promoter_score_worker_perspective_actual_value}"
    assert response =~ "Target Value: #{x.net_promoter_score_worker_perspective_target_value}"
    assert response =~ "Unit: #{x.net_promoter_score_worker_perspective_unit}"
    assert response =~ "Description: #{x.net_promoter_score_worker_perspective_description_as_markdown}"

    assert response =~ "User Metrics"

    assert response =~ "Active Users"
    assert response =~ "Actual Value: #{x.active_users_actual_value}"
    assert response =~ "Target Value: #{x.active_users_target_value}"
    assert response =~ "Unit: #{x.active_users_unit}"
    assert response =~ "Description: #{x.active_users_description}"

    assert response =~ "Uptime Percentage"
    assert response =~ "Actual Value: #{x.uptime_percentage_actual_value}"
    assert response =~ "Target Value: #{x.uptime_percentage_target_value}"
    assert response =~ "Unit: #{x.uptime_percentage_unit}"
    assert response =~ "Description: #{x.uptime_percentage_description}"

    assert response =~ "Burn Rate"

    assert response =~ "Net Cash Per Week"
    assert response =~ "Actual Value: #{x.burn_rate_net_cash_per_week_actual_value}"
    assert response =~ "Target Value: #{x.burn_rate_net_cash_per_week_target_value}"
    assert response =~ "Unit: #{x.burn_rate_net_cash_per_week_unit}"
    assert response =~ "Description: #{x.burn_rate_net_cash_per_week_description}"

    assert response =~ "Net Hours Per Week"
    assert response =~ "Actual Value: #{x.burn_rate_hours_per_week_actual_value}"
    assert response =~ "Target Value: #{x.burn_rate_hours_per_week_target_value}"
    assert response =~ "Unit: #{x.burn_rate_hours_per_week_unit}"
    assert response =~ "Description: #{x.burn_rate_hours_per_week_description}"

    assert response =~ "Earned Value Management (EVM)"
    assert response =~ "Planned Value (PV): #{x.earned_value_management_planned_value}"
    assert response =~ "Earned Value (EV): #{x.earned_value_management_earned_value}"
    assert response =~ "Actual Cost (AC): #{x.earned_value_management_actual_cost}"
    assert response =~ "Cost Variance: #{x.earned_value_management_cost_variance}"
    assert response =~ "Cost Variance Ratio: #{x.earned_value_management_cost_variance_ratio}"
    assert response =~ "Cost Performance Index: #{x.earned_value_management_cost_performance_index}"
    assert response =~ "Schedule Variance: #{x.earned_value_management_schedule_variance}"
    assert response =~ "Schedule Variance Ratio: #{x.earned_value_management_schedule_variance_ratio}"
    assert response =~ "Schedule Performance Index: #{x.earned_value_management_schedule_performance_index}"

    assert response =~ "Total Project Control"
    assert response =~ "DIPP: #{x.total_project_control_dipp}"
    assert response =~ "Progress Index (ratio): #{x.total_project_control_dipp_progress_index_ratio}"
    assert response =~ "Progress Index (numerator): #{x.total_project_control_dipp_progress_index_numerator}"
    assert response =~ "Progress Index (denominator): #{x.total_project_control_dipp_progress_index_denominator}"
    assert response =~ "Expected Monetary Value: #{x.total_project_control_expected_monetary_value}"
    assert response =~ "Cost Estimate To Complete: #{x.total_project_control_cost_estimate_to_complete}"

    assert response =~ "Deployment Frequency"
    assert response =~ "Actual Value: #{x.deployment_frequency_actual_value}"
    assert response =~ "Target Value: #{x.deployment_frequency_target_value}"
    assert response =~ "Ratio: #{x.deployment_frequency_ratio}"
    assert response =~ "Unit: #{x.deployment_frequency_unit}"
    assert response =~ "Description: #{x.deployment_frequency_description}"

    assert response =~ "Lead Time For Changes"
    assert response =~ "Actual Value: #{x.lead_time_for_changes_actual_value}"
    assert response =~ "Target Value: #{x.lead_time_for_changes_target_value}"
    assert response =~ "Ratio: #{x.lead_time_for_changes_ratio}"
    assert response =~ "Unit: #{x.lead_time_for_changes_unit}"
    assert response =~ "Description: #{x.lead_time_for_changes_description}"

    assert response =~ "Change Failure Rate"
    assert response =~ "Actual Value: #{x.change_failure_rate_actual_value}"
    assert response =~ "Target Value: #{x.change_failure_rate_target_value}"
    assert response =~ "Ratio: #{x.change_failure_rate_ratio}"
    assert response =~ "Unit: #{x.change_failure_rate_unit}"
    assert response =~ "Description: #{x.change_failure_rate_description}"

    assert response =~ "Mean Time To Recovery"
    assert response =~ "Actual Value: #{x.mean_time_to_recovery_actual_value}"
    assert response =~ "Target Value: #{x.mean_time_to_recovery_target_value}"
    assert response =~ "Ratio: #{x.mean_time_to_recovery_ratio}"
    assert response =~ "Unit: #{x.mean_time_to_recovery_unit}"
    assert response =~ "Description: #{x.mean_time_to_recovery_description}"

    assert response =~ "Maintainability Index"
    assert response =~ "Actual Value: #{x.maintainability_index_actual_value}"
    assert response =~ "Target Value: #{x.maintainability_index_target_value}"
    assert response =~ "Ratio: #{x.maintainability_index_ratio}"
    assert response =~ "Unit: #{x.maintainability_index_unit}"
    assert response =~ "Description: #{x.maintainability_index_description}"

    assert response =~ "Line Count"
    assert response =~ "Actual Value: #{x.line_count_actual_value}"
    assert response =~ "Target Value: #{x.line_count_target_value}"
    assert response =~ "Ratio: #{x.line_count_ratio}"
    assert response =~ "Unit: #{x.line_count_unit}"
    assert response =~ "Description: #{x.line_count_description}"

    assert response =~ "Test Automation Code Coverage"
    assert response =~ "Actual Value: #{x.test_automation_code_coverage_actual_value}"
    assert response =~ "Target Value: #{x.test_automation_code_coverage_target_value}"
    assert response =~ "Ratio: #{x.test_automation_code_coverage_ratio}"
    assert response =~ "Unit: #{x.test_automation_code_coverage_unit}"
    assert response =~ "Description: #{x.test_automation_code_coverage_description}"

    assert response =~ "Halstead Complexity Volume"

    assert response =~ "Volume"
    assert response =~ "Actual Value: #{x.halstead_complexity_volume_actual_value}"
    assert response =~ "Target Value: #{x.halstead_complexity_volume_target_value}"
    assert response =~ "Unit: #{x.halstead_complexity_volume_unit}"
    assert response =~ "Description: #{x.halstead_complexity_volume_description}"

    assert response =~ "Difficulty"
    assert response =~ "Actual Value: #{x.halstead_complexity_difficulty_actual_value}"
    assert response =~ "Target Value: #{x.halstead_complexity_difficulty_target_value}"
    assert response =~ "Ratio: #{x.halstead_complexity_difficulty_ratio}"
    assert response =~ "Unit: #{x.halstead_complexity_difficulty_unit}"
    assert response =~ "Description: #{x.halstead_complexity_difficulty_description}"

    assert response =~ "Effort"
    assert response =~ "Actual Value: #{x.halstead_complexity_effort_actual_value}"
    assert response =~ "Target Value: #{x.halstead_complexity_effort_target_value}"
    assert response =~ "Ratio: #{x.halstead_complexity_effort_ratio}"
    assert response =~ "Unit: #{x.halstead_complexity_effort_unit}"
    assert response =~ "Description: #{x.halstead_complexity_effort_description}"

  end

  test "create", %{conn: conn} do
    {:ok, lv, _html} = live(conn, ~p"/initiatives/new")

    result =
      lv
      |> form("#x_form", %{
        "form[name]" => "alfa"
      })
      |> render_submit()

    case result do
      {:error, {:live_redirect, %{to: path}}} ->
        assert path == "/initiatives"
      html when is_binary(html) ->
        assert html =~ "Initiatives"
      other ->
        flunk("Unexpected result: #{inspect(other)}")
    end
  end
end
