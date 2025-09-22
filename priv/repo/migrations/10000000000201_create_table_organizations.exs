defmodule Navatrack.Repo.Migrations.CreateTableOrganizations do
  @moduledoc """
  Create table organizations.
  """

  use Ecto.Migration

  def up do
    execute """
    CREATE TABLE IF NOT EXISTS organizations (
      id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
      created_at TIMESTAMP(6) WITH TIME ZONE DEFAULT (now() AT TIME ZONE 'utc'),
      updated_at TIMESTAMP(6) WITH TIME ZONE DEFAULT (now() AT TIME ZONE 'utc'),
      deleted_at TIMESTAMP(6) WITH TIME ZONE,
      sign char,
      title text,
      status text,
      tags text[],
      url text,
      email text CONSTRAINT check_email CHECK (email ~* '.@.'),
      phone text,
      messaging text,
      postal text,
      orcid_pid text,
      rdf_type text,
      linkedin_url text CONSTRAINT check_linkedin_url CHECK (linkedin_url ~* '^https://linkedin\.com/'),
      github_url text CONSTRAINT check_github_url CHECK (github_url ~* '^https://github\.com/'),
      codeberg_url text CONSTRAINT check_codeberg_url CHECK (codeberg_url ~* '^https://codeberg\.org/'),
      location_iso_3166_1_alpha_2 char(2) CONSTRAINT check_location_iso_3166_1_alpha_2 CHECK (location_iso_3166_1_alpha_2 ~* '^[a-z][a-z]$'),
      location_iso_3166_2 text,
      location_postal_code text,
      location_latitude_as_decimal_degrees decimal(9, 7) CONSTRAINT check_location_latitude_as_decimal_degrees CHECK (location_latitude_as_decimal_degrees BETWEEN -90.0 AND 90.0),
      location_longitude_as_decimal_degrees decimal(10, 7) CONSTRAINT check_location_longitude_as_decimal_degrees CHECK (location_longitude_as_decimal_degrees BETWEEN -180.0 AND 180.0),
      agents_as_url text CONSTRAINT check_agents_as_url CHECK (agents_as_url ~* '^https://'),
      agents_as_markdown text,
      note text,
      daisyui_timeline_html text,
      org_mode text,
      task_list_as_markdown text,
      ways_of_working_as_markdown text,
      objectives_and_key_results_as_markdown text,
      key_performance_indicators_as_markdown text,
      avatar_image_400x400_url text CONSTRAINT check_avatar_image_400x400_url CHECK (avatar_image_400x400_url ~* '^https://'),
      avatar_image_400x400_alt text,
      main_image_1080x1080_url text CONSTRAINT check_main_image_1080x1080_url CHECK (main_image_1080x1080_url ~* '^https://'),
      main_image_1080x1080_alt text,
      main_image_1920x1080_url text CONSTRAINT check_main_image_1920x1080_url CHECK (main_image_1920x1080_url ~* '^https://'),
      main_image_1920x1080_alt text,
      main_image_1080x1920_url text CONSTRAINT check_main_image_1080x1920_url CHECK (main_image_1080x1920_url ~* '^https://'),
      main_image_1080x1920_alt text,
      gs1_digital_link text,
      gs1_country_code text,
      gs1_global_location_number text,
      international_standard_industrial_classification_v4_code text,
      international_standard_industrial_classification_v4_name text,
      copyright_policy_as_url text CONSTRAINT check_copyright_policy_as_url CHECK (copyright_policy_as_url ~* '^https://'),
      copyright_policy_as_markdown text,
      corrections_policy_as_url text CONSTRAINT check_corrections_policy_as_url CHECK (corrections_policy_as_url ~* '^https://'),
      corrections_policy_as_markdown text,
      legal_policy_as_url text CONSTRAINT check_legal_policy_as_url CHECK (legal_policy_as_url ~* '^https://'),
      legal_policy_as_markdown text,
      ethics_policy_as_url text CONSTRAINT check_ethics_policy_as_url CHECK (ethics_policy_as_url ~* '^https://'),
      ethics_policy_as_markdown text,
      privacy_policy_as_url text CONSTRAINT check_privacy_policy_as_url CHECK (privacy_policy_as_url ~* '^https://'),
      privacy_policy_as_markdown text,
      security_policy_as_url text CONSTRAINT check_security_policy_as_url CHECK (security_policy_as_url ~* '^https://'),
      security_policy_as_markdown text,
      coordinated_disclosure_policy_as_url text CONSTRAINT check_coordinated_disclosure_policy_as_url CHECK (coordinated_disclosure_policy_as_url ~* '^https://'),
      coordinated_disclosure_policy_as_markdown text,
      open_source_policy_as_url text CONSTRAINT check_open_source_policy_as_url CHECK (open_source_policy_as_url ~* '^https://'),
      open_source_policy_as_markdown text,
      code_of_conduct_policy_as_url text CONSTRAINT check_code_of_conduct_policy_as_url CHECK (code_of_conduct_policy_as_url ~* '^https://'),
      code_of_conduct_policy_as_markdown text,
      equal_opportunity_policy_as_url text CONSTRAINT check_equal_opportunity_policy_as_url CHECK (equal_opportunity_policy_as_url ~* '^https://'),
      equal_opportunity_policy_as_markdown text,
      social_network_policy_as_url text CONSTRAINT check_social_network_policy_as_url CHECK (social_network_policy_as_url ~* '^https://'),
      social_network_policy_as_markdown text,
      health_and_safety_policy_as_url text CONSTRAINT check_health_and_safety_policy_as_url CHECK (health_and_safety_policy_as_url ~* '^https://'),
      health_and_safety_policy_as_markdown text,
      employee_handbook_policy_as_url text CONSTRAINT check_employee_handbook_policy_as_url CHECK (employee_handbook_policy_as_url ~* '^https://'),
      employee_handbook_policy_as_markdown text,
      human_resources_policy_as_url text CONSTRAINT check_human_resources_policy_as_url CHECK (human_resources_policy_as_url ~* '^https://'),
      human_resources_policy_as_markdown text
    );
    """
    execute """
    CREATE TRIGGER trigger_organizations_updated_at
      BEFORE UPDATE ON organizations
      FOR EACH ROW
      EXECUTE FUNCTION trigger_updated_at();
    """
    execute """
    CREATE INDEX index_organizations_created_at ON organizations (created_at);
    """
    execute """
    CREATE INDEX index_organizations_updated_at ON organizations (updated_at);
    """
    execute """
    CREATE INDEX index_organizations_deleted_at ON organizations (deleted_at);
    """
    execute """
    CREATE INDEX index_organizations_sign ON organizations (sign);
    """
    execute """
    CREATE INDEX index_organizations_tags ON organizations (tags);
    """
    execute """
    CREATE INDEX index_organizations_gs1_digital_link ON organizations (gs1_digital_link);
    """
    execute """
    CREATE INDEX index_organizations_gs1_country_code ON organizations (gs1_country_code);
    """
    execute """
    CREATE INDEX index_organizations_gs1_global_location_number ON organizations (gs1_global_location_number);
    """
    execute """
    CREATE INDEX index_organizations_international_standard_industrial_classification_v4_code ON organizations (international_standard_industrial_classification_v4_code);
    """
  end

  def down do
    execute """
    DROP TRIGGER IF EXISTS trigger_organizations_updated_at;
    """
    execute """
    DROP INDEX IF EXISTS index_organizations_created_at;
    """
    execute """
    DROP INDEX IF EXISTS index_organizations_updated_at;
    """
    execute """
    DROP INDEX IF EXISTS index_organizations_deleted_at;
    """
    execute """
    DROP INDEX IF EXISTS index_organizations_sign;
    """
    execute """
    DROP INDEX IF EXISTS index_organizations_tags;
    """
    execute """
    DROP INDEX IF EXISTS index_organizations_gs1_digital_link;
    """
    execute """
    DROP INDEX IF EXISTS index_organizations_gs1_country_code;
    """
    execute """
    DROP INDEX IF EXISTS index_organizations_gs1_global_location_number;
    """
    execute """
    DROP INDEX IF EXISTS index_organizations_international_standard_industrial_classification_v4_code;
    """
    execute """
    DROP TABLE IF EXISTS organizations;
    """
  end

end
