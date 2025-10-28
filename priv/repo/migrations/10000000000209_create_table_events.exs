defmodule Navatrack.Repo.Migrations.CreateTableEvents do
  @moduledoc """
  Create table events.
  """

  use Ecto.Migration

  def up do
    execute """
    CREATE TABLE events (
      --- meta
      id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
      created_at TIMESTAMP(6) WITH TIME ZONE DEFAULT (now() AT TIME ZONE 'utc'),
      updated_at TIMESTAMP(6) WITH TIME ZONE DEFAULT (now() AT TIME ZONE 'utc'),
      deleted_at TIMESTAMP(6) WITH TIME ZONE,
      locale_code text,
      parent_id uuid CONSTRAINT events_parent_id_fk REFERENCES events (id),
      parent_order int CONSTRAINT events_parent_order_check CHECK (parent_order >= 0),
      --- card
      name text,
      sign text CONSTRAINT events_sign_check CHECK (LENGTH(sign) = 1),
      status text,
      tagging text,
      note text,
      --- contact
      web text CONSTRAINT events_web_check CHECK (web ~* '^https://'),
      email text CONSTRAINT events_email_check CHECK (email ~*  '.@.'),
      phone text,
      chat text,
      calendar text,
      postal text,
      rdf_type text,
      --- social
      bluesky_as_url text CONSTRAINT events_bluesky_as_url_check CHECK (bluesky_as_url ~* '^https://bsky\.app/'),
      codeberg_as_url text CONSTRAINT events_codeberg_as_url_check CHECK (codeberg_as_url ~* '^https://codeberg\.org/'),
      facebook_as_url text CONSTRAINT events_facebook_as_url_check CHECK (facebook_as_url ~* '^https://facebook\.com/'),
      github_as_url text CONSTRAINT events_github_as_url_check CHECK (github_as_url ~* '^https://github\.com/'),
      instagram_as_url text CONSTRAINT events_instagram_as_url_check CHECK (instagram_as_url ~* '^https://instagram\.com/'),
      linkedin_as_url text CONSTRAINT events_linkedin_as_url_check CHECK (linkedin_as_url ~* '^https://linkedin\.com/'),
      mastodon_as_url text CONSTRAINT events_mastodon_as_url_check CHECK (mastodon_as_url ~* '^https://'),
      orcid_as_url text CONSTRAINT events_orcid_as_url_check CHECK (orcid_as_url ~* '^https://orcid\.org/'),
      tiktok_as_url text CONSTRAINT events_tiktok_as_url_check CHECK (tiktok_as_url ~* '^https://tiktok\.com/'),
      wikipedia_as_url text CONSTRAINT events_wikipedia_uri_check CHECK (wikipedia_as_url ~* '^https://wikipedia\.org/'),
      youtube_as_url text CONSTRAINT events_youtube_as_url_check CHECK (youtube_as_url ~* '^https://youtube\.com/'),
      --- location
      location_iso_3166_1_alpha_2 char(2) CONSTRAINT events_location_iso_3166_1_alpha_2_check CHECK (location_iso_3166_1_alpha_2 ~* '^[a-z][a-z]$'),
      location_iso_3166_2 text,
      location_postal_code text,
      location_latitude_as_decimal_degrees numeric(9, 7) CONSTRAINT events_location_latitude_as_decimal_degrees_check CHECK (location_latitude_as_decimal_degrees BETWEEN -90.0 AND 90.0),
      location_longitude_as_decimal_degrees numeric(10, 7) CONSTRAINT events_location_longitude_as_decimal_degrees_check CHECK (location_longitude_as_decimal_degrees BETWEEN -180.0 AND 180.0),
      --- images
      avatar_image_400x400_url text CONSTRAINT events_avatar_image_400x400_url_check CHECK (avatar_image_400x400_url ~* '^https://'),
      avatar_image_400x400_alt text,
      main_image_1080x1080_url text CONSTRAINT events_main_image_1080x1080_url_check CHECK (main_image_1080x1080_url ~* '^https://'),
      main_image_1080x1080_alt text,
      main_image_1920x1080_url text CONSTRAINT events_main_image_1920x1080_url_check CHECK (main_image_1920x1080_url ~* '^https://'),
      main_image_1920x1080_alt text,
      main_image_1080x1920_url text CONSTRAINT events_main_image_1080x1920_url_check CHECK (main_image_1080x1920_url ~* '^https://'),
      main_image_1080x1920_alt text,
      --- statements
      purpose_statement text,
      vision_statement text,
      mission_statement text,
      values_statement text,
      -- ai
      ai_agent_instructions_as_url text CONSTRAINT events_ai_agent_instructions_as_url CHECK (ai_agent_instructions_as_url ~* '^https://'),
      ai_agent_instructions_as_markdown text,
      --- emoji
      home_emoji_url text CONSTRAINT events_home_emoji_url_check CHECK (home_emoji_url ~* '^https://'),
      bellhop_bell_emoji_url text CONSTRAINT events_bellhop_bell_emoji_url_check CHECK (bellhop_bell_emoji_url ~* '^https://'),
      target_emoji_url text CONSTRAINT events_target_emoji_url_check CHECK (target_emoji_url ~* '^https://'),
      gear_emoji_url text CONSTRAINT events_gear_emoji_url_check CHECK (gear_emoji_url ~* '^https://'),
      spiral_calendar_emoji_url text CONSTRAINT events_spiral_calendar_emoji_url_check CHECK (spiral_calendar_emoji_url ~* '^https://'),
      sparkles_emoji_url text CONSTRAINT events_sparkles_emoji_url_check CHECK (sparkles_emoji_url ~* '^https://'),
      speech_bubble_emoji_url text CONSTRAINT events_speech_bubble_emoji_url_check CHECK (speech_bubble_emoji_url ~* '^https://'),
      newspaper_emoji_url text CONSTRAINT events_newspaper_emoji_url_check CHECK (newspaper_emoji_url ~* '^https://'),
      bar_chart_emoji_url text CONSTRAINT events_bar_chart_emoji_url_check CHECK (bar_chart_emoji_url ~* '^https://'),
      movie_camera_emoji_url text CONSTRAINT events_movie_camera_emoji_url_check CHECK (movie_camera_emoji_url ~* '^https://'),
      construction_worker_emoji_url text CONSTRAINT events_construction_worker_emoji_url_check CHECK (construction_worker_emoji_url ~* '^https://'),
      crystal_ball_emoji_url text CONSTRAINT events_crystal_ball_emoji_url_check CHECK (crystal_ball_emoji_url ~* '^https://'),
      butterfly_emoji_url text CONSTRAINT events_butterfly_emoji_url_check CHECK (butterfly_emoji_url ~* '^https://'),
      lady_beetle_emoji_url text CONSTRAINT events_lady_beetle_emoji_url_check CHECK (lady_beetle_emoji_url ~* '^https://'),
      --
      objectives_and_key_results_as_markdown text,
      key_performance_indicators_as_markdown text,
      glossary_as_url text CONSTRAINT events_glossary_as_url_check CHECK (glossary_as_url ~* '^https://'),
      glossary_as_markdown text,
      email_distribution_list text,
      daisyui_timeline_html text,
      org_mode text,
      task_list_as_markdown text,
      ways_of_working_as_markdown text,
      six_pager_double_sider_as_url text CONSTRAINT events_six_pager_double_sider_as_url_check CHECK (six_pager_double_sider_as_url ~* '^https://'),
      six_pager_double_sider_as_markdown text,
      roles_and_responsibilities_as_url text CONSTRAINT events_roles_and_responsibilities_as_url_check CHECK (roles_and_responsibilities_as_url ~* '^https://'),
      roles_and_responsibilities_as_markdown text,
      responsibility_assignment_matrix_as_url text CONSTRAINT events_responsibility_assignment_matrix_as_url_check CHECK (responsibility_assignment_matrix_as_url ~* '^https://'),
      responsibility_assignment_matrix_as_markdown text,
      --- industry codes
      gs1_digital_link text,
      gs1_country_code text,
      gs1_global_location_number text,
      isic_v4_code text,
      isic_v4_name text,
      -- swot
      swot_as_url text CONSTRAINT events_swot_as_url_check CHECK (swot_as_url ~* '^https://'),
      swot_strengths_as_markdown text,
      swot_weaknesses_as_markdown text,
      swot_opportunities_as_markdown text,
      swot_threats_as_markdown text,
      --- sipoc
      sipoc_as_url text CONSTRAINT events_sipoc_as_url_check CHECK (sipoc_as_url ~* '^https://'),
      sipoc_suppliers_as_markdown text,
      sipoc_inputs_as_markdown text,
      sipoc_processes_as_markdown text,
      sipoc_outputs_as_markdown text,
      sipoc_customers_as_markdown text,
      --- steeple
      steeple_as_url text CONSTRAINT events_steeple_as_url_check CHECK (steeple_as_url ~* '^https://'),
      steeple_social_as_markdown text,
      steeple_technological_as_markdown text,
      steeple_economic_as_markdown text,
      steeple_environmental_as_markdown text,
      steeple_political_as_markdown text,
      steeple_legal_as_markdown text,
      steeple_ethical_as_markdown text,
      --- porters five forces
      porters_five_forces_as_url text CONSTRAINT events_porters_five_forces_as_url_check CHECK (porters_five_forces_as_url ~* '^https://'),
      porters_five_forces_entrants_as_markdown text,
      porters_five_forces_substitutes_as_markdown text,
      porters_five_forces_customers_as_markdown text,
      porters_five_forces_suppliers_as_markdown text,
      porters_five_forces_competitors_as_markdown text,
      --- Policies
      code_of_conduct_policy_as_url text CONSTRAINT events_code_of_conduct_policy_as_url_check CHECK (code_of_conduct_policy_as_url ~* '^https://'),
      code_of_conduct_policy_as_markdown text,
      coordinated_disclosure_policy_as_url text CONSTRAINT events_coordinated_disclosure_policy_as_url_check CHECK (coordinated_disclosure_policy_as_url ~* '^https://'),
      coordinated_disclosure_policy_as_markdown text,
      copyright_policy_as_url text CONSTRAINT events_copyright_policy_as_url_check CHECK (copyright_policy_as_url ~* '^https://'),
      copyright_policy_as_markdown text,
      corrections_policy_as_url text CONSTRAINT events_corrections_policy_as_url_check CHECK (corrections_policy_as_url ~* '^https://'),
      corrections_policy_as_markdown text,
      diversity_policy_as_url text CONSTRAINT events_diversity_policy_as_url_check CHECK (diversity_policy_as_url ~* '^https://'),
      diversity_policy_as_markdown text,
      equal_opportunity_policy_as_url text CONSTRAINT events_equal_opportunity_policy_as_url_check CHECK (equal_opportunity_policy_as_url ~* '^https://'),
      equal_opportunity_policy_as_markdown text,
      ethics_policy_as_url text CONSTRAINT events_ethics_policy_as_url_check CHECK (ethics_policy_as_url ~* '^https://'),
      ethics_policy_as_markdown text,
      legal_policy_as_url text CONSTRAINT events_legal_policy_as_url_check CHECK (legal_policy_as_url ~* '^https://'),
      legal_policy_as_markdown text,
      license_policy_as_url text CONSTRAINT events_license_policy_as_url_check CHECK (license_policy_as_url ~* '^https://'),
      license_policy_as_markdown text,
      open_source_policy_as_url text CONSTRAINT events_open_source_policy_as_url_check CHECK (open_source_policy_as_url ~* '^https://'),
      open_source_policy_as_markdown text,
      privacy_policy_as_url text CONSTRAINT events_privacy_policy_as_url_check CHECK (privacy_policy_as_url ~* '^https://'),
      privacy_policy_as_markdown text,
      safety_policy_as_url text CONSTRAINT events_safety_policy_as_url_check CHECK (safety_policy_as_url ~* '^https://'),
      safety_policy_as_markdown text,
      security_policy_as_url text CONSTRAINT events_security_policy_as_url_check CHECK (security_policy_as_url ~* '^https://'),
      security_policy_as_markdown text,
      socials_policy_as_url text CONSTRAINT events_socials_policy_as_url_check CHECK (socials_policy_as_url ~* '^https://'),
      socials_policy_as_markdown text,
      staff_policy_as_url text CONSTRAINT events_staff_policy_as_url_check CHECK (staff_policy_as_url ~* '^https://'),
      staff_policy_as_markdown text,
      --- arc42
      arc42_as_url text CONSTRAINT events_arc42_as_url_check CHECK (arc42_as_url ~* '^https://'),
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
      apache_echart_as_url text CONSTRAINT events_apache_echart_as_url_check CHECK (apache_echart_as_url ~* '^https://'),
      apache_echart_as_typescript text,
      --- net_promoter_score
      net_promoter_score_customer_perspective_actual numeric(7,2),
      net_promoter_score_customer_perspective_expect numeric(7,2),
      net_promoter_score_customer_perspective_ratio numeric(7,2) GENERATED ALWAYS AS (net_promoter_score_customer_perspective_actual / net_promoter_score_customer_perspective_expect) STORED,
      net_promoter_score_customer_perspective_unit text,
      net_promoter_score_customer_perspective_description_as_markdown text,
      net_promoter_score_user_perspective_actual numeric(7,2),
      net_promoter_score_user_perspective_expect numeric(7,2),
      net_promoter_score_user_perspective_ratio numeric(7,2) GENERATED ALWAYS AS (net_promoter_score_user_perspective_actual / net_promoter_score_user_perspective_expect) STORED,
      net_promoter_score_user_perspective_unit text,
      net_promoter_score_user_perspective_description_as_markdown text,
      net_promoter_score_worker_perspective_actual numeric(7,2),
      net_promoter_score_worker_perspective_expect numeric(7,2),
      net_promoter_score_worker_perspective_ratio numeric(7,2) GENERATED ALWAYS AS (net_promoter_score_worker_perspective_actual / net_promoter_score_worker_perspective_expect) STORED,
      net_promoter_score_worker_perspective_unit text,
      net_promoter_score_worker_perspective_description_as_markdown text,
      --- active_users
      active_users_actual numeric(7,2),
      active_users_expect numeric(7,2),
      active_users_ratio numeric(7,2) GENERATED ALWAYS AS (active_users_actual / active_users_expect) STORED,
      active_users_unit text,
      active_users_description text,
      --- uptime_percentage
      uptime_percentage_actual numeric(7,5),
      uptime_percentage_expect numeric(7,5),
      uptime_percentage_ratio numeric(7,2) GENERATED ALWAYS AS (uptime_percentage_actual / uptime_percentage_expect) STORED,
      uptime_percentage_unit text,
      uptime_percentage_description text,
      --- burn_rate
      burn_rate_net_cash_per_week_actual numeric(7,2),
      burn_rate_net_cash_per_week_expect numeric(7,2),
      burn_rate_net_cash_per_week_ratio numeric(7,2) GENERATED ALWAYS AS (burn_rate_net_cash_per_week_actual / burn_rate_net_cash_per_week_expect) STORED,
      burn_rate_net_cash_per_week_unit text,
      burn_rate_net_cash_per_week_description text,
      burn_rate_net_hours_per_week_actual numeric(7,2),
      burn_rate_net_hours_per_week_expect numeric(7,2),
      burn_rate_net_hours_per_week_ratio numeric(7,2) GENERATED ALWAYS AS (burn_rate_net_hours_per_week_actual / burn_rate_net_hours_per_week_expect) STORED,
      burn_rate_net_hours_per_week_unit text,
      burn_rate_net_hours_per_week_description text,
      --- earned_value_management
      earned_value_management_planned_value numeric(7,2),
      earned_value_management_earned_value numeric(7,2),
      earned_value_management_actual_cost numeric(7,2),
      earned_value_management_cost_variance numeric(7,2) GENERATED ALWAYS AS (earned_value_management_earned_value - earned_value_management_actual_cost) STORED,
      earned_value_management_cost_variance_ratio numeric(7,2) GENERATED ALWAYS AS ((earned_value_management_earned_value - earned_value_management_actual_cost) / earned_value_management_earned_value) STORED,
      earned_value_management_cost_performance_index numeric(7,2) GENERATED ALWAYS AS (earned_value_management_earned_value / earned_value_management_actual_cost) STORED,
      earned_value_management_schedule_variance numeric(7,2) GENERATED ALWAYS AS (earned_value_management_earned_value - earned_value_management_planned_value) STORED,
      earned_value_management_schedule_variance_ratio numeric(7,2) GENERATED ALWAYS AS ((earned_value_management_earned_value - earned_value_management_planned_value) / earned_value_management_planned_value) STORED,
      earned_value_management_schedule_performance_index numeric(7,2) GENERATED ALWAYS AS (earned_value_management_earned_value / earned_value_management_planned_value) STORED,
      --- total_project_control
      total_project_control_dipp numeric(7,2),
      total_project_control_dipp_progress_index_ratio numeric(7,2) GENERATED ALWAYS AS (total_project_control_dipp_progress_index_numerator / total_project_control_dipp_progress_index_denominator) STORED,
      total_project_control_dipp_progress_index_numerator numeric(7,2),
      total_project_control_dipp_progress_index_denominator numeric(7,2),
      total_project_control_expected_monetary_value numeric(7,2),
      total_project_control_cost_estimate_to_complete numeric(7,2)
    );
    """

    execute """
    CREATE TRIGGER trigger_events_updated_at
      BEFORE UPDATE ON events
      FOR EACH ROW EXECUTE FUNCTION
      trigger_updated_at();
    """

    execute """
    CREATE INDEX events_index_gto
      ON events USING GIN ((
        sign
          || ' ' || name
          || ' ' || status
          || ' ' || tagging
          || ' ' || note
          || ' ' || ai_agent_instructions_as_markdown
          || ' ' || web
          || ' ' || email
          || ' ' || phone
          || ' ' || chat
          || ' ' || calendar
          || ' ' || postal
          || ' ' || rdf_type
          || ' ' || bluesky_as_url
          || ' ' || codeberg_as_url
          || ' ' || github_as_url
          || ' ' || instagram_as_url
          || ' ' || linkedin_as_url
          || ' ' || mastodon_as_url
          || ' ' || orcid_as_url
          || ' ' || tiktok_as_url
          || ' ' || wikipedia_as_url
          || ' ' || youtube_as_url
    ) gin_trgm_ops);
    """
    execute "CREATE INDEX events_created_at_index ON events (created_at);"
    execute "CREATE INDEX events_updated_at_index ON events (updated_at);"
    execute "CREATE INDEX events_deleted_at_index ON events (deleted_at);"
    execute "CREATE INDEX events_locale_code_index ON events (locale_code);"
    execute "CREATE INDEX events_name_index ON events (name);"
    execute "CREATE INDEX events_name_index_tpo ON events (name text_pattern_ops);"
    execute "CREATE INDEX events_tagging_index ON events (tagging);"
    execute "CREATE INDEX events_tagging_index_tpo ON events (tagging text_pattern_ops);"
    execute "CREATE INDEX events_location_iso_3166_1_alpha_2_index on events (location_iso_3166_1_alpha_2 );"
    execute "CREATE INDEX events_location_iso_3166_2_index on events (location_iso_3166_2);"
    execute "CREATE INDEX events_location_postal_code_index on events (location_postal_code);"
    execute "CREATE INDEX events_location_latitude_as_decimal_degrees_index on events (location_latitude_as_decimal_degrees);"
    execute "CREATE INDEX events_location_longitude_as_decimal_degrees_index on events (location_longitude_as_decimal_degrees);"
    execute "CREATE INDEX events_gs1_digital_link_index ON events (gs1_digital_link);"
    execute "CREATE INDEX events_gs1_country_code_index ON events (gs1_country_code);"
    execute "CREATE INDEX events_gs1_global_location_number_index ON events (gs1_global_location_number);"
    execute "CREATE INDEX events_isic_v4_code_index ON events (isic_v4_code);"
  end

  def down do
    execute "DROP CONSTRAINT IF EXISTS events_parent_id_fk;"
    execute "DROP CONSTRAINT IF EXISTS events_parent_order_check;"
    execute "DROP CONSTRAINT IF EXISTS events_sign_check;"
    execute "DROP CONSTRAINT IF EXISTS events_ai_agent_instructions_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS events_web_check;"
    execute "DROP CONSTRAINT IF EXISTS events_email_check;"
    execute "DROP CONSTRAINT IF EXISTS events_bluesky_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS events_codeberg_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS events_facebook_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS events_github_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS events_instagram_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS events_linkedin_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS events_mastodon_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS events_orcid_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS events_tiktok_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS events_wikipedia_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS events_youtube_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS events_avatar_image_400x400_url_check;"
    execute "DROP CONSTRAINT IF EXISTS events_main_image_1080x1080_url_check;"
    execute "DROP CONSTRAINT IF EXISTS events_main_image_1920x1080_url_check;"
    execute "DROP CONSTRAINT IF EXISTS events_main_image_1080x1920_url_check;"
    execute "DROP CONSTRAINT IF EXISTS events_ai_agent_instructions_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS events_home_emoji_url_check;"
    execute "DROP CONSTRAINT IF EXISTS events_bellhop_bell_emoji_url_check;"
    execute "DROP CONSTRAINT IF EXISTS events_target_emoji_url_check;"
    execute "DROP CONSTRAINT IF EXISTS events_gear_emoji_url_check;"
    execute "DROP CONSTRAINT IF EXISTS events_spiral_calendar_emoji_url_check;"
    execute "DROP CONSTRAINT IF EXISTS events_sparkles_emoji_url_check;"
    execute "DROP CONSTRAINT IF EXISTS events_speech_bubble_emoji_url_check;"
    execute "DROP CONSTRAINT IF EXISTS events_newspaper_emoji_url_check;"
    execute "DROP CONSTRAINT IF EXISTS events_bar_chart_emoji_url_check;"
    execute "DROP CONSTRAINT IF EXISTS events_movie_camera_emoji_url_check;"
    execute "DROP CONSTRAINT IF EXISTS events_construction_worker_emoji_url_check;"
    execute "DROP CONSTRAINT IF EXISTS events_crystal_ball_emoji_url_check;"
    execute "DROP CONSTRAINT IF EXISTS events_butterfly_emoji_url_check;"
    execute "DROP CONSTRAINT IF EXISTS events_lady_beetle_emoji_url_check;"
    execute "DROP CONSTRAINT IF EXISTS events_glossary_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS events_six_pager_double_sider_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS events_swot_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS events_porters_five_forces_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS events_steeple_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS events_roles_and_responsibilities_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS events_responsibility_assignment_matrix_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS events_code_of_conduct_policy_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS events_coordinated_disclosure_policy_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS events_copyright_policy_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS events_corrections_policy_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS events_diversity_policy_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS events_equal_opportunity_policy_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS events_ethics_policy_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS events_legal_policy_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS events_license_policy_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS events_open_source_policy_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS events_privacy_policy_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS events_safety_policy_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS events_security_policy_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS events_socials_policy_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS events_staff_policy_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS events_sipoc_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS events_arc42_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS events_apache_echart_as_url_check;"
    execute "DROP TRIGGER IF EXISTS trigger_events_updated_at;"
    execute "DROP INDEX IF EXISTS events_locale_code_index;"
    execute "DROP INDEX IF EXISTS events_created_at_index;"
    execute "DROP INDEX IF EXISTS events_updated_at_index;"
    execute "DROP INDEX IF EXISTS events_deleted_at_index;"
    execute "DROP INDEX IF EXISTS events_name_index;"
    execute "DROP INDEX IF EXISTS events_name_index_tpo;"
    execute "DROP INDEX IF EXISTS events_tagging_index;"
    execute "DROP INDEX IF EXISTS events_tagging_index_tpo;"
    execute "DROP INDEX IF EXISTS events_location_iso_3166_1_alpha_2_index;"
    execute "DROP INDEX IF EXISTS events_location_iso_3166_2_index;"
    execute "DROP INDEX IF EXISTS events_location_postal_code_index;"
    execute "DROP INDEX IF EXISTS events_location_latitude_as_decimal_degrees_index;"
    execute "DROP INDEX IF EXISTS events_location_longitude_as_decimal_degrees_index;"
    execute "DROP INDEX IF EXISTS events_gs1_digital_link_index;"
    execute "DROP INDEX IF EXISTS events_gs1_country_code_index;"
    execute "DROP INDEX IF EXISTS events_gs1_global_location_number_index;"
    execute "DROP INDEX IF EXISTS events_isic_v4_code_index;"
    execute "DROP TABLE IF EXISTS events;"
  end
end
