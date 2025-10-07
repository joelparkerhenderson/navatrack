defmodule Navatrack.Repo.Migrations.CreateTableGroups do
  @moduledoc """
  Create table groups.
  """

  use Ecto.Migration

  def up do
    execute """
    CREATE TABLE groups (
      id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
      created_at TIMESTAMP(6) WITH TIME ZONE DEFAULT (now() AT TIME ZONE 'utc'),
      updated_at TIMESTAMP(6) WITH TIME ZONE DEFAULT (now() AT TIME ZONE 'utc'),
      deleted_at TIMESTAMP(6) WITH TIME ZONE,
      locale_code text,
      name text,
      status text,
      tagging text,
      url text,
      email text CONSTRAINT email_check CHECK (email ~* '.@.'),
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
      agents_as_url text CONSTRAINT agents_as_url_check CHECK (agents_as_url ~* '^https://'),
      agents_as_markdown text,
      note text,
      daisyui_timeline_html text,
      org_mode text,
      task_list_as_markdown text,
      ways_of_working_as_markdown text,
      objectives_and_key_results_as_markdown text,
      key_performance_indicators_as_markdown text,
      avatar_image_400x400_url text CONSTRAINT avatar_image_400x400_url_check CHECK (avatar_image_400x400_url ~* '^https://'),
      avatar_image_400x400_alt text,
      main_image_1080x1080_url text CONSTRAINT main_image_1080x1080_url_check CHECK (main_image_1080x1080_url ~* '^https://'),
      main_image_1080x1080_alt text,
      main_image_1920x1080_url text CONSTRAINT main_image_1920x1080_url_check CHECK (main_image_1920x1080_url ~* '^https://'),
      main_image_1920x1080_alt text,
      main_image_1080x1920_url text CONSTRAINT main_image_1080x1920_url_check CHECK (main_image_1080x1920_url ~* '^https://'),
      main_image_1080x1920_alt text,
      gs1_digital_link text,
      gs1_country_code text,
      gs1_global_location_number text,
      isic_v4_code text,
      isic_v4_name text,
      copyright_policy_as_url text CONSTRAINT copyright_policy_as_url_check CHECK (copyright_policy_as_url ~* '^https://'),
      copyright_policy_as_markdown text,
      corrections_policy_as_url text CONSTRAINT corrections_policy_as_url_check CHECK (corrections_policy_as_url ~* '^https://'),
      corrections_policy_as_markdown text,
      legal_policy_as_url text CONSTRAINT legal_policy_as_url_check CHECK (legal_policy_as_url ~* '^https://'),
      legal_policy_as_markdown text,
      ethics_policy_as_url text CONSTRAINT ethics_policy_as_url_check CHECK (ethics_policy_as_url ~* '^https://'),
      ethics_policy_as_markdown text,
      privacy_policy_as_url text CONSTRAINT privacy_policy_as_url_check CHECK (privacy_policy_as_url ~* '^https://'),
      privacy_policy_as_markdown text,
      security_policy_as_url text CONSTRAINT security_policy_as_url_check CHECK (security_policy_as_url ~* '^https://'),
      security_policy_as_markdown text,
      coordinated_disclosure_policy_as_url text CONSTRAINT coordinated_disclosure_policy_as_url_check CHECK (coordinated_disclosure_policy_as_url ~* '^https://'),
      coordinated_disclosure_policy_as_markdown text,
      open_source_policy_as_url text CONSTRAINT open_source_policy_as_url_check CHECK (open_source_policy_as_url ~* '^https://'),
      open_source_policy_as_markdown text,
      code_of_conduct_policy_as_url text CONSTRAINT code_of_conduct_policy_as_url_check CHECK (code_of_conduct_policy_as_url ~* '^https://'),
      code_of_conduct_policy_as_markdown text,
      equal_opportunity_policy_as_url text CONSTRAINT equal_opportunity_policy_as_url_check CHECK (equal_opportunity_policy_as_url ~* '^https://'),
      equal_opportunity_policy_as_markdown text,
      social_network_policy_as_url text CONSTRAINT social_network_policy_as_url_check CHECK (social_network_policy_as_url ~* '^https://'),
      social_network_policy_as_markdown text,
      health_and_safety_policy_as_url text CONSTRAINT health_and_safety_policy_as_url_check CHECK (health_and_safety_policy_as_url ~* '^https://'),
      health_and_safety_policy_as_markdown text,
      employee_handbook_policy_as_url text CONSTRAINT employee_handbook_policy_as_url_check CHECK (employee_handbook_policy_as_url ~* '^https://'),
      employee_handbook_policy_as_markdown text,
      human_resources_policy_as_url text CONSTRAINT human_resources_policy_as_url_check CHECK (human_resources_policy_as_url ~* '^https://'),
      human_resources_policy_as_markdown text
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
        name
          || ' ' ||
        status
          || ' ' ||
        tagging
          || ' ' ||
        note
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
    execute "CREATE INDEX groups_gs1_digital_link_index ON groups (gs1_digital_link);"
    execute "CREATE INDEX groups_gs1_country_code_index ON groups (gs1_country_code);"
    execute "CREATE INDEX groups_gs1_global_location_number_index ON groups (gs1_global_location_number);"
    execute "CREATE INDEX groups_isic_v4_code_index ON groups (isic_v4_code);"
  end

  def down do
    execute "DROP CONSTRAINT IF EXISTS email_check;"
    execute "DROP CONSTRAINT IF EXISTS linkedin_url_check;"
    execute "DROP CONSTRAINT IF EXISTS github_url_check;"
    execute "DROP CONSTRAINT IF EXISTS codeberg_url_check;"
    execute "DROP CONSTRAINT IF EXISTS location_iso_3166_1_alpha_2_check;"
    execute "DROP CONSTRAINT IF EXISTS agents_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS avatar_image_400x400_url_check;"
    execute "DROP CONSTRAINT IF EXISTS main_image_1080x1080_url_check;"
    execute "DROP CONSTRAINT IF EXISTS main_image_1920x1080_url_check;"
    execute "DROP CONSTRAINT IF EXISTS main_image_1080x1920_url_check;"
    execute "DROP CONSTRAINT IF EXISTS copyright_policy_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS corrections_policy_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS legal_policy_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS ethics_policy_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS privacy_policy_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS security_policy_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS coordinated_disclosure_policy_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS open_source_policy_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS code_of_conduct_policy_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS equal_opportunity_policy_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS social_network_policy_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS health_and_safety_policy_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS employee_handbook_policy_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS human_resources_policy_as_url_check;"
    execute "DROP TRIGGER IF EXISTS trigger_groups_updated_at;"
    execute "DROP INDEX IF EXISTS groups_index_gto;"
    execute "DROP INDEX IF EXISTS groups_created_at_index;"
    execute "DROP INDEX IF EXISTS groups_updated_at_index;"
    execute "DROP INDEX IF EXISTS groups_deleted_at_index;"
    execute "DROP INDEX IF EXISTS groups_locale_code_index;"
    execute "DROP INDEX IF EXISTS groups_name_index;"
    execute "DROP INDEX IF EXISTS groups_name_index_tpo;"
    execute "DROP INDEX IF EXISTS groups_tagging_index;"
    execute "DROP INDEX IF EXISTS groups_tagging_index_tpo;"
    execute "DROP INDEX IF EXISTS groups_gs1_digital_link_index;"
    execute "DROP INDEX IF EXISTS groups_gs1_country_code_index;"
    execute "DROP INDEX IF EXISTS groups_gs1_global_location_number_index;"
    execute "DROP INDEX IF EXISTS groups_isic_v4_code_index;"
    execute "DROP TABLE IF EXISTS groups;"
  end
end
