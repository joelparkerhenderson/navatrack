defmodule Navatrack.Repo.Migrations.CreateTableInitiatives do
  @moduledoc """
  Create table initiatives.
  """

  use Ecto.Migration

  def up do
    execute """
    CREATE TABLE initiatives (
      id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
      created_at TIMESTAMP(6) WITH TIME ZONE DEFAULT (now() AT TIME ZONE 'utc'),
      updated_at TIMESTAMP(6) WITH TIME ZONE DEFAULT (now() AT TIME ZONE 'utc'),
      deleted_at TIMESTAMP(6) WITH TIME ZONE,
      locale_code text,
      sign text,
      kind text,
      name text,
      status text,
      tags text[],
      url text,
      email text CONSTRAINT check_email CHECK (email ~*  '.@.'),
      phone text,
      messaging text,
      postal text,
      orcid_pid text,
      rdf_type text,
      linkedin_url text CONSTRAINT check_linkedin_url CHECK (linkedin_url ~* '^https://linkedin\.com/'),
      github_url text CONSTRAINT check_github_url CHECK (github_url ~* '^https://github\.com/'),
      codeberg_url text CONSTRAINT check_codeberg_url CHECK (codeberg_url ~* '^https://codeberg\.org/'),
      agents_as_url text CONSTRAINT check_agents_as_url CHECK (agents_as_url ~* '^https://'),
      agents_as_markdown text,
      avatar_image_400x400_url text CONSTRAINT check_avatar_image_400x400_url CHECK (avatar_image_400x400_url ~* '^https://'),
      avatar_image_400x400_alt text,
      main_image_1080x1080_url text CONSTRAINT check_main_image_1080x1080_url CHECK (main_image_1080x1080_url ~* '^https://'),
      main_image_1080x1080_alt text,
      main_image_1920x1080_url text CONSTRAINT check_main_image_1920x1080_url CHECK (main_image_1920x1080_url ~* '^https://'),
      main_image_1920x1080_alt text,
      main_image_1080x1920_url text CONSTRAINT check_main_image_1080x1920_url CHECK (main_image_1080x1920_url ~* '^https://'),
      main_image_1080x1920_alt text,
      home_emoji_url text CONSTRAINT check_home_emoji_url CHECK (home_emoji_url ~* '^https://'),
      bellhop_bell_emoji_url text CONSTRAINT check_bellhop_bell_emoji_url CHECK (bellhop_bell_emoji_url ~* '^https://'),
      target_emoji_url text CONSTRAINT check_target_emoji_url CHECK (target_emoji_url ~* '^https://'),
      gear_emoji_url text CONSTRAINT check_gear_emoji_url CHECK (gear_emoji_url ~* '^https://'),
      spiral_calendar_emoji_url text CONSTRAINT check_spiral_calendar_emoji_url CHECK (spiral_calendar_emoji_url ~* '^https://'),
      sparkles_emoji_url text CONSTRAINT check_sparkles_emoji_url CHECK (sparkles_emoji_url ~* '^https://'),
      speech_bubble_emoji_url text CONSTRAINT check_speech_bubble_emoji_url CHECK (speech_bubble_emoji_url ~* '^https://'),
      newspaper_emoji_url text CONSTRAINT check_newspaper_emoji_url CHECK (newspaper_emoji_url ~* '^https://'),
      bar_chart_emoji_url text CONSTRAINT check_bar_chart_emoji_url CHECK (bar_chart_emoji_url ~* '^https://'),
      movie_camera_emoji_url text CONSTRAINT check_movie_camera_emoji_url CHECK (movie_camera_emoji_url ~* '^https://'),
      construction_worker_emoji_url text CONSTRAINT check_construction_worker_emoji_url CHECK (construction_worker_emoji_url ~* '^https://'),
      crystal_ball_emoji_url text CONSTRAINT check_crystal_ball_emoji_url CHECK (crystal_ball_emoji_url ~* '^https://'),
      butterfly_emoji_url text CONSTRAINT check_butterfly_emoji_url CHECK (butterfly_emoji_url ~* '^https://'),
      lady_beetle_emoji_url text CONSTRAINT check_lady_beetle_emoji_url CHECK (lady_beetle_emoji_url ~* '^https://'),
      note text,
      email_distribution_list text,
      daisyui_timeline_html text,
      org_mode text,
      task_list_as_markdown text,
      ways_of_working_as_markdown text,
      objectives_and_key_results_as_markdown text,
      key_performance_indicators_as_markdown text,
      glossary_as_url text CONSTRAINT check_glossary_as_url CHECK (glossary_as_url ~* '^https://'),
      glossary_as_markdown text,
      six_pager_double_sider_as_url text CONSTRAINT check_six_pager_double_sider_as_url CHECK (six_pager_double_sider_as_url ~* '^https://'),
      six_pager_double_sider_as_markdown text,
      swot_as_url text CONSTRAINT check_swot_as_url CHECK (swot_as_url ~* '^https://'),
      swot_as_markdown text,
      porters_five_forces_as_url text CONSTRAINT check_porters_five_forces_as_url CHECK (porters_five_forces_as_url ~* '^https://'),
      porters_five_forces_as_markdown text,
      pestle_as_url text CONSTRAINT check_pestle_as_url CHECK (pestle_as_url ~* '^https://'),
      pestle_as_markdown text,
      roles_and_responsibilities_as_url text CONSTRAINT check_roles_and_responsibilities_as_url CHECK (roles_and_responsibilities_as_url ~* '^https://'),
      roles_and_responsibilities_as_markdown text,
      responsibility_assignment_matrix_as_url text CONSTRAINT check_responsibility_assignment_matrix_as_url CHECK (responsibility_assignment_matrix_as_url ~* '^https://'),
      responsibility_assignment_matrix_as_markdown text,
      code_of_conduct_url text CONSTRAINT check_code_of_conduct_url CHECK (code_of_conduct_url ~* '^https://'),
      code_of_conduct_as_markdown text,
      license_url text CONSTRAINT check_license_url CHECK (license_url ~* '^https://'),
      license_as_markdown text,
      --- arc42
      arc42_as_url text CONSTRAINT check_arc42_as_url CHECK (arc42_as_url ~* '^https://'),
      arc42_as_markdown text,
      arc42_01_introduction_and_goals_as_markdown text,
      arc42_02_constraints_as_markdown text,
      arc42_03_context_and_scope_as_markdown text,
      arc42_04_solution_strategy_as_markdown text,
      arc42_05_building_block_view_as_markdown text,
      arc42_06_runtime_view_as_markdown text,
      arc42_07_deployment_view_as_markdown text,
      arc42_08_crosscutting_concepts_as_markdown text,
      arc42_09_architectural_decisions_as_markdown text,
      arc42_10_quality_requirements_as_markdown text,
      arc42_11_risks_and_technical_debt_as_markdown text,
      arc42_12_glossary_as_markdown text,
      --- explain
      explain_stakeholders_as_markdown text,
      explain_history_as_markdown text,
      explain_authentication_as_markdown text,
      explain_authorization_as_markdown text,
      explain_use_cases_as_markdown text,
      explain_demographics_as_markdown text,
      explain_ui_as_markdown text,
      explain_api_as_markdown text,
      explain_data_as_markdown text,
      explain_mobile_as_markdown text,
      explain_legal_as_markdown text,
      explain_financial_as_markdown text,
      explain_service_level_agreement_as_markdown text,
      explain_disaster_recovery_as_markdown text,
      --- quality
      quality_availability_as_markdown text,
      quality_certifiability_as_markdown text,
      quality_compatibility_as_markdown text,
      quality_efficiency_as_markdown text,
      quality_governability_as_markdown text,
      quality_maintainability_as_markdown text,
      quality_observability_as_markdown text,
      quality_operability_as_markdown text,
      quality_recoverability_as_markdown text,
      quality_scalability_as_markdown text,
      quality_security_as_markdown text,
      quality_suitability_as_markdown text,
      quality_testability_as_markdown text,
      quality_transferability_as_markdown text,
      quality_translatability_as_markdown text,
      quality_warrantability_as_markdown text,
      -- apache_echart
      apache_echart_as_url text CONSTRAINT check_apache_echart_as_url CHECK (apache_echart_as_url ~* '^https://'),
      apache_echart_as_typescript text,
      --- customer_net_promoter
      customer_net_promoter_score_actual_value DECIMAL,
      customer_net_promoter_score_target_value DECIMAL,
      customer_net_promoter_score_unit text,
      customer_net_promoter_score_description_as_markdown text,
      --- user_net_promoter
      user_net_promoter_score_actual_value DECIMAL,
      user_net_promoter_score_target_value DECIMAL,
      user_net_promoter_score_unit text,
      user_net_promoter_score_description_as_markdown text,
      --- worker_net_promoter
      worker_net_promoter_score_actual_value DECIMAL,
      worker_net_promoter_score_target_value DECIMAL,
      worker_net_promoter_score_unit text,
      worker_net_promoter_score_description_as_markdown text,
      --- active_users
      active_users_actual_value integer,
      active_users_target_value integer,
      active_users_unit text,
      active_users_description text,
      --- uptime_percentage
      uptime_percentage_actual_value decimal(7,5),
      uptime_percentage_target_value decimal(7,5),
      uptime_percentage_unit text,
      uptime_percentage_description text,
      --- burn_rate
      burn_rate_net_cash_per_week_actual_value integer,
      burn_rate_net_cash_per_week_target_value integer,
      burn_rate_net_cash_per_week_unit text,
      burn_rate_net_cash_per_week_description text,
      burn_rate_hours_per_week_actual_value integer,
      burn_rate_hours_per_week_target_value integer,
      burn_rate_hours_per_week_unit text,
      burn_rate_hours_per_week_description text,
      --- earned_value_management
      earned_value_management_planned_value decimal,
      earned_value_management_earned_value decimal,
      earned_value_management_actual_cost decimal,
      earned_value_management_cost_variance DECIMAL GENERATED ALWAYS AS (earned_value_management_earned_value - earned_value_management_actual_cost) STORED,
      earned_value_management_cost_variance_ratio DECIMAL GENERATED ALWAYS AS ((earned_value_management_earned_value - earned_value_management_actual_cost) / earned_value_management_earned_value) STORED,
      earned_value_management_cost_performance_index DECIMAL GENERATED ALWAYS AS (earned_value_management_earned_value / earned_value_management_actual_cost) STORED,
      earned_value_management_schedule_variance DECIMAL GENERATED ALWAYS AS (earned_value_management_earned_value - earned_value_management_planned_value) STORED,
      earned_value_management_schedule_variance_ratio DECIMAL GENERATED ALWAYS AS ((earned_value_management_earned_value - earned_value_management_planned_value) / earned_value_management_planned_value) STORED,
      earned_value_management_schedule_performance_index DECIMAL GENERATED ALWAYS AS (earned_value_management_earned_value / earned_value_management_planned_value) STORED,
      --- total_project_control
      total_project_control_dipp decimal,
      total_project_control_dipp_progress_index_ratio DECIMAL GENERATED ALWAYS AS (total_project_control_dipp_progress_index_numerator / total_project_control_dipp_progress_index_denominator) STORED,
      total_project_control_dipp_progress_index_numerator decimal,
      total_project_control_dipp_progress_index_denominator decimal,
      total_project_control_expected_monetary_value decimal,
      total_project_control_cost_estimate_to_complete decimal,
      --- deployment_frequency
      deployment_frequency_actual_value DECIMAL,
      deployment_frequency_target_value DECIMAL,
      deployment_frequency_ratio DECIMAL GENERATED ALWAYS AS (deployment_frequency_actual_value / deployment_frequency_target_value) STORED,
      deployment_frequency_unit text,
      deployment_frequency_description text,
      --- lead_time_for_changes
      lead_time_for_changes_actual_value DECIMAL,
      lead_time_for_changes_target_value DECIMAL,
      lead_time_for_changes_ratio DECIMAL GENERATED ALWAYS AS (lead_time_for_changes_actual_value / lead_time_for_changes_target_value) STORED,
      lead_time_for_changes_unit text,
      lead_time_for_changes_description text,
      --- change_failure_rate
      change_failure_rate_actual_value DECIMAL,
      change_failure_rate_target_value DECIMAL,
      change_failure_rate_ratio DECIMAL GENERATED ALWAYS AS (change_failure_rate_actual_value / change_failure_rate_target_value) STORED,
      change_failure_rate_unit text,
      change_failure_rate_description text,
      --- mean_time_to_recovery
      mean_time_to_recovery_actual_value DECIMAL,
      mean_time_to_recovery_target_value DECIMAL,
      mean_time_to_recovery_ratio DECIMAL GENERATED ALWAYS AS (mean_time_to_recovery_actual_value / mean_time_to_recovery_target_value) STORED,
      mean_time_to_recovery_unit text,
      mean_time_to_recovery_description text,
      --- maintainability_index
      maintainability_index_actual_value DECIMAL,
      maintainability_index_target_value DECIMAL,
      maintainability_index_unit text,
      maintainability_index_description text,
      --- line_count
      line_count_actual_value integer,
      line_count_target_value integer,
      line_count_unit text,
      line_count_description text,
      --- test_automation_code_coverage
      test_automation_code_coverage_actual_value DECIMAL,
      test_automation_code_coverage_target_value DECIMAL,
      test_automation_code_coverage_unit text,
      test_automation_code_coverage_description text,
      --- halstead_complexity_volume
      halstead_complexity_volume_actual_value DECIMAL,
      halstead_complexity_volume_target_value DECIMAL,
      halstead_complexity_volume_ratio DECIMAL GENERATED ALWAYS AS (halstead_complexity_volume_actual_value / halstead_complexity_volume_target_value) STORED,
      halstead_complexity_volume_unit text,
      halstead_complexity_volume_description text,
      --- halstead_complexity_difficulty
      halstead_complexity_difficulty_actual_value DECIMAL,
      halstead_complexity_difficulty_target_value DECIMAL,
      halstead_complexity_difficulty_ratio DECIMAL GENERATED ALWAYS AS (halstead_complexity_difficulty_actual_value / halstead_complexity_difficulty_target_value) STORED,
      halstead_complexity_difficulty_unit text,
      halstead_complexity_difficulty_description text,
      --- halstead_complexity_effort
      halstead_complexity_effort_actual_value DECIMAL,
      halstead_complexity_effort_target_value DECIMAL,
      halstead_complexity_effort_ratio DECIMAL GENERATED ALWAYS AS (halstead_complexity_effort_actual_value / halstead_complexity_effort_target_value) STORED,
      halstead_complexity_effort_unit text,
      halstead_complexity_effort_description text
    );
    """
    execute """
    CREATE TRIGGER trigger_initiatives_updated_at
      BEFORE UPDATE ON initiatives
      FOR EACH ROW
      EXECUTE FUNCTION trigger_updated_at();
    """
    execute """
    CREATE INDEX initiatives_created_at_index ON initiatives (created_at);
    """
    execute """
    CREATE INDEX initiatives_updated_at_index ON initiatives (updated_at);
    """
    execute """
    CREATE INDEX initiatives_deleted_at_index ON initiatives (deleted_at);
    """
    execute """
    CREATE INDEX initiatives_locale_code_index ON initiatives (locale_code);
    """
    execute """
    CREATE INDEX initiatives_sign_index ON initiatives (sign);
    """
    execute """
    CREATE INDEX initiatives_sign_index_tpo ON initiatives (sign text_pattern_ops);
    """
    execute """
    CREATE INDEX initiatives_kind_index ON initiatives (kind);
    """
    execute """
    CREATE INDEX initiatives_kind_index_tpo ON initiatives (kind text_pattern_ops);
    """
    execute """
    CREATE INDEX initiatives_tags_index ON initiatives (tags);
    """
  end

  def down do
    execute """
    DROP TRIGGER IF EXISTS trigger_initiatives_updated_at;
    """
    execute """
    DROP INDEX IF EXISTS initiatives_locale_code_index;
    """
    execute """
    DROP INDEX IF EXISTS initiatives_created_at_index;
    """
    execute """
    DROP INDEX IF EXISTS initiatives_updated_at_index;
    """
    execute """
    DROP INDEX IF EXISTS initiatives_deleted_at_index;
    """
    execute """
    DROP INDEX IF EXISTS initiatives_sign_index;
    """
    execute """
    DROP INDEX IF EXISTS initiatives_sign_index_tpo;
    """
    execute """
    DROP INDEX IF EXISTS initiatives_kind_index;
    """
    execute """
    DROP INDEX IF EXISTS initiatives_kind_index_tpo;
    """
    execute """
    DROP INDEX IF EXISTS initiatives_tags_index;
    """
    execute """
    DROP TABLE IF EXISTS initiatives;
    """
  end

end
