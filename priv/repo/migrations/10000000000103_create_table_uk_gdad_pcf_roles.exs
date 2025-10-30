defmodule Navatrack.Repo.Migrations.CreateUkGdadPcfRole do
  @moduledoc """
  Create table uk_gdad_pcf_roles.
  """

  use Ecto.Migration

  def up do
    execute """
    CREATE TABLE uk_gdad_pcf_roles (
      id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
      locale_code text not null,
      uk_gdad_pcf_role_family_id uuid not null REFERENCES uk_gdad_pcf_role_families(id) ON DELETE SET NULL,
      name text not null,
      url text not null CONSTRAINT uk_gdad_pcf_roles_url_check CHECK (url ~* '^https://'),
      description_as_markdown text not null,
      senior_civil_service_flag boolean not null
    )
    """

    execute """
    CREATE INDEX uk_gdad_pcf_roles_index_gto
      ON uk_gdad_pcf_roles
      USING GIN ((
        locale_code
          || ' ' ||
        name
          || ' ' ||
        description_as_markdown
      ) gin_trgm_ops);
    """
    execute "CREATE INDEX uk_gdad_pcf_roles_locale_code_index ON uk_gdad_pcf_roles (locale_code);"
    execute "CREATE INDEX uk_gdad_pcf_roles_uk_gdad_pcf_role_family_id_index ON uk_gdad_pcf_roles (uk_gdad_pcf_role_family_id);"
    execute "CREATE INDEX uk_gdad_pcf_roles_name_index ON uk_gdad_pcf_roles (name);"
    execute "CREATE INDEX uk_gdad_pcf_roles_name_index_tpo ON uk_gdad_pcf_roles (name text_pattern_ops);"
  end

  def down do
    execute "DROP CONSTRAINT IF EXISTS uk_gdad_pcf_roles_url_check;"
    execute "DROP INDEX IF EXISTS uk_gdad_pcf_roles_index_gto;"
    execute "DROP INDEX IF EXISTS uk_gdad_pcf_roles_locale_code_index;"
    execute "DROP INDEX IF EXISTS uk_gdad_pcf_roles_uk_gdad_pcf_role_family_id_index;"
    execute "DROP INDEX IF EXISTS uk_gdad_pcf_roles_name_index;"
    execute "DROP INDEX IF EXISTS uk_gdad_pcf_roles_name_index_tpo;"
    execute "DROP TABLE IF EXISTS uk_gdad_pcf_roles;"
  end
end
