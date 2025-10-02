defmodule Navatrack.Repo.Migrations.CreateTableOrganizations do
  @moduledoc """
  Create table organizations.
  """

  use Ecto.Migration

  def up do
    execute """
    CREATE TABLE organizations (
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
    execute "CREATE TRIGGER trigger_organizations_updated_at BEFORE UPDATE ON organizations FOR EACH ROW EXECUTE FUNCTION trigger_updated_at();"
    execute "CREATE INDEX organizations_created_at_index ON organizations (created_at);"
    execute "CREATE INDEX organizations_updated_at_index ON organizations (updated_at);"
    execute "CREATE INDEX organizations_deleted_at_index ON organizations (deleted_at);"
    execute "CREATE INDEX organizations_locale_code_index ON organizations (locale_code);"
    execute "CREATE INDEX organizations_sign_index ON organizations (sign);"
    execute "CREATE INDEX organizations_sign_index_tpo ON organizations (sign text_pattern_ops);"
    execute "CREATE INDEX organizations_kind_index ON organizations (kind);"
    execute "CREATE INDEX organizations_kind_index_tpo ON organizations (kind text_pattern_ops);"
    execute "CREATE INDEX organizations_tags_index ON organizations (tags);"
    execute "CREATE INDEX organizations_gs1_digital_link_index ON organizations (gs1_digital_link);"
    execute "CREATE INDEX organizations_gs1_country_code_index ON organizations (gs1_country_code);"
    execute "CREATE INDEX organizations_gs1_global_location_number_index ON organizations (gs1_global_location_number);"
    execute "CREATE INDEX organizations_isic_v4_code_index ON organizations (isic_v4_code);"
  end

  def down do
    execute "DROP TRIGGER IF EXISTS trigger_organizations_updated_at;"
    execute "DROP INDEX IF EXISTS organizations_created_at_index;"
    execute "DROP INDEX IF EXISTS organizations_updated_at_index;"
    execute "DROP INDEX IF EXISTS organizations_deleted_at_index;"
    execute "DROP INDEX IF EXISTS organizations_locale_code_index;"
    execute "DROP INDEX IF EXISTS organizations_sign_index;"
    execute "DROP INDEX IF EXISTS organizations_sign_index_tpo;"
    execute "DROP INDEX IF EXISTS organizations_kind_index;"
    execute "DROP INDEX IF EXISTS organizations_kind_index_tpo;"
    execute "DROP INDEX IF EXISTS organizations_tags_index;"
    execute "DROP INDEX IF EXISTS organizations_gs1_digital_link_index;"
    execute "DROP INDEX IF EXISTS organizations_gs1_country_code_index;"
    execute "DROP INDEX IF EXISTS organizations_gs1_global_location_number_index;"
    execute "DROP INDEX IF EXISTS organizations_isic_v4_code_index;"
    execute "DROP TABLE IF EXISTS organizations;"
  end

end
