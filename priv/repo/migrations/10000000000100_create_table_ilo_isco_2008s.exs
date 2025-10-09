defmodule Navatrack.Repo.Migrations.CreateTableIloIsco2008s do
  @moduledoc """
  Create table ilo_isco_2008s.
  """

  use Ecto.Migration

  def up do
    execute """
    CREATE TABLE ilo_isco_2008s (
      id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
      locale_code text not null,
      code text not null CONSTRAINT code_check CHECK (code ~* '^[0-9]*$' AND char_length(code) <= 4),
      name text not null,
      definition_as_markdown text not null
    );
    """

    execute """
    CREATE INDEX ilo_isco_2008s_index_gto
      ON ilo_isco_2008s
      USING GIN ((
        code
          || ' ' ||
        name
          || ' ' ||
        definition_as_markdown
      ) gin_trgm_ops);
    """
    execute "CREATE INDEX ilo_isco_2008s_locale_code_index ON ilo_isco_2008s (locale_code);"
    execute "CREATE INDEX ilo_isco_2008s_code_index ON ilo_isco_2008s (code);"
    execute "CREATE INDEX ilo_isco_2008s_code_index_tpo ON ilo_isco_2008s (code text_pattern_ops);"
    execute "CREATE INDEX ilo_isco_2008s_name_index ON ilo_isco_2008s (name);"
    execute "CREATE INDEX ilo_isco_2008s_name_index_tpo ON ilo_isco_2008s (name text_pattern_ops);"
  end

  def down do
    execute "DROP INDEX IF EXISTS ilo_isco_2008s_index_gto;"
    execute "DROP INDEX IF EXISTS ilo_isco_2008s_locale_code_index;"
    execute "DROP INDEX IF EXISTS ilo_isco_2008s_code_index;"
    execute "DROP INDEX IF EXISTS ilo_isco_2008s_code_index_tpo;"
    execute "DROP INDEX IF EXISTS ilo_isco_2008s_name_index;"
    execute "DROP INDEX IF EXISTS ilo_isco_2008s_name_index_tpo;"
    execute "DROP TABLE IF EXISTS ilo_isco_2008s;"
  end
end
