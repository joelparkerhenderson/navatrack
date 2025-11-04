#!/bin/sh
set -euf

export App=Navatrack
export app=navatrack
export Dom=Works
export Resource=Aim
export Resources=Aims
export resources=aims

mix ash.gen.resource \
    $App.$Dom.$Resource \
    --conflicts replace \
    --default-actions create,read,update,destroy \
    --extend postgres \
    --uuid-primary-key id \
    --attribute name:string:required \
    --attribute sign:string \
    --attribute status:string \
    --attribute tagging:string \
    --attribute note:string \
    \
    --attribute parent_id:id \
    --attribute parent_order:integer \
    \
    --attribute web:string \
    --attribute email:string \
    --attribute phone:string \
    --attribute chat:string \
    --attribute calendar:string \
    --attribute postal:string \
    --attribute rdf_type:string \
    \
    --attribute bluesky_as_url:string \
    --attribute codeberg_as_url:string \
    --attribute facebook_as_url:string \
    --attribute github_as_url:string \
    --attribute instagram_as_url:string \
    --attribute linkedin_as_url:string \
    --attribute orcid_as_url:string \
    --attribute tiktok_as_url:string \
    --attribute wikipedia_as_url:string \
    --attribute youtube_as_url:string \
    \
    --attribute location_iso_3166_1_alpha_2:string \
    --attribute location_iso_3166_2:string \
    --attribute location_postal_code:string \
    --attribute location_latitude_as_decimal_degrees:decimal \
    --attribute location_longitude_as_decimal_degrees:decimal \
    \
    --attribute avatar_image_400x400_url:string \
    --attribute avatar_image_400x400_alt:string \
    --attribute main_image_1080x1080_url:string \
    --attribute main_image_1080x1080_alt:string \
    --attribute main_image_1920x1080_url:string \
    --attribute main_image_1920x1080_alt:string \
    --attribute main_image_1080x1920_url:string \
    --attribute main_image_1080x1920_alt:string \
    \
    --attribute purpose_statement:string \
    --attribute :vision_statement:string \
    --attribute :mission_statement:string \
    --attribute :values_statement:string \
    \
    --attribute :ai_agent_instructions_as_url:string \
    --attribute :ai_agent_instructions_as_markdown:string \
    \
    --attribute home_emoji_url:string \
    --attribute bellhop_bell_emoji_url:string \
    --attribute target_emoji_url:string \
    --attribute gear_emoji_url:string \
    --attribute spiral_calendar_emoji_url:string \
    --attribute sparkles_emoji_url:string \
    --attribute speech_bubble_emoji_url:string \
    --attribute newspaper_emoji_url:string \
    --attribute bar_chart_emoji_url:string \
    --attribute movie_camera_emoji_url:string \
    --attribute construction_worker_emoji_url:string \
    --attribute crystal_ball_emoji_url:string \
    --attribute butterfly_emoji_url:string \
    --attribute lady_beetle_emoji_url:string \
    \
    --attribute email_distribution_list:string \
    --attribute daisyui_timeline_html:string \
    --attribute org_mode:string \
    --attribute task_list_as_markdown:string \
    --attribute ways_of_working_as_markdown:string \
    --attribute objectives_and_key_results_as_markdown:string \
    --attribute key_performance_indicators_as_markdown:string \
    --attribute glossary_as_url:string \
    --attribute glossary_as_markdown:string \
    --attribute roles_and_responsibilities_as_url:string \
    --attribute roles_and_responsibilities_as_markdown:string \
    --attribute responsibility_assignment_matrix_as_url:string \
    --attribute responsibility_assignment_matrix_as_markdown:string \
    \
    --attribute gs1_digital_link:string \
    --attribute gs1_country_code:string \
    --attribute gs1_global_location_number:string \
    --attribute isic_v4_code:string \
    --attribute isic_v4_name:string \
    --attribute six_pager_double_sider_as_url:string \
    --attribute six_pager_double_sider_as_markdown:string \
    \
    --attribute swot_as_url:string \
    --attribute swot_strengths_as_markdown:string \
    --attribute swot_weaknesses_as_markdown:string \
    --attribute swot_opportunities_as_markdown:string \
    --attribute swot_threats_as_markdown:string \
    \
    --attribute raid_as_url:string \
    --attribute raid_risks_as_markdown:string \
    --attribute raid_assumptions_as_markdown:string \
    --attribute raid_issues_as_markdown:string \
    --attribute raid_dependencies_as_markdown:string \
    \
    --attribute rice_as_url:string \
    --attribute rice_reach_as_markdown:string \
    --attribute rice_impact_as_markdown:string \
    --attribute rice_confidence_as_markdown:string \
    --attribute rice_effort_as_markdown:string \
    \
    --attribute sipoc_as_url:string \
    --attribute sipoc_suppliers_as_markdown:string \
    --attribute sipoc_inputs_as_markdown:string \
    --attribute sipoc_processes_as_markdown:string \
    --attribute sipoc_outputs_as_markdown:string \
    --attribute sipoc_customers_as_markdown:string \
    \
    --attribute steeple_as_url:string \
    --attribute steeple_social_as_markdown:string \
    --attribute steeple_technological_as_markdown:string \
    --attribute steeple_economic_as_markdown:string \
    --attribute steeple_environmental_as_markdown:string \
    --attribute steeple_political__as_markdown:string \
    --attribute steeple_legal_as_markdown:string \
    --attribute steeple_ethical_as_markdown:string \
    \
    --attribute porters_five_forces_as_url:string \
    --attribute porters_five_forces_entrants_as_markdown:string \
    --attribute porters_five_forces_substitutes_as_markdown:string \
    --attribute porters_five_forces_customers_as_markdown:string \
    --attribute porters_five_forces_suppliers_as_markdown:string \
    --attribute porters_five_forces_competitors_as_markdown:string \
    \
    --attribute code_of_conduct_policy_as_url:string \
    --attribute code_of_conduct_policy_as_markdown:string \
    --attribute coordinated_disclosure_policy_as_url:string \
    --attribute coordinated_disclosure_policy_as_markdown:string \
    --attribute code_of_conduct_policy_as_url:string \
    --attribute code_of_conduct_policy_as_markdown:string \
    --attribute copyright_policy_as_url:string \
    --attribute copyright_policy_as_markdown:string \
    --attribute corrections_policy_as_url:string \
    --attribute corrections_policy_as_markdown:string \
    --attribute diversity_policy_as_url:string \
    --attribute diversity_policy_as_markdown:string \
    --attribute equal_opportunity_policy_as_url:string \
    --attribute equal_opportunity_policy_as_markdown:string \
    --attribute ethics_policy_as_url:string \
    --attribute ethics_policy_as_markdown:string \
    --attribute legal_policy_as_url:string \
    --attribute legal_policy_as_markdown:string \
    --attribute license_policy_as_url:string \
    --attribute license_policy_as_markdown:string \
    --attribute open_source_policy_as_url:string \
    --attribute open_source_policy_as_markdown:string \
    --attribute privacy_policy_as_url:string \
    --attribute privacy_policy_as_markdown:string \
    --attribute safety_policy_as_url:string \
    --attribute safety_policy_as_markdown:string \
    --attribute security_policy_as_url:string \
    --attribute security_policy_as_markdown:string \
    --attribute socials_policy_as_url:string \
    --attribute socials_policy_as_markdown:string \
    --attribute staff_policy_as_url:string \
    --attribute staff_policy_as_markdown:string \
    \
    --attribute arc42_as_url:string \
    --attribute arc42_01_introduction_and_goals_as_markdown:string \
    --attribute arc42_02_constraints_as_markdown:string \
    --attribute arc42_03_context_and_scope_as_markdown:string \
    --attribute arc42_04_solution_strategy_as_markdown:string \
    --attribute arc42_05_building_block_view_as_markdown:string \
    --attribute arc42_06_runtime_view_as_markdown:string \
    --attribute arc42_07_deployment_view_as_markdown:string \
    --attribute arc42_08_crosscutting_concepts_as_markdown:string \
    --attribute arc42_09_architectural_decisions_as_markdown:string \
    --attribute arc42_10_quality_requirements_as_markdown:string \
    --attribute arc42_11_risks_and_technical_debt_as_markdown:string \
    --attribute arc42_12_glossary_as_markdown:string \
    \
    --attribute explain_stakeholders_as_markdown:string \
    --attribute explain_history_as_markdown:string \
    --attribute explain_authentication_as_markdown:string \
    --attribute explain_authorization_as_markdown:string \
    --attribute explain_use_cases_as_markdown:string \
    --attribute explain_demographics_as_markdown:string \
    --attribute explain_ui_as_markdown:string \
    --attribute explain_api_as_markdown:string \
    --attribute explain_data_as_markdown:string \
    --attribute explain_mobile_as_markdown:string \
    --attribute explain_legal_as_markdown:string \
    --attribute explain_financial_as_markdown:string \
    --attribute explain_service_level_agreement_as_markdown:string \
    --attribute explain_disaster_recovery_as_markdown:string \
    \
    --attribute quality_availability_as_markdown:string \
    --attribute quality_certifiability_as_markdown:string \
    --attribute quality_compatibility_as_markdown:string \
    --attribute quality_efficiency_as_markdown:string \
    --attribute quality_governability_as_markdown:string \
    --attribute quality_maintainability_as_markdown:string \
    --attribute quality_observability_as_markdown:string \
    --attribute quality_operability_as_markdown:string \
    --attribute quality_recoverability_as_markdown:string \
    --attribute quality_scalability_as_markdown:string \
    --attribute quality_security_as_markdown:string \
    --attribute quality_suitability_as_markdown:string \
    --attribute quality_testability_as_markdown:string \
    --attribute quality_transferability_as_markdown:string \
    --attribute quality_translatability_as_markdown:string \
    --attribute quality_warrantability_as_markdown:string \
    \
    --attribute apache_echart_as_url:string \
    --attribute apache_echart_as_typescript:string \
    \
    --attribute net_promoter_score_customer_perspective_actual:decimal \
    --attribute net_promoter_score_customer_perspective_expect:decimal \
    --attribute net_promoter_score_customer_perspective_ratio:decimal \
    --attribute net_promoter_score_customer_perspective_unit:string \
    --attribute net_promoter_score_customer_perspective_description_as_markdown:string \
    \
    --attribute net_promoter_score_user_perspective_actual:decimal \
    --attribute net_promoter_score_user_perspective_expect:decimal \
    --attribute net_promoter_score_user_perspective_ratio:decimal \
    --attribute net_promoter_score_user_perspective_unit:string \
    --attribute net_promoter_score_user_perspective_description_as_markdown:string \
    \
    --attribute net_promoter_score_worker_perspective_actual:decimal \
    --attribute net_promoter_score_worker_perspective_expect:decimal \
    --attribute net_promoter_score_worker_perspective_ratio:decimal \
    --attribute net_promoter_score_worker_perspective_unit:string \
    --attribute net_promoter_score_worker_perspective_description_as_markdown:string \
    \
    --attribute active_users_actual:decimal \
    --attribute active_users_expect:decimal \
    --attribute active_users_ratio:decimal \
    --attribute active_users_unit:string \
    --attribute active_users_description_as_markdown:string \
    \
    --attribute uptime_percentage_actual:decimal \
    --attribute uptime_percentage_expect:decimal \
    --attribute uptime_percentage_ratio:decimal \
    --attribute uptime_percentage_unit:string \
    --attribute uptime_percentage_description_as_markdown:string \
    \
    --attribute burn_rate_net_cash_per_week_actual:integer \
    --attribute burn_rate_net_cash_per_week_expect:integer \
    --attribute burn_rate_net_cash_per_week_ratio:integer \
    --attribute burn_rate_net_cash_per_week_unit:string \
    --attribute burn_rate_net_cash_per_week_description_as_markdown:string \
    \
    --attribute burn_rate_net_hours_per_week_actual:integer \
    --attribute burn_rate_net_hours_per_week_expect:integer \
    --attribute burn_rate_net_hours_per_week_ratio:integer \
    --attribute burn_rate_net_hours_per_week_unit:string \
    --attribute burn_rate_net_hours_per_week_description_as_markdown:string \
    \
    --attribute earned_value_management_planned_value:decimal \
    --attribute earned_value_management_earned_value:decimal \
    --attribute earned_value_management_actual_cost:decimal \
    --attribute earned_value_management_cost_variance:decimal \
    --attribute earned_value_management_cost_variance_ratio:decimal \
    --attribute earned_value_management_cost_performance_index:decimal \
    --attribute earned_value_management_schedule_variance:decimal \
    --attribute earned_value_management_schedule_variance_ratio:decimal \
    --attribute earned_value_management_schedule_performance_index:decimal \
    \
    --attribute total_project_control_dipp:decimal \
    --attribute total_project_control_dipp_progress_index_ratio:decimal \
    --attribute total_project_control_dipp_progress_index_numerator:decimal \
    --attribute total_project_control_dipp_progress_index_denominator:decimal \
    --attribute total_project_control_expected_monetary_value:decimal \
    --attribute total_project_control_cost_estimate_to_complete:decimal \
    \
    --attribute deployment_frequency_actual:decimal \
    --attribute deployment_frequency_expect:decimal \
    --attribute deployment_frequency_ratio:decimal \
    --attribute deployment_frequency_unit:string \
    --attribute deployment_frequency_description_as_markdown:string \
    \
    --attribute lead_time_for_changes_actual:decimal \
    --attribute lead_time_for_changes_expect:decimal \
    --attribute lead_time_for_changes_ratio:decimal \
    --attribute lead_time_for_changes_unit:string \
    --attribute lead_time_for_changes_description_as_markdown:string \
    \
    --attribute change_failure_rate_actual:decimal \
    --attribute change_failure_rate_expect:decimal \
    --attribute change_failure_rate_ratio:decimal \
    --attribute change_failure_rate_unit:string \
    --attribute change_failure_rate_description_as_markdown:string \
    \
    --attribute mean_time_to_recovery_actual:decimal \
    --attribute mean_time_to_recovery_expect:decimal \
    --attribute mean_time_to_recovery_ratio:decimal \
    --attribute mean_time_to_recovery_unit:string \
    --attribute mean_time_to_recovery_description_as_markdown:string\
    \
    --attribute maintainability_index_actual:decimal \
    --attribute maintainability_index_expect:decimal \
    --attribute maintainability_index_ratio:decimal \
    --attribute maintainability_index_unit:string \
    --attribute maintainability_index_description_as_markdown:string \
    \
    --attribute line_count_actual:decimal \
    --attribute line_count_expect:decimal \
    --attribute line_count_ratio:decimal \
    --attribute line_count_unit:string \
    --attribute line_count_description_as_markdown:string \
    \
    --attribute test_automation_code_coverage_actual:decimal \
    --attribute test_automation_code_coverage_expect:decimal \
    --attribute test_automation_code_coverage_ratio:decimal \
    --attribute test_automation_code_coverage_unit:string \
    --attribute test_automation_code_coverage_description_as_markdown:string \
    \
    --attribute halstead_complexity_volume_actual:decimal \
    --attribute halstead_complexity_volume_expect:decimal \
    --attribute halstead_complexity_volume_ratio:decimal \
    --attribute halstead_complexity_volume_unit:string \
    --attribute halstead_complexity_volume_description_as_markdown:string \
    \
    --attribute halstead_complexity_difficulty_actual:decimal \
    --attribute halstead_complexity_difficulty_expect:decimal \
    --attribute halstead_complexity_difficulty_ratio:decimal \
    --attribute halstead_complexity_difficulty_unit:string \
    --attribute halstead_complexity_difficulty_description_as_markdown:string \
    \
    --attribute halstead_complexity_effort_actual:decimal \
    --attribute halstead_complexity_effort_expect:decimal \
    --attribute halstead_complexity_effort_ratio:decimal \
    --attribute halstead_complexity_effort_unit:string \
    --attribute halstead_complexity_effort_description_as_markdown:string \

mix ash.codegen create_plans
mix ash.migrate

touch priv/repo/migrations/00000000000000_create_$resources.exs

mkdir -p lib/${app}_web/live/$resources
touch lib/${app}_web/live/$resources/form_live.ex
touch lib/${app}_web/live/$resources/index_live.ex
touch lib/${app}_web/live/$resources/show_live.ex

mkdir -p test/${app}_web/live/$resources
touch test/${app}_web/live/$resources/form_test.ex
touch test/${app}_web/live/$resources/index_test.ex
touch test/${app}_web/live/$resources/show_test.ex

cat << EOF
Edit file lib/${app}_web/router.ex to add live routes:
live "$resources", $Resources.IndexLive
live "$resources/new", $Resources.FormLive, :new
live "$resources/:id", $Resources.ShowLive
live "$resources/:id/edit", $Resources.FormLive, :edit
EOF
