defmodule Navatrack.Repo.Migrations.CreateTableUsers do
  @moduledoc """
  Create table users.
  """

  use Ecto.Migration

  def up do
    execute """
    CREATE TABLE users (
      --- meta
      id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
      created_at TIMESTAMP(6) WITH TIME ZONE DEFAULT (now() AT TIME ZONE 'utc'),
      updated_at TIMESTAMP(6) WITH TIME ZONE DEFAULT (now() AT TIME ZONE 'utc'),
      deleted_at TIMESTAMP(6) WITH TIME ZONE,
      locale_code text,
      parent_id uuid CONSTRAINT users_parent_id_fk REFERENCES users (id),
      parent_order int CONSTRAINT users_users_parent_order_check CHECK (parent_order >= 0),
      --- card
      name text,
      sign text CONSTRAINT users_sign_check CHECK (LENGTH(sign) = 1),
      status text,
      tagging text,
      note text,
      -- ai
      ai_agent_instructions_as_url text CONSTRAINT users_ai_agent_instructions_as_url CHECK (ai_agent_instructions_as_url ~* '^https://'),
      ai_agent_instructions_as_markdown text,
      --- contact
      web text CONSTRAINT users_web_check CHECK (web ~* '^https://'),
      email text CONSTRAINT users_email_check CHECK (email ~*  '.@.'),
      phone text,
      chat text,
      calendar text,
      postal text,
      rdf_type text,
      --- social
      bluesky_as_url text CONSTRAINT users_bluesky_as_url_check CHECK (bluesky_as_url ~* '^https://bsky\.app/'),
      codeberg_as_url text CONSTRAINT users_codeberg_as_url_check CHECK (codeberg_as_url ~* '^https://codeberg\.org/'),
      facebook_as_url text CONSTRAINT users_facebook_as_url_check CHECK (facebook_as_url ~* '^https://facebook\.com/'),
      github_as_url text CONSTRAINT users_github_as_url_check CHECK (github_as_url ~* '^https://github\.com/'),
      instagram_as_url text CONSTRAINT users_instagram_as_url_check CHECK (instagram_as_url ~* '^https://instagram\.com/'),
      linkedin_as_url text CONSTRAINT users_linkedin_as_url_check CHECK (linkedin_as_url ~* '^https://linkedin\.com/'),
      mastodon_as_url text CONSTRAINT users_mastodon_as_url_check CHECK (mastodon_as_url ~* '^https://'),
      orcid_as_url text CONSTRAINT users_orcid_as_url_check CHECK (orcid_as_url ~* '^https://orcid\.org/'),
      tiktok_as_url text CONSTRAINT users_tiktok_as_url_check CHECK (tiktok_as_url ~* '^https://tiktok\.com/'),
      wikipedia_as_url text CONSTRAINT users_wikipedia_uri_check CHECK (wikipedia_as_url ~* '^https://wikipedia\.org/'),
      youtube_as_url text CONSTRAINT users_youtube_as_url_check CHECK (youtube_as_url ~* '^https://youtube\.com/'),
      --- location
      location_iso_3166_1_alpha_2 char(2) CONSTRAINT users_location_iso_3166_1_alpha_2_check CHECK (location_iso_3166_1_alpha_2 ~* '^[a-z][a-z]$'),
      location_iso_3166_2 text,
      location_postal_code text,
      location_latitude_as_decimal_degrees numeric(9, 7) CONSTRAINT users_location_latitude_as_decimal_degrees_check CHECK (location_latitude_as_decimal_degrees BETWEEN -90.0 AND 90.0),
      location_longitude_as_decimal_degrees numeric(10, 7) CONSTRAINT users_location_longitude_as_decimal_degrees_check CHECK (location_longitude_as_decimal_degrees BETWEEN -180.0 AND 180.0),
      --- images
      avatar_image_400x400_url text CONSTRAINT users_avatar_image_400x400_url_check CHECK (avatar_image_400x400_url ~* '^https://'),
      avatar_image_400x400_alt text,
      main_image_1080x1080_url text CONSTRAINT users_main_image_1080x1080_url_check CHECK (main_image_1080x1080_url ~* '^https://'),
      main_image_1080x1080_alt text,
      main_image_1920x1080_url text CONSTRAINT users_main_image_1920x1080_url_check CHECK (main_image_1920x1080_url ~* '^https://'),
      main_image_1920x1080_alt text,
      main_image_1080x1920_url text CONSTRAINT users_main_image_1080x1920_url_check CHECK (main_image_1080x1920_url ~* '^https://'),
      main_image_1080x1920_alt text,
      --- statements
      purpose_statement text,
      vision_statement text,
      mission_statement text,
      values_statement text,
      --- workable
      email_distribution_list text,
      daisyui_timeline_html text,
      org_mode text,
      task_list_as_markdown text,
      ways_of_working_as_markdown text,
      objectives_and_key_results_as_markdown text,
      key_performance_indicators_as_markdown text,
      --- work profile
      work_profile_resume_as_pdf_url text CONSTRAINT users_work_profile_resume_as_pdf_url_check CHECK (work_profile_resume_as_pdf_url ~* '^https://'),
      work_profile_resume_as_markdown text,
      work_profile_curriculum_vitae_as_pdf_url text CONSTRAINT users_work_profile_curriculum_vitae_as_pdf_url_check CHECK (work_profile_curriculum_vitae_as_pdf_url ~* '^https://'),
      work_profile_curriculum_vitae_as_markdown text,
      --- work role
      work_role_name text,
      work_role_start_date date,
      work_role_stop_date date,
      work_role_level text,
      work_role_description_as_markdown text,
      work_role_professional_development_plan_as_markdown text,
      work_role_onet_soc_2019_code text,
      work_role_uk_civil_service_grade_abbreviation text,
      work_role_uk_soc_2020_code text,
      work_role_uk_gdad_pcf_url text
    );
    """

    execute """
    CREATE TRIGGER trigger_users_updated_at
      BEFORE UPDATE ON users
      FOR EACH ROW EXECUTE FUNCTION
      trigger_updated_at();
    """

    execute """
    CREATE INDEX users_index_gto
      ON users
      USING GIN ((
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
          || ' ' || purpose_statement
          || ' ' || vision_statement
          || ' ' || mission_statement
          || ' ' || values_statement
          || ' ' || org_mode
          || ' ' || task_list_as_markdown
          || ' ' || ways_of_working_as_markdown
          || ' ' || objectives_and_key_results_as_markdown
          || ' ' || key_performance_indicators_as_markdown
          || ' ' || work_profile_resume_as_markdown
          || ' ' || work_profile_curriculum_vitae_as_markdown
          || ' ' || work_role_name
          || ' ' || work_role_level
          || ' ' || work_role_description_as_markdown
          || ' ' || work_role_professional_development_plan_as_markdown
          || ' ' || work_role_onet_soc_2019_code
          || ' ' || work_role_uk_civil_service_grade_abbreviation
          || ' ' || work_role_uk_soc_2020_code
          || ' ' || work_role_uk_gdad_pcf_url
      ) gin_trgm_ops);
    """
    execute "CREATE INDEX users_created_at_index ON users (created_at);"
    execute "CREATE INDEX users_updated_at_index ON users (updated_at);"
    execute "CREATE INDEX users_deleted_at_index ON users (deleted_at);"
    execute "CREATE INDEX users_locale_code_index ON users (locale_code);"
    execute "CREATE INDEX users_name_index ON users (name);"
    execute "CREATE INDEX users_name_index_tpo ON users (name text_pattern_ops);"
    execute "CREATE INDEX users_tagging_index ON users (tagging);"
    execute "CREATE INDEX users_tagging_index_tpo ON users (tagging text_pattern_ops);"
    execute "CREATE UNIQUE INDEX index_users_email ON users (email);"
    execute "CREATE INDEX users_work_role_onet_soc_2019_code_index ON users (work_role_onet_soc_2019_code);"
    execute "CREATE INDEX users_work_role_uk_civil_service_grade_abbreviation_index ON users (work_role_uk_civil_service_grade_abbreviation);"
  end

  def down do
    execute "DROP CONSTRAINT IF EXISTS users_parent_id_fk;"
    execute "DROP CONSTRAINT IF EXISTS users_parent_order_check;"
    execute "DROP CONSTRAINT IF EXISTS users_sign_check;"
    execute "DROP CONSTRAINT IF EXISTS users_ai_agent_instructions_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS users_web_check;"
    execute "DROP CONSTRAINT IF EXISTS users_email_check;"
    execute "DROP CONSTRAINT IF EXISTS users_bluesky_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS users_codeberg_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS users_facebook_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS users_github_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS users_instagram_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS users_linkedin_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS users_mastodon_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS users_orcid_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS users_tiktok_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS users_wikipedia_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS users_youtube_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS users_location_iso_3166_1_alpha_2_check;"
    execute "DROP CONSTRAINT IF EXISTS users_location_latitude_as_decimal_degrees_check;"
    execute "DROP CONSTRAINT IF EXISTS users_location_longitude_as_decimal_degrees_check;"
    execute "DROP CONSTRAINT IF EXISTS users_avatar_image_400x400_url_check;"
    execute "DROP CONSTRAINT IF EXISTS users_main_image_1080x1080_url_check;"
    execute "DROP CONSTRAINT IF EXISTS users_main_image_1920x1080_url_check;"
    execute "DROP CONSTRAINT IF EXISTS users_main_image_1080x1920_url_check;"
    execute "DROP CONSTRAINT IF EXISTS users_work_profile_resume_as_pdf_url_check;"
    execute "DROP CONSTRAINT IF EXISTS users_work_profile_curriculum_vitae_as_pdf_url_check;"
    execute "DROP TRIGGER IF EXISTS trigger_users_updated_at;"
    execute "DROP INDEX IF EXISTS users_index_gto;"
    execute "DROP INDEX IF EXISTS users_created_at_index;"
    execute "DROP INDEX IF EXISTS users_updated_at_index;"
    execute "DROP INDEX IF EXISTS users_deleted_at_index;"
    execute "DROP INDEX IF EXISTS users_locale_code_index;"
    execute "DROP INDEX IF EXISTS users_name_index;"
    execute "DROP INDEX IF EXISTS users_name_index_tpo;"
    execute "DROP INDEX IF EXISTS users_tagging_index;"
    execute "DROP INDEX IF EXISTS users_tagging_index_tpo;"
    execute "DROP INDEX IF EXISTS users_email_index;"
    execute "DROP INDEX IF EXISTS users_location_iso_3166_1_alpha_2_index;"
    execute "DROP INDEX IF EXISTS users_location_iso_3166_2_index;"
    execute "DROP INDEX IF EXISTS users_location_postal_code_index;"
    execute "DROP INDEX IF EXISTS users_location_latitude_as_decimal_degrees_index;"
    execute "DROP INDEX IF EXISTS users_location_longitude_as_decimal_degrees_index;"
    execute "DROP INDEX IF EXISTS users_work_role_onet_soc_2019_code_index;"
    execute "DROP INDEX IF EXISTS users_work_role_uk_civil_service_grade_abbreviation_index;"
    execute "DROP TABLE IF EXISTS users;"
  end
end
