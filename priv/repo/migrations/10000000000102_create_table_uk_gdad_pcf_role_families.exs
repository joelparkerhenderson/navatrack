defmodule Navatrack.Repo.Migrations.CreateUkGdadPcfRoleFamily do
  @moduledoc """
  Create table uk_gdad_pcf_role_levels.
  """

  use Ecto.Migration

  def up do
    execute """
    CREATE TABLE uk_gdad_pcf_role_families (
      id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
      locale_code text not null,
      name text not null
    )
    """

    execute """
    CREATE INDEX uk_gdad_pcf_role_families_index_gto
      ON uk_gdad_pcf_role_families
      USING GIN ((
        locale_code
          || ' ' ||
        name
      ) gin_trgm_ops);
    """
    execute "CREATE INDEX uk_gdad_pcf_role_families_locale_code_index ON uk_gdad_pcf_role_families (locale_code);"
    execute "CREATE INDEX uk_gdad_pcf_role_families_name_index ON uk_gdad_pcf_role_families (name);"
    execute "CREATE INDEX uk_gdad_pcf_role_families_name_index_tpo ON uk_gdad_pcf_role_families (name text_pattern_ops);"
  end

  def down do
    execute "DROP INDEX IF EXISTS uk_gdad_pcf_role_families_index_gto;"
    execute "DROP INDEX IF EXISTS uk_gdad_pcf_role_families_locale_code_index;"
    execute "DROP INDEX IF EXISTS uk_gdad_pcf_role_families_name_index;"
    execute "DROP INDEX IF EXISTS uk_gdad_pcf_role_families_name_index_tpo;"
    execute "DROP TABLE IF EXISTS uk_gdad_pcf_role_families;"
  end
end
