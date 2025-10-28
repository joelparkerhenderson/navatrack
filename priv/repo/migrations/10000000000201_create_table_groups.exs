defmodule Navatrack.Repo.Migrations.CreateTableGroups do
  @moduledoc """
  Create table groups.
  """

  use Ecto.Migration

  def up do
    execute """
    CREATE TABLE groups (
      --- meta
      id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
      created_at TIMESTAMP(6) WITH TIME ZONE DEFAULT (now() AT TIME ZONE 'utc'),
      updated_at TIMESTAMP(6) WITH TIME ZONE DEFAULT (now() AT TIME ZONE 'utc'),
      deleted_at TIMESTAMP(6) WITH TIME ZONE,
      locale_code text,
      parent_id uuid CONSTRAINT groups_parent_id_fk REFERENCES groups (id),
      parent_order int CONSTRAINT groups_parent_order_check CHECK (parent_order >= 0),
      --- card
      name text,
      sign text CONSTRAINT groups_sign_check CHECK (LENGTH(sign) = 1),
      status text,
      tagging text,
      note text,
      -- ai
      ai_agent_instructions_as_url text CONSTRAINT groups_ai_agent_instructions_as_url CHECK (ai_agent_instructions_as_url ~* '^https://'),
      ai_agent_instructions_as_markdown text,
      --- contact
      web text CONSTRAINT groups_web_check CHECK (web ~* '^https://'),
      email text CONSTRAINT groups_email_check CHECK (email ~*  '.@.'),
      phone text,
      chat text,
      calendar text,
      postal text,
      rdf_type text,
      --- social
      bluesky_as_url text CONSTRAINT groups_bluesky_as_url_check CHECK (bluesky_as_url ~* '^https://bsky\.app/'),
      codeberg_as_url text CONSTRAINT groups_codeberg_as_url_check CHECK (codeberg_as_url ~* '^https://codeberg\.org/'),
      facebook_as_url text CONSTRAINT groups_facebook_as_url_check CHECK (facebook_as_url ~* '^https://facebook\.com/'),
      github_as_url text CONSTRAINT groups_github_as_url_check CHECK (github_as_url ~* '^https://github\.com/'),
      instagram_as_url text CONSTRAINT groups_instagram_as_url_check CHECK (instagram_as_url ~* '^https://instagram\.com/'),
      linkedin_as_url text CONSTRAINT groups_linkedin_as_url_check CHECK (linkedin_as_url ~* '^https://linkedin\.com/'),
      mastodon_as_url text CONSTRAINT groups_mastodon_as_url_check CHECK (mastodon_as_url ~* '^https://'),
      orcid_as_url text CONSTRAINT groups_orcid_as_url_check CHECK (orcid_as_url ~* '^https://orcid\.org/'),
      tiktok_as_url text CONSTRAINT groups_tiktok_as_url_check CHECK (tiktok_as_url ~* '^https://tiktok\.com/'),
      wikipedia_as_url text CONSTRAINT groups_wikipedia_uri_check CHECK (wikipedia_as_url ~* '^https://wikipedia\.org/'),
      youtube_as_url text CONSTRAINT groups_youtube_as_url_check CHECK (youtube_as_url ~* '^https://youtube\.com/'),
      --- location
      location_iso_3166_1_alpha_2 char(2) CONSTRAINT groups_location_iso_3166_1_alpha_2_check CHECK (location_iso_3166_1_alpha_2 ~* '^[a-z][a-z]$'),
      location_iso_3166_2 text,
      location_postal_code text,
      location_latitude_as_decimal_degrees numeric(9, 7) CONSTRAINT groups_location_latitude_as_decimal_degrees_check CHECK (location_latitude_as_decimal_degrees BETWEEN -90.0 AND 90.0),
      location_longitude_as_decimal_degrees numeric(10, 7) CONSTRAINT groups_location_longitude_as_decimal_degrees_check CHECK (location_longitude_as_decimal_degrees BETWEEN -180.0 AND 180.0),
      --- images
      avatar_image_400x400_url text CONSTRAINT groups_avatar_image_400x400_url_check CHECK (avatar_image_400x400_url ~* '^https://'),
      avatar_image_400x400_alt text,
      main_image_1080x1080_url text CONSTRAINT groups_main_image_1080x1080_url_check CHECK (main_image_1080x1080_url ~* '^https://'),
      main_image_1080x1080_alt text,
      main_image_1920x1080_url text CONSTRAINT groups_main_image_1920x1080_url_check CHECK (main_image_1920x1080_url ~* '^https://'),
      main_image_1920x1080_alt text,
      main_image_1080x1920_url text CONSTRAINT groups_main_image_1080x1920_url_check CHECK (main_image_1080x1920_url ~* '^https://'),
      main_image_1080x1920_alt text,
      --- statements
      purpose_statement text,
      vision_statement text,
      mission_statement text,
      values_statement text,
      --- emoji
      home_emoji_url text CONSTRAINT groups_home_emoji_url_check CHECK (home_emoji_url ~* '^https://'),
      bellhop_bell_emoji_url text CONSTRAINT groups_bellhop_bell_emoji_url_check CHECK (bellhop_bell_emoji_url ~* '^https://'),
      target_emoji_url text CONSTRAINT groups_target_emoji_url_check CHECK (target_emoji_url ~* '^https://'),
      gear_emoji_url text CONSTRAINT groups_gear_emoji_url_check CHECK (gear_emoji_url ~* '^https://'),
      spiral_calendar_emoji_url text CONSTRAINT groups_spiral_calendar_emoji_url_check CHECK (spiral_calendar_emoji_url ~* '^https://'),
      sparkles_emoji_url text CONSTRAINT groups_sparkles_emoji_url_check CHECK (sparkles_emoji_url ~* '^https://'),
      speech_bubble_emoji_url text CONSTRAINT groups_speech_bubble_emoji_url_check CHECK (speech_bubble_emoji_url ~* '^https://'),
      newspaper_emoji_url text CONSTRAINT groups_newspaper_emoji_url_check CHECK (newspaper_emoji_url ~* '^https://'),
      bar_chart_emoji_url text CONSTRAINT groups_bar_chart_emoji_url_check CHECK (bar_chart_emoji_url ~* '^https://'),
      movie_camera_emoji_url text CONSTRAINT groups_movie_camera_emoji_url_check CHECK (movie_camera_emoji_url ~* '^https://'),
      construction_worker_emoji_url text CONSTRAINT groups_construction_worker_emoji_url_check CHECK (construction_worker_emoji_url ~* '^https://'),
      crystal_ball_emoji_url text CONSTRAINT groups_crystal_ball_emoji_url_check CHECK (crystal_ball_emoji_url ~* '^https://'),
      butterfly_emoji_url text CONSTRAINT groups_butterfly_emoji_url_check CHECK (butterfly_emoji_url ~* '^https://'),
      lady_beetle_emoji_url text CONSTRAINT groups_lady_beetle_emoji_url_check CHECK (lady_beetle_emoji_url ~* '^https://'),
      --
      objectives_and_key_results_as_markdown text,
      key_performance_indicators_as_markdown text,
      glossary_as_url text CONSTRAINT groups_glossary_as_url_check CHECK (glossary_as_url ~* '^https://'),
      glossary_as_markdown text,
      email_distribution_list text,
      daisyui_timeline_html text,
      org_mode text,
      task_list_as_markdown text,
      ways_of_working_as_markdown text,
      six_pager_double_sider_as_url text CONSTRAINT groups_six_pager_double_sider_as_url_check CHECK (six_pager_double_sider_as_url ~* '^https://'),
      six_pager_double_sider_as_markdown text,
      roles_and_responsibilities_as_url text CONSTRAINT groups_roles_and_responsibilities_as_url_check CHECK (roles_and_responsibilities_as_url ~* '^https://'),
      roles_and_responsibilities_as_markdown text,
      responsibility_assignment_matrix_as_url text CONSTRAINT groups_responsibility_assignment_matrix_as_url_check CHECK (responsibility_assignment_matrix_as_url ~* '^https://'),
      responsibility_assignment_matrix_as_markdown text,
      --- industry codes
      gs1_digital_link text,
      gs1_country_code text,
      gs1_global_location_number text,
      isic_v4_code text,
      isic_v4_name text,
      -- swot
      swot_as_url text CONSTRAINT groups_swot_as_url_check CHECK (swot_as_url ~* '^https://'),
      swot_strengths_as_markdown text,
      swot_weaknesses_as_markdown text,
      swot_opportunities_as_markdown text,
      swot_threats_as_markdown text,
      --- sipoc
      sipoc_as_url text CONSTRAINT groups_sipoc_as_url_check CHECK (sipoc_as_url ~* '^https://'),
      sipoc_suppliers_as_markdown text,
      sipoc_inputs_as_markdown text,
      sipoc_processes_as_markdown text,
      sipoc_outputs_as_markdown text,
      sipoc_customers_as_markdown text,
      --- steeple
      steeple_as_url text CONSTRAINT groups_steeple_as_url_check CHECK (steeple_as_url ~* '^https://'),
      steeple_social_as_markdown text,
      steeple_technological_as_markdown text,
      steeple_economic_as_markdown text,
      steeple_environmental_as_markdown text,
      steeple_political_as_markdown text,
      steeple_legal_as_markdown text,
      steeple_ethical_as_markdown text,
      --- porters five forces
      porters_five_forces_as_url text CONSTRAINT groups_porters_five_forces_as_url_check CHECK (porters_five_forces_as_url ~* '^https://'),
      porters_five_forces_entrants_as_markdown text,
      porters_five_forces_substitutes_as_markdown text,
      porters_five_forces_customers_as_markdown text,
      porters_five_forces_suppliers_as_markdown text,
      porters_five_forces_competitors_as_markdown text,
      --- Policies
      code_of_conduct_policy_as_url text CONSTRAINT groups_code_of_conduct_policy_as_url_check CHECK (code_of_conduct_policy_as_url ~* '^https://'),
      code_of_conduct_policy_as_markdown text,
      coordinated_disclosure_policy_as_url text CONSTRAINT groups_coordinated_disclosure_policy_as_url_check CHECK (coordinated_disclosure_policy_as_url ~* '^https://'),
      coordinated_disclosure_policy_as_markdown text,
      copyright_policy_as_url text CONSTRAINT groups_copyright_policy_as_url_check CHECK (copyright_policy_as_url ~* '^https://'),
      copyright_policy_as_markdown text,
      corrections_policy_as_url text CONSTRAINT groups_corrections_policy_as_url_check CHECK (corrections_policy_as_url ~* '^https://'),
      corrections_policy_as_markdown text,
      diversity_policy_as_url text CONSTRAINT groups_diversity_policy_as_url_check CHECK (diversity_policy_as_url ~* '^https://'),
      diversity_policy_as_markdown text,
      equal_opportunity_policy_as_url text CONSTRAINT groups_equal_opportunity_policy_as_url_check CHECK (equal_opportunity_policy_as_url ~* '^https://'),
      equal_opportunity_policy_as_markdown text,
      ethics_policy_as_url text CONSTRAINT groups_ethics_policy_as_url_check CHECK (ethics_policy_as_url ~* '^https://'),
      ethics_policy_as_markdown text,
      legal_policy_as_url text CONSTRAINT groups_legal_policy_as_url_check CHECK (legal_policy_as_url ~* '^https://'),
      legal_policy_as_markdown text,
      license_policy_as_url text CONSTRAINT groups_license_policy_as_url_check CHECK (license_policy_as_url ~* '^https://'),
      license_policy_as_markdown text,
      open_source_policy_as_url text CONSTRAINT groups_open_source_policy_as_url_check CHECK (open_source_policy_as_url ~* '^https://'),
      open_source_policy_as_markdown text,
      privacy_policy_as_url text CONSTRAINT groups_privacy_policy_as_url_check CHECK (privacy_policy_as_url ~* '^https://'),
      privacy_policy_as_markdown text,
      safety_policy_as_url text CONSTRAINT groups_safety_policy_as_url_check CHECK (safety_policy_as_url ~* '^https://'),
      safety_policy_as_markdown text,
      security_policy_as_url text CONSTRAINT groups_security_policy_as_url_check CHECK (security_policy_as_url ~* '^https://'),
      security_policy_as_markdown text,
      socials_policy_as_url text CONSTRAINT groups_socials_policy_as_url_check CHECK (socials_policy_as_url ~* '^https://'),
      socials_policy_as_markdown text,
      staff_policy_as_url text CONSTRAINT groups_staff_policy_as_url_check CHECK (staff_policy_as_url ~* '^https://'),
      staff_policy_as_markdown text,
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
      -- apache_echart
      apache_echart_as_url text CONSTRAINT groups_apache_echart_as_url_check CHECK (apache_echart_as_url ~* '^https://'),
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
      active_users_description text
    );
    """

    execute """
    CREATE TRIGGER trigger_groups_updated_at
      BEFORE UPDATE ON groups
      FOR EACH ROW EXECUTE FUNCTION
      trigger_updated_at();
    """

    execute """
    CREATE INDEX groups_index_gto
      ON groups USING GIN ((
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
    execute "CREATE INDEX groups_created_at_index ON groups (created_at);"
    execute "CREATE INDEX groups_updated_at_index ON groups (updated_at);"
    execute "CREATE INDEX groups_deleted_at_index ON groups (deleted_at);"
    execute "CREATE INDEX groups_locale_code_index ON groups (locale_code);"
    execute "CREATE INDEX groups_name_index ON groups (name);"
    execute "CREATE INDEX groups_name_index_tpo ON groups (name text_pattern_ops);"
    execute "CREATE INDEX groups_tagging_index ON groups (tagging);"
    execute "CREATE INDEX groups_tagging_index_tpo ON groups (tagging text_pattern_ops);"
    execute "CREATE INDEX groups_location_iso_3166_1_alpha_2_index on groups (location_iso_3166_1_alpha_2 );"
    execute "CREATE INDEX groups_location_iso_3166_2_index on groups (location_iso_3166_2);"
    execute "CREATE INDEX groups_location_postal_code_index on groups (location_postal_code);"
    execute "CREATE INDEX groups_location_latitude_as_decimal_degrees_index on groups (location_latitude_as_decimal_degrees);"
    execute "CREATE INDEX groups_location_longitude_as_decimal_degrees_index on groups (location_longitude_as_decimal_degrees);"
    execute "CREATE INDEX groups_gs1_digital_link_index ON groups (gs1_digital_link);"
    execute "CREATE INDEX groups_gs1_country_code_index ON groups (gs1_country_code);"
    execute "CREATE INDEX groups_gs1_global_location_number_index ON groups (gs1_global_location_number);"
    execute "CREATE INDEX groups_isic_v4_code_index ON groups (isic_v4_code);"
  end

  def down do
    execute "DROP CONSTRAINT IF EXISTS groups_parent_id_fk;"
    execute "DROP CONSTRAINT IF EXISTS groups_parent_order_check;"
    execute "DROP CONSTRAINT IF EXISTS groups_sign_check;"
    execute "DROP CONSTRAINT IF EXISTS groups_ai_agent_instructions_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS groups_web_check;"
    execute "DROP CONSTRAINT IF EXISTS groups_email_check;"
    execute "DROP CONSTRAINT IF EXISTS groups_bluesky_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS groups_codeberg_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS groups_facebook_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS groups_github_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS groups_instagram_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS groups_linkedin_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS groups_mastodon_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS groups_orcid_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS groups_tiktok_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS groups_wikipedia_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS groups_youtube_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS groups_avatar_image_400x400_url_check;"
    execute "DROP CONSTRAINT IF EXISTS groups_main_image_1080x1080_url_check;"
    execute "DROP CONSTRAINT IF EXISTS groups_main_image_1920x1080_url_check;"
    execute "DROP CONSTRAINT IF EXISTS groups_main_image_1080x1920_url_check;"
    execute "DROP CONSTRAINT IF EXISTS groups_home_emoji_url_check;"
    execute "DROP CONSTRAINT IF EXISTS groups_bellhop_bell_emoji_url_check;"
    execute "DROP CONSTRAINT IF EXISTS groups_target_emoji_url_check;"
    execute "DROP CONSTRAINT IF EXISTS groups_gear_emoji_url_check;"
    execute "DROP CONSTRAINT IF EXISTS groups_spiral_calendar_emoji_url_check;"
    execute "DROP CONSTRAINT IF EXISTS groups_sparkles_emoji_url_check;"
    execute "DROP CONSTRAINT IF EXISTS groups_speech_bubble_emoji_url_check;"
    execute "DROP CONSTRAINT IF EXISTS groups_newspaper_emoji_url_check;"
    execute "DROP CONSTRAINT IF EXISTS groups_bar_chart_emoji_url_check;"
    execute "DROP CONSTRAINT IF EXISTS groups_movie_camera_emoji_url_check;"
    execute "DROP CONSTRAINT IF EXISTS groups_construction_worker_emoji_url_check;"
    execute "DROP CONSTRAINT IF EXISTS groups_crystal_ball_emoji_url_check;"
    execute "DROP CONSTRAINT IF EXISTS groups_butterfly_emoji_url_check;"
    execute "DROP CONSTRAINT IF EXISTS groups_lady_beetle_emoji_url_check;"
    execute "DROP CONSTRAINT IF EXISTS groups_glossary_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS groups_six_pager_double_sider_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS groups_swot_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS groups_porters_five_forces_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS groups_steeple_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS groups_roles_and_responsibilities_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS groups_responsibility_assignment_matrix_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS groups_code_of_conduct_policy_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS groups_coordinated_disclosure_policy_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS groups_copyright_policy_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS groups_corrections_policy_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS groups_diversity_policy_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS groups_equal_opportunity_policy_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS groups_ethics_policy_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS groups_legal_policy_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS groups_license_policy_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS groups_open_source_policy_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS groups_privacy_policy_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS groups_safety_policy_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS groups_security_policy_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS groups_socials_policy_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS groups_staff_policy_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS groups_sipoc_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS groups_apache_echart_as_url_check;"
    execute "DROP TRIGGER IF EXISTS trigger_groups_updated_at;"
    execute "DROP INDEX IF EXISTS groups_locale_code_index;"
    execute "DROP INDEX IF EXISTS groups_created_at_index;"
    execute "DROP INDEX IF EXISTS groups_updated_at_index;"
    execute "DROP INDEX IF EXISTS groups_deleted_at_index;"
    execute "DROP INDEX IF EXISTS groups_name_index;"
    execute "DROP INDEX IF EXISTS groups_name_index_tpo;"
    execute "DROP INDEX IF EXISTS groups_tagging_index;"
    execute "DROP INDEX IF EXISTS groups_tagging_index_tpo;"
    execute "DROP INDEX IF EXISTS groups_location_iso_3166_1_alpha_2_index;"
    execute "DROP INDEX IF EXISTS groups_location_iso_3166_2_index;"
    execute "DROP INDEX IF EXISTS groups_location_postal_code_index;"
    execute "DROP INDEX IF EXISTS groups_location_latitude_as_decimal_degrees_index;"
    execute "DROP INDEX IF EXISTS groups_location_longitude_as_decimal_degrees_index;"
    execute "DROP INDEX IF EXISTS groups_gs1_digital_link_index;"
    execute "DROP INDEX IF EXISTS groups_gs1_country_code_index;"
    execute "DROP INDEX IF EXISTS groups_gs1_global_location_number_index;"
    execute "DROP INDEX IF EXISTS groups_isic_v4_code_index;"
    execute "DROP TABLE IF EXISTS groups;"
  end
end
