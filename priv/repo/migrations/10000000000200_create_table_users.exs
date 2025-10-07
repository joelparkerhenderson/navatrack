defmodule Navatrack.Repo.Migrations.CreateTableUsers do
  @moduledoc """
  Create table users.
  """

  use Ecto.Migration

  def up do
    execute """
    CREATE TABLE users (
      id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
      created_at TIMESTAMP(6) WITH TIME ZONE DEFAULT (now() AT TIME ZONE 'utc'),
      updated_at TIMESTAMP(6) WITH TIME ZONE DEFAULT (now() AT TIME ZONE 'utc'),
      deleted_at TIMESTAMP(6) WITH TIME ZONE,
      locale_code text,
      name text,
      status text,
      tagging text,
      url text,
      email text CONSTRAINT email_check CHECK (email ~*  '.@.'),
      phone text,
      messaging text,
      postal text,
      orcid_pid text,
      rdf_type text,
      linkedin_url text CONSTRAINT linkedin_url_check CHECK (linkedin_url ~* '^https://linkedin\.com/'),
      github_url text CONSTRAINT github_url_check CHECK (github_url ~* '^https://github\.com/'),
      codeberg_url text CONSTRAINT codeberg_url_check CHECK (codeberg_url ~* '^https://codeberg\.org/'),
      location_iso_3166_1_alpha_2 char(2) CONSTRAINT location_iso_3166_1_alpha_2_check CHECK (location_iso_3166_1_alpha_2 ~* '^[a-z][a-z]$'),
      location_iso_3166_2 text,
      location_postal_code text,
      location_latitude_as_decimal_degrees decimal(9, 7) CONSTRAINT location_latitude_as_decimal_degrees_check CHECK (location_latitude_as_decimal_degrees BETWEEN -90.0 AND 90.0),
      location_longitude_as_decimal_degrees decimal(10, 7) CONSTRAINT location_longitude_as_decimal_degrees_check CHECK (location_longitude_as_decimal_degrees BETWEEN -180.0 AND 180.0),
      note text,
      daisyui_timeline_html text,
      org_mode text,
      task_list_as_markdown text,
      ways_of_working_as_markdown text,
      objectives_and_key_results_as_markdown text,
      key_performance_indicators_as_markdown text,
      agents_as_markdown text,
      avatar_image_400x400_url text CONSTRAINT avatar_image_400x400_url_check CHECK (avatar_image_400x400_url ~* '^https://'),
      avatar_image_400x400_alt text,
      main_image_1080x1080_url text CONSTRAINT main_image_1080x1080_url_check CHECK (main_image_1080x1080_url ~* '^https://'),
      main_image_1080x1080_alt text,
      main_image_1920x1080_url text CONSTRAINT main_image_1920x1080_url_check CHECK (main_image_1920x1080_url ~* '^https://'),
      main_image_1920x1080_alt text,
      main_image_1080x1920_url text CONSTRAINT main_image_1080x1920_url_check CHECK (main_image_1080x1920_url ~* '^https://'),
      main_image_1080x1920_alt text,
      work_profile_resume_as_pdf_url text CONSTRAINT work_profile_resume_as_pdf_url_check CHECK (work_profile_resume_as_pdf_url ~* '^https://'),
      work_profile_resume_as_markdown text,
      work_profile_curriculum_vitae_as_pdf_url text CONSTRAINT work_profile_curriculum_vitae_as_pdf_url_check CHECK (work_profile_curriculum_vitae_as_pdf_url ~* '^https://'),
      work_profile_curriculum_vitae_as_markdown text,
      work_role_name text,
      work_role_start_date date,
      work_role_stop_date date,
      work_role_level text,
      work_role_description_as_markdown text,
      work_role_professional_development_plan_markdown text,
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
        name
          || ' ' ||
        status
          || ' ' ||
        tagging
          || ' ' ||
        note
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
    execute "DROP CONSTRAINT email_check;"
    execute "DROP CONSTRAINT linkedin_url_check;"
    execute "DROP CONSTRAINT github_url_check;"
    execute "DROP CONSTRAINT codeberg_url_check;"
    execute "DROP CONSTRAINT location_iso_3166_1_alpha_2_check;"
    execute "DROP CONSTRAINT location_latitude_as_decimal_degrees_check;"
    execute "DROP CONSTRAINT location_longitude_as_decimal_degrees_check;"
    execute "DROP CONSTRAINT avatar_image_400x400_url_check;"
    execute "DROP CONSTRAINT main_image_1080x1080_url_check;"
    execute "DROP CONSTRAINT main_image_1920x1080_url_check;"
    execute "DROP CONSTRAINT main_image_1080x1920_url_check;"
    execute "DROP CONSTRAINT work_profile_resume_as_pdf_url_check;"
    execute "DROP CONSTRAINT work_profile_curriculum_vitae_as_pdf_url_check;"
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
    execute "DROP INDEX IF EXISTS users_work_role_onet_soc_2019_code_index;"
    execute "DROP INDEX IF EXISTS users_work_role_uk_civil_service_grade_abbreviation_index;"
    execute "DROP TABLE IF EXISTS users;"
  end
end
