defmodule Navatrack.Works.Initiative do
  use Ash.Resource,
    otp_app: :navatrack,
    domain: Navatrack.Works,
    data_layer: AshPostgres.DataLayer

  def singular_snake_case(), do: "initiative"
  def plural_snake_case(), do: "initiatives"
  def singular_title_case(), do: "Initiative"
  def plural_title_case(), do: "Initiatives"

  postgres do
    table "initiatives"
    repo Navatrack.Repo
  end

  attributes do
    uuid_primary_key :id
    attribute :created_at, :utc_datetime_usec
    attribute :updated_at, :utc_datetime_usec
    attribute :deleted_at, :utc_datetime_usec
    attribute :sign, :string
    attribute :kind, :string
    attribute :name, :string
    attribute :status, :string
    attribute :tags, {:array, :string}
    attribute :url, :string
    attribute :email, :string
    attribute :phone, :string
    attribute :messaging, :string
    attribute :postal, :string
    attribute :orcid_pid, :string
    attribute :rdf_type, :string
    attribute :linkedin_url, :string
    attribute :github_url, :string
    attribute :codeberg_url, :string
    attribute :agents_as_url, :string
    attribute :agents_as_markdown, :string
    attribute :avatar_image_400x400_url, :string
    attribute :avatar_image_400x400_alt, :string
    attribute :main_image_1080x1080_url, :string
    attribute :main_image_1080x1080_alt, :string
    attribute :main_image_1920x1080_url, :string
    attribute :main_image_1920x1080_alt, :string
    attribute :main_image_1080x1920_url, :string
    attribute :main_image_1080x1920_alt, :string
    attribute :home_emoji_url, :string
    attribute :bellhop_bell_emoji_url, :string
    attribute :target_emoji_url, :string
    attribute :gear_emoji_url, :string
    attribute :spiral_calendar_emoji_url, :string
    attribute :sparkles_emoji_url, :string
    attribute :speech_bubble_emoji_url, :string
    attribute :newspaper_emoji_url, :string
    attribute :bar_chart_emoji_url, :string
    attribute :movie_camera_emoji_url, :string
    attribute :construction_worker_emoji_url, :string
    attribute :crystal_ball_emoji_url, :string
    attribute :butterfly_emoji_url, :string
    attribute :lady_beetle_emoji_url, :string
    attribute :note, :string
    attribute :email_distribution_list, :string
    attribute :daisyui_timeline_html, :string
    attribute :org_mode, :string
    attribute :task_list_as_markdown, :string
    attribute :ways_of_working_as_markdown, :string
    attribute :objectives_and_key_results_as_markdown, :string
    attribute :key_performance_indicators_as_markdown, :string
    attribute :glossary_as_url, :string
    attribute :glossary_as_markdown, :string
    attribute :six_pager_double_sider_as_url, :string
    attribute :six_pager_double_sider_as_markdown, :string
    attribute :swot_as_url, :string
    attribute :swot_as_markdown, :string
    attribute :porters_five_forces_as_url, :string
    attribute :porters_five_forces_as_markdown, :string
    attribute :pestle_as_url, :string
    attribute :pestle_as_markdown, :string
    attribute :roles_and_responsibilities_as_url, :string
    attribute :roles_and_responsibilities_as_markdown, :string
    attribute :responsibility_assignment_matrix_as_url, :string
    attribute :responsibility_assignment_matrix_as_markdown, :string
    attribute :code_of_conduct_url, :string
    attribute :code_of_conduct_as_markdown, :string
    attribute :license_url, :string
    attribute :license_as_markdown, :string
    attribute :sipoc_suppliers_as_url, :string
    attribute :sipoc_suppliers_as_markdown, :string
    attribute :sipoc_inputs_as_url, :string
    attribute :sipoc_inputs_as_markdown, :string
    attribute :sipoc_processes_as_url, :string
    attribute :sipoc_processes_as_markdown, :string
    attribute :sipoc_outputs_as_url, :string
    attribute :sipoc_outputs_as_markdown, :string
    attribute :sipoc_customers_as_url, :string
    attribute :sipoc_customers_as_markdown, :string
    attribute :arc42_as_url, :string
    attribute :arc42_as_markdown, :string
    attribute :arc42_01_introduction_and_goals_as_markdown, :string
    attribute :arc42_02_constraints_as_markdown, :string
    attribute :arc42_03_context_and_scope_as_markdown, :string
    attribute :arc42_04_solution_strategy_as_markdown, :string
    attribute :arc42_05_building_block_view_as_markdown, :string
    attribute :arc42_06_runtime_view_as_markdown, :string
    attribute :arc42_07_deployment_view_as_markdown, :string
    attribute :arc42_08_crosscutting_concepts_as_markdown, :string
    attribute :arc42_09_architectural_decisions_as_markdown, :string
    attribute :arc42_10_quality_requirements_as_markdown, :string
    attribute :arc42_11_risks_and_technical_debt_as_markdown, :string
    attribute :arc42_12_glossary_as_markdown, :string
    attribute :explain_stakeholders_as_markdown, :string
    attribute :explain_history_as_markdown, :string
    attribute :explain_authentication_as_markdown, :string
    attribute :explain_authorization_as_markdown, :string
    attribute :explain_use_cases_as_markdown, :string
    attribute :explain_demographics_as_markdown, :string
    attribute :explain_ui_as_markdown, :string
    attribute :explain_api_as_markdown, :string
    attribute :explain_data_as_markdown, :string
    attribute :explain_mobile_as_markdown, :string
    attribute :explain_legal_as_markdown, :string
    attribute :explain_financial_as_markdown, :string
    attribute :explain_service_level_agreement_as_markdown, :string
    attribute :explain_disaster_recovery_as_markdown, :string
    attribute :quality_availability_as_markdown, :string
    attribute :quality_certifiability_as_markdown, :string
    attribute :quality_compatibility_as_markdown, :string
    attribute :quality_efficiency_as_markdown, :string
    attribute :quality_governability_as_markdown, :string
    attribute :quality_maintainability_as_markdown, :string
    attribute :quality_observability_as_markdown, :string
    attribute :quality_operability_as_markdown, :string
    attribute :quality_recoverability_as_markdown, :string
    attribute :quality_scalability_as_markdown, :string
    attribute :quality_security_as_markdown, :string
    attribute :quality_suitability_as_markdown, :string
    attribute :quality_testability_as_markdown, :string
    attribute :quality_transferability_as_markdown, :string
    attribute :quality_translatability_as_markdown, :string
    attribute :quality_warrantability_as_markdown, :string
    attribute :apache_echart_as_url, :string
    attribute :apache_echart_as_typescript, :string
    attribute :customer_net_promoter_score_actual_value, :decimal
    attribute :customer_net_promoter_score_target_value, :decimal
    attribute :customer_net_promoter_score_unit, :string
    attribute :customer_net_promoter_score_description_as_markdown, :string
    attribute :user_net_promoter_score_actual_value, :decimal
    attribute :user_net_promoter_score_target_value, :decimal
    attribute :user_net_promoter_score_unit, :string
    attribute :user_net_promoter_score_description_as_markdown, :string
    attribute :worker_net_promoter_score_actual_value, :decimal
    attribute :worker_net_promoter_score_target_value, :decimal
    attribute :worker_net_promoter_score_unit, :string
    attribute :worker_net_promoter_score_description_as_markdown, :string
    attribute :active_users_actual_value, :integer
    attribute :active_users_target_value, :integer
    attribute :active_users_unit, :string
    attribute :active_users_description, :string
    attribute :uptime_percentage_actual_value, :decimal
    attribute :uptime_percentage_target_value, :decimal
    attribute :uptime_percentage_unit, :string
    attribute :uptime_percentage_description, :string
    attribute :burn_rate_net_cash_per_week_actual_value, :integer
    attribute :burn_rate_net_cash_per_week_target_value, :integer
    attribute :burn_rate_net_cash_per_week_unit, :string
    attribute :burn_rate_net_cash_per_week_description, :string
    attribute :burn_rate_hours_per_week_actual_value, :integer
    attribute :burn_rate_hours_per_week_target_value, :integer
    attribute :burn_rate_hours_per_week_unit, :string
    attribute :burn_rate_hours_per_week_description, :string
    attribute :earned_value_management_planned_value, :decimal
    attribute :earned_value_management_earned_value, :decimal
    attribute :earned_value_management_actual_cost, :decimal
    attribute :earned_value_management_cost_variance, :decimal
    attribute :earned_value_management_cost_variance_ratio, :decimal
    attribute :earned_value_management_cost_performance_index, :decimal
    attribute :earned_value_management_schedule_variance, :decimal
    attribute :earned_value_management_schedule_variance_ratio, :decimal
    attribute :earned_value_management_schedule_performance_index, :decimal
    attribute :total_project_control_dipp, :decimal
    attribute :total_project_control_dipp_progress_index_ratio, :decimal
    attribute :total_project_control_dipp_progress_index_numerator, :decimal
    attribute :total_project_control_dipp_progress_index_denominator, :decimal
    attribute :total_project_control_expected_monetary_value, :decimal
    attribute :total_project_control_cost_estimate_to_complete, :decimal
    attribute :deployment_frequency_actual_value, :decimal
    attribute :deployment_frequency_target_value, :decimal
    attribute :deployment_frequency_ratio, :decimal
    attribute :deployment_frequency_unit, :string
    attribute :deployment_frequency_description, :string
    attribute :lead_time_for_changes_actual_value, :decimal
    attribute :lead_time_for_changes_target_value, :decimal
    attribute :lead_time_for_changes_ratio, :decimal
    attribute :lead_time_for_changes_unit, :string
    attribute :lead_time_for_changes_description, :string
    attribute :change_failure_rate_actual_value, :decimal
    attribute :change_failure_rate_target_value, :decimal
    attribute :change_failure_rate_ratio, :decimal
    attribute :change_failure_rate_unit, :string
    attribute :change_failure_rate_description, :string
    attribute :mean_time_to_recovery_actual_value, :decimal
    attribute :mean_time_to_recovery_target_value, :decimal
    attribute :mean_time_to_recovery_ratio, :decimal
    attribute :mean_time_to_recovery_unit, :string
    attribute :mean_time_to_recovery_description, :string
    attribute :maintainability_index_actual_value, :decimal
    attribute :maintainability_index_target_value, :decimal
    attribute :maintainability_index_ratio, :decimal
    attribute :maintainability_index_unit, :string
    attribute :maintainability_index_description, :string
    attribute :line_count_actual_value, :decimal
    attribute :line_count_target_value, :decimal
    attribute :line_count_ratio, :decimal
    attribute :line_count_unit, :string
    attribute :line_count_description, :string
    attribute :test_automation_code_coverage_actual_value, :decimal
    attribute :test_automation_code_coverage_target_value, :decimal
    attribute :test_automation_code_coverage_ratio, :decimal
    attribute :test_automation_code_coverage_unit, :string
    attribute :test_automation_code_coverage_description, :string
    attribute :halstead_complexity_volume_actual_value, :decimal
    attribute :halstead_complexity_volume_target_value, :decimal
    attribute :halstead_complexity_volume_ratio, :decimal
    attribute :halstead_complexity_volume_unit, :string
    attribute :halstead_complexity_volume_description, :string
    attribute :halstead_complexity_difficulty_actual_value, :decimal
    attribute :halstead_complexity_difficulty_target_value, :decimal
    attribute :halstead_complexity_difficulty_ratio, :decimal
    attribute :halstead_complexity_difficulty_unit, :string
    attribute :halstead_complexity_difficulty_description, :string
    attribute :halstead_complexity_effort_actual_value, :decimal
    attribute :halstead_complexity_effort_target_value, :decimal
    attribute :halstead_complexity_effort_ratio, :decimal
    attribute :halstead_complexity_effort_unit, :string
    attribute :halstead_complexity_effort_description, :string
  end

  actions do
 	  defaults [:create, :read, :update, :destroy]
 	  default_accept [
      :created_at,
      :updated_at,
      :deleted_at,
      :sign,
      :kind,
      :name,
      :status,
      :tags,
      :url,
      :email,
      :phone,
      :messaging,
      :postal,
      :orcid_pid,
      :rdf_type,
      :agents_as_url,
      :agents_as_markdown,
      :avatar_image_400x400_url,
      :avatar_image_400x400_alt,
      :main_image_1080x1080_url,
      :main_image_1080x1080_alt,
      :main_image_1920x1080_url,
      :main_image_1920x1080_alt,
      :main_image_1080x1920_url,
      :main_image_1080x1920_alt,
      :home_emoji_url,
      :bellhop_bell_emoji_url,
      :target_emoji_url,
      :gear_emoji_url,
      :spiral_calendar_emoji_url,
      :sparkles_emoji_url,
      :speech_bubble_emoji_url,
      :newspaper_emoji_url,
      :bar_chart_emoji_url,
      :movie_camera_emoji_url,
      :construction_worker_emoji_url,
      :crystal_ball_emoji_url,
      :butterfly_emoji_url,
      :lady_beetle_emoji_url,
      :note,
      :email_distribution_list,
      :daisyui_timeline_html,
      :org_mode,
      :task_list_as_markdown,
      :ways_of_working_as_markdown,
      :objectives_and_key_results_as_markdown,
      :key_performance_indicators_as_markdown,
      :glossary_as_url,
      :glossary_as_markdown,
      :six_pager_double_sider_as_url,
      :six_pager_double_sider_as_markdown,
      :swot_as_url,
      :swot_as_markdown,
      :porters_five_forces_as_url,
      :porters_five_forces_as_markdown,
      :pestle_as_url,
      :pestle_as_markdown,
      :roles_and_responsibilities_as_url,
      :roles_and_responsibilities_as_markdown,
      :responsibility_assignment_matrix_as_url,
      :responsibility_assignment_matrix_as_markdown,
      :code_of_conduct_url,
      :code_of_conduct_as_markdown,
      :license_url,
      :license_as_markdown,
      :sipoc_suppliers_as_url,
      :sipoc_suppliers_as_markdown,
      :sipoc_inputs_as_url,
      :sipoc_inputs_as_markdown,
      :sipoc_processes_as_url,
      :sipoc_processes_as_markdown,
      :sipoc_outputs_as_url,
      :sipoc_outputs_as_markdown,
      :sipoc_customers_as_url,
      :sipoc_customers_as_markdown,
      :arc42_as_url,
      :arc42_as_markdown,
      :arc42_01_introduction_and_goals_as_markdown,
      :arc42_02_constraints_as_markdown,
      :arc42_03_context_and_scope_as_markdown,
      :arc42_04_solution_strategy_as_markdown,
      :arc42_05_building_block_view_as_markdown,
      :arc42_06_runtime_view_as_markdown,
      :arc42_07_deployment_view_as_markdown,
      :arc42_08_crosscutting_concepts_as_markdown,
      :arc42_09_architectural_decisions_as_markdown,
      :arc42_10_quality_requirements_as_markdown,
      :arc42_11_risks_and_technical_debt_as_markdown,
      :arc42_12_glossary_as_markdown,
      :explain_stakeholders_as_markdown,
      :explain_history_as_markdown,
      :explain_authentication_as_markdown,
      :explain_authorization_as_markdown,
      :explain_use_cases_as_markdown,
      :explain_demographics_as_markdown,
      :explain_ui_as_markdown,
      :explain_api_as_markdown,
      :explain_data_as_markdown,
      :explain_mobile_as_markdown,
      :explain_legal_as_markdown,
      :explain_financial_as_markdown,
      :explain_service_level_agreement_as_markdown,
      :explain_disaster_recovery_as_markdown,
      :quality_availability_as_markdown,
      :quality_certifiability_as_markdown,
      :quality_compatibility_as_markdown,
      :quality_efficiency_as_markdown,
      :quality_governability_as_markdown,
      :quality_maintainability_as_markdown,
      :quality_observability_as_markdown,
      :quality_operability_as_markdown,
      :quality_recoverability_as_markdown,
      :quality_scalability_as_markdown,
      :quality_security_as_markdown,
      :quality_suitability_as_markdown,
      :quality_testability_as_markdown,
      :quality_transferability_as_markdown,
      :quality_translatability_as_markdown,
      :quality_warrantability_as_markdown,
      :apache_echart_as_url,
      :apache_echart_as_typescript,
      :customer_net_promoter_score_actual_value,
      :customer_net_promoter_score_target_value,
      :customer_net_promoter_score_unit,
      :customer_net_promoter_score_description_as_markdown,
      :user_net_promoter_score_actual_value,
      :user_net_promoter_score_target_value,
      :user_net_promoter_score_unit,
      :user_net_promoter_score_description_as_markdown,
      :worker_net_promoter_score_actual_value,
      :worker_net_promoter_score_target_value,
      :worker_net_promoter_score_unit,
      :worker_net_promoter_score_description_as_markdown,
      :active_users_actual_value,
      :active_users_target_value,
      :active_users_unit,
      :active_users_description,
      :uptime_percentage_actual_value,
      :uptime_percentage_target_value,
      :uptime_percentage_unit,
      :uptime_percentage_description,
      :burn_rate_net_cash_per_week_actual_value,
      :burn_rate_net_cash_per_week_target_value,
      :burn_rate_net_cash_per_week_unit,
      :burn_rate_net_cash_per_week_description,
      :burn_rate_hours_per_week_actual_value,
      :burn_rate_hours_per_week_target_value,
      :burn_rate_hours_per_week_unit,
      :burn_rate_hours_per_week_description,
      :earned_value_management_planned_value,
      :earned_value_management_earned_value,
      :earned_value_management_actual_cost,
      #:earned_value_management_cost_variance,
      #:earned_value_management_cost_variance_ratio,
      #:earned_value_management_cost_performance_index,
      #:earned_value_management_schedule_variance,
      #:earned_value_management_schedule_variance_ratio,
      #:earned_value_management_schedule_performance_index,
      :total_project_control_dipp,
      #:total_project_control_dipp_progress_index_ratio,
      :total_project_control_dipp_progress_index_numerator,
      :total_project_control_dipp_progress_index_denominator,
      :total_project_control_expected_monetary_value,
      :total_project_control_cost_estimate_to_complete,
      :deployment_frequency_actual_value,
      :deployment_frequency_target_value,
      #:deployment_frequency_ratio,
      :deployment_frequency_unit,
      :deployment_frequency_description,
      :lead_time_for_changes_actual_value,
      :lead_time_for_changes_target_value,
      #:lead_time_for_changes_ratio,
      :lead_time_for_changes_unit,
      :lead_time_for_changes_description,
      :change_failure_rate_actual_value,
      :change_failure_rate_target_value,
      #:change_failure_rate_ratio,
      :change_failure_rate_unit,
      :change_failure_rate_description,
      :mean_time_to_recovery_actual_value,
      :mean_time_to_recovery_target_value,
      #:mean_time_to_recovery_ratio,
      :mean_time_to_recovery_unit,
      :mean_time_to_recovery_description,
      :maintainability_index_actual_value,
      :maintainability_index_target_value,
      #:maintainability_index_ratio,
      :maintainability_index_unit,
      :maintainability_index_description,
      :line_count_actual_value,
      :line_count_target_value,
      #:line_count_ratio,
      :line_count_unit,
      :line_count_description,
      :test_automation_code_coverage_actual_value,
      :test_automation_code_coverage_target_value,
      #:test_automation_code_coverage_ratio,
      :test_automation_code_coverage_unit,
      :test_automation_code_coverage_description,
      :halstead_complexity_volume_actual_value,
      :halstead_complexity_volume_target_value,
      #:halstead_complexity_volume_ratio,
      :halstead_complexity_volume_unit,
      :halstead_complexity_volume_description,
      :halstead_complexity_difficulty_actual_value,
      :halstead_complexity_difficulty_target_value,
      #:halstead_complexity_difficulty_ratio,
      :halstead_complexity_difficulty_unit,
      :halstead_complexity_difficulty_description,
      :halstead_complexity_effort_actual_value,
      :halstead_complexity_effort_target_value,
      #:halstead_complexity_effort_ratio,
      :halstead_complexity_effort_unit,
      :halstead_complexity_effort_description
    ]
  end

end
