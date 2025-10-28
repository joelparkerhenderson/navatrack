defmodule NavatrackWeb.Aims.ShowTest do
  # import Phoenix.LiveViewTest
  use NavatrackWeb.ConnCase
  use NavatrackWeb.AuthCase
  use NavatrackWeb.ShowCase
  alias Navatrack.Works.Aim, as: X

  setup %{conn: conn} do
    {:ok, user} = my_user()
    {:ok, user} = my_sign_in(user)

    conn =
      conn
      |> Phoenix.ConnTest.init_test_session(%{})
      |> AshAuthentication.Plug.Helpers.store_in_session(user)

    {:ok, conn: conn}
  end

  test "show", %{conn: conn} do
    x = X.fab!
    conn = get(conn, ~p"/aims/#{x.id}")
    response = html_response(conn, 200)

    assert_meta(response, x)
    assert_lede(response, x)
    assert_contacts(response, x)
    assert_socials(response, x)
    assert_socials(response, x)
    assert_images(response, x)

    assert response =~ "Location"
    assert response =~ "Country code ISO 3166-1 Alpha 2: #{x.location_iso_3166_1_alpha_2}"
    assert response =~ "Subcountry code ISO 3166-2: #{x.location_iso_3166_2}"
    assert response =~ "Postal code: #{x.location_postal_code}"
    assert response =~ "Latitude: #{x.location_latitude_as_decimal_degrees}"
    assert response =~ "Longitude: #{x.location_longitude_as_decimal_degrees}"

    assert response =~ "Ideals"
    # assert response =~ "Purpose Statement: #{x.purpose_statement}"
    # assert response =~ "Vision Statement: #{x.vision_statement}"
    # assert response =~ "Mission Statement: #{x.mission_statement}"
    # assert response =~ "Values Statement: #{x.values_statement}"

    assert response =~ "AI Agent Instructions"
    assert response =~ "URL: <a href=\"#{x.ai_agent_instructions_as_url}\">#{x.ai_agent_instructions_as_url}</a>"
    assert response =~ "Markdown: #{x.ai_agent_instructions_as_markdown}"

    assert response =~ "Deeper Dive"
    assert response =~ "Email distribution list: #{x.email_distribution_list}"
    assert response =~ "DaisyUI timeline HTML: #{x.daisyui_timeline_html}"
    assert response =~ "Org Mode: #{x.org_mode}"
    assert response =~ "Task list: #{x.task_list_as_markdown}"
    assert response =~ "Ways Of Working (WOW): #{x.ways_of_working_as_markdown}"
    assert response =~ "Objectives and Key Results (OKRs): #{x.objectives_and_key_results_as_markdown}"
    assert response =~ "Key Performance Indicators (KPIs): #{x.key_performance_indicators_as_markdown}"

    assert response =~ "🏠 Home: <a href=\"#{x.home_emoji_url}\">#{x.home_emoji_url}</a>"
    assert response =~ "🛎️ Concierge: <a href=\"#{x.bellhop_bell_emoji_url}\">#{x.bellhop_bell_emoji_url}</a>"
    assert response =~ "🎯 Target: <a href=\"#{x.target_emoji_url}\">#{x.target_emoji_url}</a>"
    assert response =~ "⚙️ Technical Contact: <a href=\"#{x.gear_emoji_url}\">#{x.gear_emoji_url}</a>"
    assert response =~ "🗓️ Calendar: <a href=\"#{x.spiral_calendar_emoji_url}\">#{x.spiral_calendar_emoji_url}</a>"
    assert response =~ "✨ AI: <a href=\"#{x.sparkles_emoji_url}\">#{x.sparkles_emoji_url}</a>"
    assert response =~ "💬 Chat: <a href=\"#{x.speech_bubble_emoji_url}\">#{x.speech_bubble_emoji_url}</a>"
    assert response =~ "📰 News: <a href=\"#{x.newspaper_emoji_url}\">#{x.newspaper_emoji_url}</a>"
    assert response =~ "📊 Charts: <a href=\"#{x.bar_chart_emoji_url}\">#{x.bar_chart_emoji_url}</a>"
    assert response =~ "🎥 Videos: <a href=\"#{x.movie_camera_emoji_url}\">#{x.movie_camera_emoji_url}</a>"
    assert response =~ "👷 Workers: <a href=\"#{x.construction_worker_emoji_url}\">#{x.construction_worker_emoji_url}</a>"
    assert response =~ "🔮 Future: <a href=\"#{x.crystal_ball_emoji_url}\">#{x.crystal_ball_emoji_url}</a>"
    assert response =~ "🦋 Feature Tracker: <a href=\"#{x.butterfly_emoji_url}\">#{x.butterfly_emoji_url}</a>"
    assert response =~ "🐞 Bug Tracker: <a href=\"#{x.lady_beetle_emoji_url}\">#{x.lady_beetle_emoji_url}</a>"

    assert response =~ "Touchpoints"

    assert response =~ "Glossary"
    assert response =~ "URL: <a href=\"#{x.glossary_as_url}\">#{x.glossary_as_url}</a>"
    assert response =~ "Markdown: #{x.glossary_as_markdown}"

    assert response =~ "Business Analysis"

    assert response =~ "GS1 Codes"
    assert response =~ "GS1 digital link: #{x.gs1_digital_link}"
    assert response =~ "GS1 country code: #{x.gs1_country_code}"
    assert response =~ "GS1 global location number: #{x.gs1_global_location_number}"

    assert response =~ "International Standard Industrial Classification V4"
    assert response =~ "ISIC v4 code: #{x.isic_v4_code}"
    assert response =~ "ISIC v4 name: #{x.isic_v4_name}"

    assert response =~ "Six-Pager Double-Sider"
    assert response =~ "URL: <a href=\"#{x.six_pager_double_sider_as_url}\">#{x.six_pager_double_sider_as_url}</a>"
    assert response =~ "Markdown: #{x.six_pager_double_sider_as_markdown}"

    assert response =~ "SWOT: Strengths Weaknesses Opportunities Threats"
    assert response =~ "URL: <a href=\"#{x.swot_as_url}\">#{x.swot_as_url}</a>"
    assert response =~ "Strengths: #{x.swot_strengths_as_markdown}"
    assert response =~ "Weaknesses: #{x.swot_weaknesses_as_markdown}"
    assert response =~ "Opportunities: #{x.swot_opportunities_as_markdown}"
    assert response =~ "Threats: #{x.swot_threats_as_markdown}"

    assert response =~ "RAID: Risks Assumptions Issues Dependencies"
    assert response =~ "URL: <a href=\"#{x.raid_as_url}\">#{x.raid_as_url}</a>"
    assert response =~ "Risks: #{x.raid_risks_as_markdown}"
    assert response =~ "Assumptions: #{x.raid_assumptions_as_markdown}"
    assert response =~ "Issues: #{x.raid_issues_as_markdown}"
    assert response =~ "Dependencies: #{x.raid_dependencies_as_markdown}"

    assert response =~ "RICE: Reach Impact Confidence Effort"
    assert response =~ "URL: <a href=\"#{x.rice_as_url}\">#{x.rice_as_url}</a>"
    assert response =~ "Reach: #{x.rice_reach_as_markdown}"
    assert response =~ "Impact: #{x.rice_impact_as_markdown}"
    assert response =~ "Confidence: #{x.rice_confidence_as_markdown}"
    assert response =~ "Effort: #{x.rice_effort_as_markdown}"

    assert response =~ "ROPE: Realistic Optimistic Pessimistic Equilibristic"
    assert response =~ "URL: <a href=\"#{x.rope_as_url}\">#{x.rope_as_url}</a>"
    assert response =~ "Realistic: #{x.rope_realistic_as_markdown}"
    assert response =~ "Optimistic: #{x.rope_optimistic_as_markdown}"
    assert response =~ "Pessimistic: #{x.rope_pessimistic_as_markdown}"
    assert response =~ "Equilibristic: #{x.rope_equilibristic_as_markdown}"

    assert response =~ "Porter&#39;s Five Forces"
    assert response =~ "URL: <a href=\"#{x.porters_five_forces_as_url}\">#{x.porters_five_forces_as_url}</a>"
    assert response =~ "Threat Of Entrants: #{x.porters_five_forces_entrants_as_markdown}"
    assert response =~ "Threat Of Substitutes: #{x.porters_five_forces_substitutes_as_markdown}"
    assert response =~ "Bargaining Power Of Customers: #{x.porters_five_forces_customers_as_markdown}"
    assert response =~ "Bargaining Power Of Suppliers: #{x.porters_five_forces_suppliers_as_markdown}"
    assert response =~ "Rivalry Of Competitors: #{x.porters_five_forces_competitors_as_markdown}"

    assert response =~ "SIPOC: Suppliers Inputs Processes Outputs Customers"
    assert response =~ "URL: <a href=\"#{x.sipoc_as_url}\">#{x.sipoc_as_url}</a>"
    assert response =~ "Suppliers: #{x.sipoc_suppliers_as_markdown}"
    assert response =~ "Inputs: #{x.sipoc_inputs_as_markdown}"
    assert response =~ "Processes: #{x.sipoc_processes_as_markdown}"
    assert response =~ "Outputs: #{x.sipoc_outputs_as_markdown}"
    assert response =~ "Customers: #{x.sipoc_customers_as_markdown}"

    assert response =~ "STEEPLE: Social Technological Economic Environmental Political Legal Ethical"
    assert response =~ "URL: <a href=\"#{x.steeple_as_url}\">#{x.steeple_as_url}</a>"
    assert response =~ "Social: #{x.steeple_social_as_markdown}"
    assert response =~ "Technological: #{x.steeple_technological_as_markdown}"
    assert response =~ "Economic: #{x.steeple_economic_as_markdown}"
    assert response =~ "Environmental: #{x.steeple_environmental_as_markdown}"
    assert response =~ "Political: #{x.steeple_political_as_markdown}"
    assert response =~ "Legal: #{x.steeple_legal_as_markdown}"
    assert response =~ "Ethical: #{x.steeple_ethical_as_markdown}"

    assert response =~ "Roles and Responsibilities"
    assert response =~ "URL: <a href=\"#{x.roles_and_responsibilities_as_url}\">#{x.roles_and_responsibilities_as_url}</a>"
    assert response =~ "Markdown: #{x.roles_and_responsibilities_as_markdown}"

    assert response =~ "Responsibility Assignment Matrix (RAM)"
    assert response =~ "URL: <a href=\"#{x.responsibility_assignment_matrix_as_url}\">#{x.responsibility_assignment_matrix_as_url}</a>"
    assert response =~ "Markdown: #{x.responsibility_assignment_matrix_as_markdown}"

    assert response =~ "Policies"

    assert response =~ "Code of Conduct Policy"
    assert response =~ "URL: <a href=\"#{x.code_of_conduct_policy_as_url}\">#{x.code_of_conduct_policy_as_url}</a>"
    assert response =~ "Markdown: #{x.code_of_conduct_policy_as_markdown}"

    assert response =~ "Coordinated Disclosure Policy"
    assert response =~ "URL: <a href=\"#{x.coordinated_disclosure_policy_as_url}\">#{x.coordinated_disclosure_policy_as_url}</a>"
    assert response =~ "Markdown: #{x.coordinated_disclosure_policy_as_markdown}"

    assert response =~ "Copyright Policy"
    assert response =~ "URL: <a href=\"#{x.copyright_policy_as_url}\">#{x.copyright_policy_as_url}</a>"
    assert response =~ "Markdown: #{x.copyright_policy_as_markdown}"

    assert response =~ "Corrections Policy"
    assert response =~ "URL: <a href=\"#{x.corrections_policy_as_url}\">#{x.corrections_policy_as_url}</a>"
    assert response =~ "Markdown: #{x.corrections_policy_as_markdown}"

    assert response =~ "Diversity Policy"
    assert response =~ "URL: <a href=\"#{x.diversity_policy_as_url}\">#{x.diversity_policy_as_url}</a>"
    assert response =~ "Markdown: #{x.diversity_policy_as_markdown}"

    assert response =~ "Equal Opportunity Policy"
    assert response =~ "URL: <a href=\"#{x.equal_opportunity_policy_as_url}\">#{x.equal_opportunity_policy_as_url}</a>"
    assert response =~ "Markdown: #{x.equal_opportunity_policy_as_markdown}"

    assert response =~ "Ethics Policy"
    assert response =~ "URL: <a href=\"#{x.ethics_policy_as_url}\">#{x.ethics_policy_as_url}</a>"
    assert response =~ "Markdown: #{x.ethics_policy_as_markdown}"

    assert response =~ "Legal Policy"
    assert response =~ "URL: <a href=\"#{x.legal_policy_as_url}\">#{x.legal_policy_as_url}</a>"
    assert response =~ "Markdown: #{x.legal_policy_as_markdown}"

    assert response =~ "License Policy"
    assert response =~ "URL: <a href=\"#{x.license_policy_as_url}\">#{x.license_policy_as_url}</a>"
    assert response =~ "Markdown: #{x.license_policy_as_markdown}"

    assert response =~ "Open Source Policy"
    assert response =~ "URL: <a href=\"#{x.open_source_policy_as_url}\">#{x.open_source_policy_as_url}</a>"
    assert response =~ "Markdown: #{x.open_source_policy_as_markdown}"

    assert response =~ "Privacy Policy"
    assert response =~ "URL: <a href=\"#{x.privacy_policy_as_url}\">#{x.privacy_policy_as_url}</a>"
    assert response =~ "Markdown: #{x.privacy_policy_as_markdown}"

    assert response =~ "Safety Policy"
    assert response =~ "URL: <a href=\"#{x.safety_policy_as_url}\">#{x.safety_policy_as_url}</a>"
    assert response =~ "Markdown: #{x.safety_policy_as_markdown}"

    assert response =~ "Security Policy"
    assert response =~ "URL: <a href=\"#{x.security_policy_as_url}\">#{x.security_policy_as_url}</a>"
    assert response =~ "Markdown: #{x.security_policy_as_markdown}"

    assert response =~ "Socials Policy"
    assert response =~ "URL: <a href=\"#{x.socials_policy_as_url}\">#{x.socials_policy_as_url}</a>"
    assert response =~ "Markdown: #{x.socials_policy_as_markdown}"

    assert response =~ "Staff Policy"
    assert response =~ "URL: <a href=\"#{x.staff_policy_as_url}\">#{x.staff_policy_as_url}</a>"
    assert response =~ "Markdown: #{x.staff_policy_as_markdown}"

    assert response =~ "Arc42"
    assert response =~ "URL: <a href=\"#{x.arc42_as_url}\">#{x.arc42_as_url}</a>"
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
    assert response =~ "URL: <a href=\"#{x.apache_echart_as_url}\">#{x.apache_echart_as_url}</a>"
    assert response =~ "TypeScript: #{x.apache_echart_as_typescript}"

    assert response =~ "Net Promoter Score (NPS)"

    assert response =~ "Customer Perspective"
    assert response =~ "Actual Value: #{x.net_promoter_score_customer_perspective_actual}"
    assert response =~ "Target Value: #{x.net_promoter_score_customer_perspective_expect}"
    assert response =~ "Unit: #{x.net_promoter_score_customer_perspective_unit}"
    assert response =~ "Description: #{x.net_promoter_score_customer_perspective_description_as_markdown}"

    assert response =~ "User Perspective"
    assert response =~ "Actual Value: #{x.net_promoter_score_user_perspective_actual}"
    assert response =~ "Target Value: #{x.net_promoter_score_user_perspective_expect}"
    assert response =~ "Unit: #{x.net_promoter_score_user_perspective_unit}"
    assert response =~ "Description: #{x.net_promoter_score_user_perspective_description_as_markdown}"

    assert response =~ "Worker Perspective"
    assert response =~ "Actual Value: #{x.net_promoter_score_worker_perspective_actual}"
    assert response =~ "Target Value: #{x.net_promoter_score_worker_perspective_expect}"
    assert response =~ "Unit: #{x.net_promoter_score_worker_perspective_unit}"
    assert response =~ "Description: #{x.net_promoter_score_worker_perspective_description_as_markdown}"

    assert response =~ "User Metrics"

    assert response =~ "Active Users"
    assert response =~ "Actual Value: #{x.active_users_actual}"
    assert response =~ "Target Value: #{x.active_users_expect}"
    assert response =~ "Unit: #{x.active_users_unit}"
    assert response =~ "Description: #{x.active_users_description}"

    assert response =~ "Uptime Percentage"
    assert response =~ "Actual Value: #{x.uptime_percentage_actual}"
    assert response =~ "Target Value: #{x.uptime_percentage_expect}"
    assert response =~ "Unit: #{x.uptime_percentage_unit}"
    assert response =~ "Description: #{x.uptime_percentage_description}"

    assert response =~ "Burn Rate"

    assert response =~ "Net Cash Per Week"
    assert response =~ "Actual Value: #{x.burn_rate_net_cash_per_week_actual}"
    assert response =~ "Target Value: #{x.burn_rate_net_cash_per_week_expect}"
    assert response =~ "Unit: #{x.burn_rate_net_cash_per_week_unit}"
    assert response =~ "Description: #{x.burn_rate_net_cash_per_week_description}"

    assert response =~ "Net Hours Per Week"
    assert response =~ "Actual Value: #{x.burn_rate_net_hours_per_week_actual}"
    assert response =~ "Target Value: #{x.burn_rate_net_hours_per_week_expect}"
    assert response =~ "Unit: #{x.burn_rate_net_hours_per_week_unit}"
    assert response =~ "Description: #{x.burn_rate_net_hours_per_week_description}"

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
    assert response =~ "Actual Value: #{x.deployment_frequency_actual}"
    assert response =~ "Target Value: #{x.deployment_frequency_expect}"
    assert response =~ "Ratio: #{x.deployment_frequency_ratio}"
    assert response =~ "Unit: #{x.deployment_frequency_unit}"
    assert response =~ "Description: #{x.deployment_frequency_description}"

    assert response =~ "Lead Time For Changes"
    assert response =~ "Actual Value: #{x.lead_time_for_changes_actual}"
    assert response =~ "Target Value: #{x.lead_time_for_changes_expect}"
    assert response =~ "Ratio: #{x.lead_time_for_changes_ratio}"
    assert response =~ "Unit: #{x.lead_time_for_changes_unit}"
    assert response =~ "Description: #{x.lead_time_for_changes_description}"

    assert response =~ "Change Failure Rate"
    assert response =~ "Actual Value: #{x.change_failure_rate_actual}"
    assert response =~ "Target Value: #{x.change_failure_rate_expect}"
    assert response =~ "Ratio: #{x.change_failure_rate_ratio}"
    assert response =~ "Unit: #{x.change_failure_rate_unit}"
    assert response =~ "Description: #{x.change_failure_rate_description}"

    assert response =~ "Mean Time To Recovery"
    assert response =~ "Actual Value: #{x.mean_time_to_recovery_actual}"
    assert response =~ "Target Value: #{x.mean_time_to_recovery_expect}"
    assert response =~ "Ratio: #{x.mean_time_to_recovery_ratio}"
    assert response =~ "Unit: #{x.mean_time_to_recovery_unit}"
    assert response =~ "Description: #{x.mean_time_to_recovery_description}"

    assert response =~ "Maintainability Index"
    assert response =~ "Actual Value: #{x.maintainability_index_actual}"
    assert response =~ "Target Value: #{x.maintainability_index_expect}"
    assert response =~ "Ratio: #{x.maintainability_index_ratio}"
    assert response =~ "Unit: #{x.maintainability_index_unit}"
    assert response =~ "Description: #{x.maintainability_index_description}"

    assert response =~ "Line Count"
    assert response =~ "Actual Value: #{x.line_count_actual}"
    assert response =~ "Target Value: #{x.line_count_expect}"
    assert response =~ "Ratio: #{x.line_count_ratio}"
    assert response =~ "Unit: #{x.line_count_unit}"
    assert response =~ "Description: #{x.line_count_description}"

    assert response =~ "Test Automation Code Coverage"
    assert response =~ "Actual Value: #{x.test_automation_code_coverage_actual}"
    assert response =~ "Target Value: #{x.test_automation_code_coverage_expect}"
    assert response =~ "Ratio: #{x.test_automation_code_coverage_ratio}"
    assert response =~ "Unit: #{x.test_automation_code_coverage_unit}"
    assert response =~ "Description: #{x.test_automation_code_coverage_description}"

    assert response =~ "Halstead Complexity Volume"

    assert response =~ "Volume"
    assert response =~ "Actual Value: #{x.halstead_complexity_volume_actual}"
    assert response =~ "Target Value: #{x.halstead_complexity_volume_expect}"
    assert response =~ "Unit: #{x.halstead_complexity_volume_unit}"
    assert response =~ "Description: #{x.halstead_complexity_volume_description}"

    assert response =~ "Difficulty"
    assert response =~ "Actual Value: #{x.halstead_complexity_difficulty_actual}"
    assert response =~ "Target Value: #{x.halstead_complexity_difficulty_expect}"
    assert response =~ "Ratio: #{x.halstead_complexity_difficulty_ratio}"
    assert response =~ "Unit: #{x.halstead_complexity_difficulty_unit}"
    assert response =~ "Description: #{x.halstead_complexity_difficulty_description}"

    assert response =~ "Effort"
    assert response =~ "Actual Value: #{x.halstead_complexity_effort_actual}"
    assert response =~ "Target Value: #{x.halstead_complexity_effort_expect}"
    assert response =~ "Ratio: #{x.halstead_complexity_effort_ratio}"
    assert response =~ "Unit: #{x.halstead_complexity_effort_unit}"
    assert response =~ "Description: #{x.halstead_complexity_effort_description}"

  end

end
