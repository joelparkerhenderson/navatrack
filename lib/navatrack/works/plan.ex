defmodule Navatrack.Works.Plan do
  use Ash.Resource,
    otp_app: :navatrack,
    domain: Navatrack.Works,
    data_layer: AshPostgres.DataLayer

  def singular_snake_case(), do: "plan"
  def plural_snake_case(), do: "plans"
  def singular_title_case(), do: "Plan"
  def plural_title_case(), do: "Plans"

  postgres do
    table "plans"
    repo Navatrack.Repo
  end

  actions do
    defaults [:create, :read, :update, :destroy]

    default_accept [
      :created_at,
      :updated_at,
      :deleted_at,
      :locale_code,
      :name,
      :sign,
      :status,
      :tagging,
      :note,
      ### contact
      :web,
      :email,
      :phone,
      :chat,
      :calendar,
      :postal,
      :rdf_type,
      ### social
      :bluesky_as_url,
      :codeberg_as_url,
      :facebook_as_url,
      :github_as_url,
      :instagram_as_url,
      :linkedin_as_url,
      :orcid_as_url,
      :tiktok_as_url,
      :wikipedia_as_url,
      :youtube_as_url,
      ### location
      :location_iso_3166_1_alpha_2,
      :location_iso_3166_2,
      :location_postal_code,
      :location_latitude_as_decimal_degrees,
      :location_longitude_as_decimal_degrees,
      ### images
      :avatar_image_400x400_url,
      :avatar_image_400x400_alt,
      :main_image_1080x1080_url,
      :main_image_1080x1080_alt,
      :main_image_1920x1080_url,
      :main_image_1920x1080_alt,
      :main_image_1080x1920_url,
      :main_image_1080x1920_alt,
      ### ideals
      :purpose_statement,
      :vision_statement,
      :mission_statement,
      :values_statement,
      ## ai
      :ai_agent_instructions_as_url,
      :ai_agent_instructions_as_markdown,
      ### emoji
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
      ### workable
      :email_distribution_list,
      :daisyui_timeline_html,
      :org_mode,
      :task_list_as_markdown,
      :ways_of_working_as_markdown,
      :objectives_and_key_results_as_markdown,
      :key_performance_indicators_as_markdown,
      :glossary_as_url,
      :glossary_as_markdown,
      :roles_and_responsibilities_as_url,
      :roles_and_responsibilities_as_markdown,
      :responsibility_assignment_matrix_as_url,
      :responsibility_assignment_matrix_as_markdown,
      ### business analysis
      :gs1_digital_link,
      :gs1_country_code,
      :gs1_global_location_number,
      :isic_v4_code,
      :isic_v4_name,
      :six_pager_double_sider_as_url,
      :six_pager_double_sider_as_markdown,
      ### swot
      :swot_as_url,
      :swot_strengths_as_markdown,
      :swot_weaknesses_as_markdown,
      :swot_opportunities_as_markdown,
      :swot_threats_as_markdown,
      ### sipoc
      :sipoc_as_url,
      :sipoc_suppliers_as_markdown,
      :sipoc_inputs_as_markdown,
      :sipoc_processes_as_markdown,
      :sipoc_outputs_as_markdown,
      :sipoc_customers_as_markdown,
      ### steeple
      :steeple_as_url,
      :steeple_social_as_markdown,
      :steeple_technological_as_markdown,
      :steeple_economic_as_markdown,
      :steeple_environmental_as_markdown,
      :steeple_political_as_markdown,
      :steeple_legal_as_markdown,
      :steeple_ethical_as_markdown,
      ### porters five forces
      :porters_five_forces_as_url,
      :porters_five_forces_entrants_as_markdown,
      :porters_five_forces_substitutes_as_markdown,
      :porters_five_forces_customers_as_markdown,
      :porters_five_forces_suppliers_as_markdown,
      :porters_five_forces_competitors_as_markdown,
      ### policy
      :code_of_conduct_policy_as_url,
      :code_of_conduct_policy_as_markdown,
      :coordinated_disclosure_policy_as_url,
      :coordinated_disclosure_policy_as_markdown,
      :copyright_policy_as_url,
      :copyright_policy_as_markdown,
      :corrections_policy_as_url,
      :corrections_policy_as_markdown,
      :diversity_policy_as_url,
      :diversity_policy_as_markdown,
      :equal_opportunity_policy_as_url,
      :equal_opportunity_policy_as_markdown,
      :ethics_policy_as_url,
      :ethics_policy_as_markdown,
      :legal_policy_as_url,
      :legal_policy_as_markdown,
      :license_policy_as_url,
      :license_policy_as_markdown,
      :open_source_policy_as_url,
      :open_source_policy_as_markdown,
      :privacy_policy_as_url,
      :privacy_policy_as_markdown,
      :safety_policy_as_url,
      :safety_policy_as_markdown,
      :security_policy_as_url,
      :security_policy_as_markdown,
      :socials_policy_as_url,
      :socials_policy_as_markdown,
      :staff_policy_as_url,
      :staff_policy_as_markdown,
      ### arc42
      :arc42_as_url,
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
      ### explain
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
      ### quality
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
      ### apache echart
      :apache_echart_as_url,
      :apache_echart_as_typescript,
      ### net promoter score
      :net_promoter_score_customer_perspective_actual,
      :net_promoter_score_customer_perspective_expect,
      #:net_promoter_score_customer_perspective_ratio,
      :net_promoter_score_customer_perspective_unit,
      :net_promoter_score_customer_perspective_description_as_markdown,
      :net_promoter_score_user_perspective_actual,
      :net_promoter_score_user_perspective_expect,
      #:net_promoter_score_user_perspective_ratio,
      :net_promoter_score_user_perspective_unit,
      :net_promoter_score_user_perspective_description_as_markdown,
      :net_promoter_score_worker_perspective_actual,
      :net_promoter_score_worker_perspective_expect,
      #:net_promoter_score_worker_perspective_ratio,
      :net_promoter_score_worker_perspective_unit,
      :net_promoter_score_worker_perspective_description_as_markdown,
      ### active users
      :active_users_actual,
      :active_users_expect,
      #:active_users_ratio,
      :active_users_unit,
      :active_users_description,
      ### uptime percentage
      :uptime_percentage_actual,
      :uptime_percentage_expect,
      #:uptime_percentage_ratio,
      :uptime_percentage_unit,
      :uptime_percentage_description,
      ### burn rate
      :burn_rate_net_cash_per_week_actual,
      :burn_rate_net_cash_per_week_expect,
      #:burn_rate_net_cash_per_week_ratio,
      :burn_rate_net_cash_per_week_unit,
      :burn_rate_net_cash_per_week_description,
      :burn_rate_net_hours_per_week_actual,
      :burn_rate_net_hours_per_week_expect,
      #:burn_rate_net_hours_per_week_ratio,
      :burn_rate_net_hours_per_week_unit,
      :burn_rate_net_hours_per_week_description,
      ### earned value management
      :earned_value_management_planned_value,
      :earned_value_management_earned_value,
      :earned_value_management_actual_cost,
      # :earned_value_management_cost_variance,
      # :earned_value_management_cost_variance_ratio,
      # :earned_value_management_cost_performance_index,
      # :earned_value_management_schedule_variance,
      # :earned_value_management_schedule_variance_ratio,
      # :earned_value_management_schedule_performance_index,
      ### total project control
      :total_project_control_dipp,
      # :total_project_control_dipp_progress_index_ratio,
      :total_project_control_dipp_progress_index_numerator,
      :total_project_control_dipp_progress_index_denominator,
      :total_project_control_expected_monetary_value,
      :total_project_control_cost_estimate_to_complete,
      :deployment_frequency_actual,
      :deployment_frequency_expect,
      # :deployment_frequency_ratio,
      :deployment_frequency_unit,
      :deployment_frequency_description,
      :lead_time_for_changes_actual,
      :lead_time_for_changes_expect,
      # :lead_time_for_changes_ratio,
      :lead_time_for_changes_unit,
      :lead_time_for_changes_description,
      :change_failure_rate_actual,
      :change_failure_rate_expect,
      # :change_failure_rate_ratio,
      :change_failure_rate_unit,
      :change_failure_rate_description,
      :mean_time_to_recovery_actual,
      :mean_time_to_recovery_expect,
      # :mean_time_to_recovery_ratio,
      :mean_time_to_recovery_unit,
      :mean_time_to_recovery_description,
      :maintainability_index_actual,
      :maintainability_index_expect,
      # :maintainability_index_ratio,
      :maintainability_index_unit,
      :maintainability_index_description,
      :line_count_actual,
      :line_count_expect,
      # :line_count_ratio,
      :line_count_unit,
      :line_count_description,
      :test_automation_code_coverage_actual,
      :test_automation_code_coverage_expect,
      # :test_automation_code_coverage_ratio,
      :test_automation_code_coverage_unit,
      :test_automation_code_coverage_description,
      :halstead_complexity_volume_actual,
      :halstead_complexity_volume_expect,
      # :halstead_complexity_volume_ratio,
      :halstead_complexity_volume_unit,
      :halstead_complexity_volume_description,
      :halstead_complexity_difficulty_actual,
      :halstead_complexity_difficulty_expect,
      # :halstead_complexity_difficulty_ratio,
      :halstead_complexity_difficulty_unit,
      :halstead_complexity_difficulty_description,
      :halstead_complexity_effort_actual,
      :halstead_complexity_effort_expect,
      # :halstead_complexity_effort_ratio,
      :halstead_complexity_effort_unit,
      :halstead_complexity_effort_description
    ]
  end

  attributes do
    ### meta
    uuid_primary_key :id
    attribute :created_at, :utc_datetime_usec
    attribute :updated_at, :utc_datetime_usec
    attribute :deleted_at, :utc_datetime_usec
    attribute :locale_code, :string
    ### head
    attribute :name, :string, public?: true
    attribute :sign, :string
    attribute :status, :string
    attribute :tagging, :string
    attribute :note, :string
    ### contact
    attribute :web, :string
    attribute :email, :string
    attribute :phone, :string
    attribute :chat, :string
    attribute :calendar, :string
    attribute :postal, :string
    attribute :rdf_type, :string
    ### socials
    attribute :bluesky_as_url, :string
    attribute :codeberg_as_url, :string
    attribute :facebook_as_url, :string
    attribute :github_as_url, :string
    attribute :instagram_as_url, :string
    attribute :linkedin_as_url, :string
    attribute :orcid_as_url, :string
    attribute :tiktok_as_url, :string
    attribute :wikipedia_as_url, :string
    attribute :youtube_as_url, :string
    ### location
    attribute :location_iso_3166_1_alpha_2, :string
    attribute :location_iso_3166_2, :string
    attribute :location_postal_code, :string
    attribute :location_latitude_as_decimal_degrees, :decimal
    attribute :location_longitude_as_decimal_degrees, :decimal
    ### images
    attribute :avatar_image_400x400_url, :string
    attribute :avatar_image_400x400_alt, :string
    attribute :main_image_1080x1080_url, :string
    attribute :main_image_1080x1080_alt, :string
    attribute :main_image_1920x1080_url, :string
    attribute :main_image_1920x1080_alt, :string
    attribute :main_image_1080x1920_url, :string
    attribute :main_image_1080x1920_alt, :string
    ### ideals
    attribute :purpose_statement, :string
    attribute :vision_statement, :string
    attribute :mission_statement, :string
    attribute :values_statement, :string
    ## ai
    attribute :ai_agent_instructions_as_url, :string
    attribute :ai_agent_instructions_as_markdown, :string
    ### emoji
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
    ### workable
    attribute :email_distribution_list, :string
    attribute :daisyui_timeline_html, :string
    attribute :org_mode, :string
    attribute :task_list_as_markdown, :string
    attribute :ways_of_working_as_markdown, :string
    attribute :objectives_and_key_results_as_markdown, :string
    attribute :key_performance_indicators_as_markdown, :string
    attribute :glossary_as_url, :string
    attribute :glossary_as_markdown, :string
    attribute :roles_and_responsibilities_as_url, :string
    attribute :roles_and_responsibilities_as_markdown, :string
    attribute :responsibility_assignment_matrix_as_url, :string
    attribute :responsibility_assignment_matrix_as_markdown, :string
    ### business analysis
    attribute :gs1_digital_link, :string
    attribute :gs1_country_code, :string
    attribute :gs1_global_location_number, :string
    attribute :isic_v4_code, :string
    attribute :isic_v4_name, :string
    attribute :six_pager_double_sider_as_url, :string
    attribute :six_pager_double_sider_as_markdown, :string
    ### swot
    attribute :swot_as_url, :string
    attribute :swot_strengths_as_markdown, :string
    attribute :swot_weaknesses_as_markdown, :string
    attribute :swot_opportunities_as_markdown, :string
    attribute :swot_threats_as_markdown, :string
    ### sipoc
    attribute :sipoc_as_url, :string
    attribute :sipoc_suppliers_as_markdown, :string
    attribute :sipoc_inputs_as_markdown, :string
    attribute :sipoc_processes_as_markdown, :string
    attribute :sipoc_outputs_as_markdown, :string
    attribute :sipoc_customers_as_markdown, :string
    ### steeple
    attribute :steeple_as_url, :string
    attribute :steeple_social_as_markdown, :string
    attribute :steeple_technological_as_markdown, :string
    attribute :steeple_economic_as_markdown, :string
    attribute :steeple_environmental_as_markdown, :string
    attribute :steeple_political_as_markdown, :string
    attribute :steeple_legal_as_markdown, :string
    attribute :steeple_ethical_as_markdown, :string
    ### porters five forces
    attribute :porters_five_forces_as_url, :string
    attribute :porters_five_forces_entrants_as_markdown, :string
    attribute :porters_five_forces_substitutes_as_markdown, :string
    attribute :porters_five_forces_customers_as_markdown, :string
    attribute :porters_five_forces_suppliers_as_markdown, :string
    attribute :porters_five_forces_competitors_as_markdown, :string
    ### policy
    attribute :code_of_conduct_policy_as_url, :string
    attribute :code_of_conduct_policy_as_markdown, :string
    attribute :coordinated_disclosure_policy_as_url, :string
    attribute :coordinated_disclosure_policy_as_markdown, :string
    attribute :copyright_policy_as_url, :string
    attribute :copyright_policy_as_markdown, :string
    attribute :corrections_policy_as_url, :string
    attribute :corrections_policy_as_markdown, :string
    attribute :diversity_policy_as_url, :string
    attribute :diversity_policy_as_markdown, :string
    attribute :equal_opportunity_policy_as_url, :string
    attribute :equal_opportunity_policy_as_markdown, :string
    attribute :ethics_policy_as_url, :string
    attribute :ethics_policy_as_markdown, :string
    attribute :legal_policy_as_url, :string
    attribute :legal_policy_as_markdown, :string
    attribute :license_policy_as_url, :string
    attribute :license_policy_as_markdown, :string
    attribute :open_source_policy_as_url, :string
    attribute :open_source_policy_as_markdown, :string
    attribute :privacy_policy_as_url, :string
    attribute :privacy_policy_as_markdown, :string
    attribute :safety_policy_as_url, :string
    attribute :safety_policy_as_markdown, :string
    attribute :security_policy_as_url, :string
    attribute :security_policy_as_markdown, :string
    attribute :socials_policy_as_url, :string
    attribute :socials_policy_as_markdown, :string
    attribute :staff_policy_as_url, :string
    attribute :staff_policy_as_markdown, :string
    ### arc42
    attribute :arc42_as_url, :string
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
    ### explain
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
    ### quality
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
    ### apache echart
    attribute :apache_echart_as_url, :string
    attribute :apache_echart_as_typescript, :string
    ### net promoter score
    attribute :net_promoter_score_customer_perspective_actual, :decimal
    attribute :net_promoter_score_customer_perspective_expect, :decimal
    attribute :net_promoter_score_customer_perspective_unit, :string
    attribute :net_promoter_score_customer_perspective_description_as_markdown, :string
    attribute :net_promoter_score_user_perspective_actual, :decimal
    attribute :net_promoter_score_user_perspective_expect, :decimal
    attribute :net_promoter_score_user_perspective_unit, :string
    attribute :net_promoter_score_user_perspective_description_as_markdown, :string
    attribute :net_promoter_score_worker_perspective_actual, :decimal
    attribute :net_promoter_score_worker_perspective_expect, :decimal
    attribute :net_promoter_score_worker_perspective_unit, :string
    attribute :net_promoter_score_worker_perspective_description_as_markdown, :string
    ### user metrics
    attribute :active_users_actual, :decimal
    attribute :active_users_expect, :decimal
    attribute :active_users_unit, :string
    attribute :active_users_description, :string
    attribute :uptime_percentage_actual, :decimal
    attribute :uptime_percentage_expect, :decimal
    attribute :uptime_percentage_unit, :string
    attribute :uptime_percentage_description, :string
    ### burn rate
    attribute :burn_rate_net_cash_per_week_actual, :decimal
    attribute :burn_rate_net_cash_per_week_expect, :decimal
    attribute :burn_rate_net_cash_per_week_unit, :string
    attribute :burn_rate_net_cash_per_week_description, :string
    attribute :burn_rate_net_hours_per_week_actual, :decimal
    attribute :burn_rate_net_hours_per_week_expect, :decimal
    attribute :burn_rate_net_hours_per_week_unit, :string
    attribute :burn_rate_net_hours_per_week_description, :string
    ### earned value management
    attribute :earned_value_management_planned_value, :decimal
    attribute :earned_value_management_earned_value, :decimal
    attribute :earned_value_management_actual_cost, :decimal
    attribute :earned_value_management_cost_variance, :decimal
    attribute :earned_value_management_cost_variance_ratio, :decimal
    attribute :earned_value_management_cost_performance_index, :decimal
    attribute :earned_value_management_schedule_variance, :decimal
    attribute :earned_value_management_schedule_variance_ratio, :decimal
    attribute :earned_value_management_schedule_performance_index, :decimal
    ### total_project_control
    attribute :total_project_control_dipp, :decimal
    attribute :total_project_control_dipp_progress_index_ratio, :decimal
    attribute :total_project_control_dipp_progress_index_numerator, :decimal
    attribute :total_project_control_dipp_progress_index_denominator, :decimal
    attribute :total_project_control_expected_monetary_value, :decimal
    attribute :total_project_control_cost_estimate_to_complete, :decimal
    ### deployment_frequency
    attribute :deployment_frequency_actual, :decimal
    attribute :deployment_frequency_expect, :decimal
    attribute :deployment_frequency_ratio, :decimal
    attribute :deployment_frequency_unit, :string
    attribute :deployment_frequency_description, :string
    ### lead_time_for_changes
    attribute :lead_time_for_changes_actual, :decimal
    attribute :lead_time_for_changes_expect, :decimal
    attribute :lead_time_for_changes_ratio, :decimal
    attribute :lead_time_for_changes_unit, :string
    attribute :lead_time_for_changes_description, :string
    ### change_failure_rate
    attribute :change_failure_rate_actual, :decimal
    attribute :change_failure_rate_expect, :decimal
    attribute :change_failure_rate_ratio, :decimal
    attribute :change_failure_rate_unit, :string
    attribute :change_failure_rate_description, :string
    ### mean_time_to_recovery
    attribute :mean_time_to_recovery_actual, :decimal
    attribute :mean_time_to_recovery_expect, :decimal
    attribute :mean_time_to_recovery_ratio, :decimal
    attribute :mean_time_to_recovery_unit, :string
    attribute :mean_time_to_recovery_description, :string
    ### maintainability_index
    attribute :maintainability_index_actual, :decimal
    attribute :maintainability_index_expect, :decimal
    attribute :maintainability_index_ratio, :decimal
    attribute :maintainability_index_unit, :string
    attribute :maintainability_index_description, :string
    ### line_count
    attribute :line_count_actual, :decimal
    attribute :line_count_expect, :decimal
    attribute :line_count_ratio, :decimal
    attribute :line_count_unit, :string
    attribute :line_count_description, :string
    ### test_automation_code_coverage
    attribute :test_automation_code_coverage_actual, :decimal
    attribute :test_automation_code_coverage_expect, :decimal
    attribute :test_automation_code_coverage_ratio, :decimal
    attribute :test_automation_code_coverage_unit, :string
    attribute :test_automation_code_coverage_description, :string
    ### halstead_complexity
    attribute :halstead_complexity_volume_actual, :decimal
    attribute :halstead_complexity_volume_expect, :decimal
    attribute :halstead_complexity_volume_ratio, :decimal
    attribute :halstead_complexity_volume_unit, :string
    attribute :halstead_complexity_volume_description, :string
    attribute :halstead_complexity_difficulty_actual, :decimal
    attribute :halstead_complexity_difficulty_expect, :decimal
    attribute :halstead_complexity_difficulty_ratio, :decimal
    attribute :halstead_complexity_difficulty_unit, :string
    attribute :halstead_complexity_difficulty_description, :string
    attribute :halstead_complexity_effort_actual, :decimal
    attribute :halstead_complexity_effort_expect, :decimal
    attribute :halstead_complexity_effort_ratio, :decimal
    attribute :halstead_complexity_effort_unit, :string
    attribute :halstead_complexity_effort_description, :string
  end

  relationships do
    many_to_many :users, Navatrack.Accounts.User do
      through Navatrack.Accounts.UserPlanLink
      source_attribute_on_join_resource :plan_id
      destination_attribute_on_join_resource :user_id
    end
  end

end
