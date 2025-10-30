defmodule Navatrack.Repo.Migrations.CreateUkGdadPcfRoleLevel do
  @moduledoc """
  Create table uk_gdad_pcf_role_levels.
  """

  use Ecto.Migration

  def up do
    execute """
    CREATE TABLE uk_gdad_pcf_role_levels (
      id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
      locale_code text not null,
      uk_gdad_pcf_role_id uuid not null REFERENCES uk_gdad_pcf_roles(id) ON DELETE SET NULL,
      uk_gdad_pcf_role_order integer not null,
      name text not null,
      description_as_markdown text not null
    )
    """

    execute """
    CREATE INDEX uk_gdad_pcf_role_levels_index_gto
      ON uk_gdad_pcf_role_levels
      USING GIN ((
        locale_code
          || ' ' ||
        name
          || ' ' ||
        description_as_markdown
      ) gin_trgm_ops);
    """
    execute "CREATE INDEX uk_gdad_pcf_role_levels_locale_code_index ON uk_gdad_pcf_role_levels (locale_code);"
    execute "CREATE INDEX uk_gdad_pcf_role_id_index ON uk_gdad_pcf_roles (id);"
    execute "CREATE INDEX uk_gdad_pcf_role_levels_name_index ON uk_gdad_pcf_role_levels (name);"
    execute "CREATE INDEX uk_gdad_pcf_role_levels_name_index_tpo ON uk_gdad_pcf_role_levels (name text_pattern_ops);"
  end

  def down do
    execute "DROP INDEX IF EXISTS uk_gdad_pcf_role_levels_index_gto;"
    execute "DROP INDEX IF EXISTS uk_gdad_pcf_role_levels_locale_code_index;"
    execute "DROP INDEX IF EXISTS uk_gdad_pcf_role_id_index;"
    execute "DROP INDEX IF EXISTS uk_gdad_pcf_role_levels_name_index;"
    execute "DROP INDEX IF EXISTS uk_gdad_pcf_role_levels_name_index_tpo;"
    execute "DROP TABLE IF EXISTS uk_gdad_pcf_role_levels;"
  end
end
