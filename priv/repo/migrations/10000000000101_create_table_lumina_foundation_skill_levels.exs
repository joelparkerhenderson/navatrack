defmodule Navatrack.Repo.Migrations.CreateTableLuminaFoundationSkillLevels do
  @moduledoc """
  Create table lumina_foundation_skill_levels.
  """

  use Ecto.Migration

  def up do
    execute """
    CREATE TABLE lumina_foundation_skill_levels (
      id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
      locale_code text not null,
      number smallint not null CONSTRAINT number_check CHECK (number BETWEEN 1 AND 8),
      name text not null,
      description text not null
    );
    """
    execute """
    CREATE INDEX lumina_foundation_skill_levels_name_index_gto
      ON lumina_foundation_skill_levels
      USING GIN ((
        number
          || ' ' ||
        name
          || ' ' ||
        description
      ) gin_trgm_ops);
    """
    execute "CREATE INDEX lumina_foundation_skill_levels_locale_code_index ON lumina_foundation_skill_levels (locale_code);"
    execute "CREATE INDEX lumina_foundation_skill_levels_number_index ON lumina_foundation_skill_levels (number);"
    execute "CREATE INDEX lumina_foundation_skill_levels_name_index ON lumina_foundation_skill_levels (name);"
    execute "CREATE INDEX lumina_foundation_skill_levels_name_index_tpo ON lumina_foundation_skill_levels (name text_pattern_ops);"
  end

  def down do
    execute "DROP INDEX IF EXISTS lumina_foundation_skill_levels_index_gto;"
    execute "DROP INDEX IF EXISTS lumina_foundation_skill_levels_locale_code_index;"
    execute "DROP INDEX IF EXISTS lumina_foundation_skill_levels_number_index;"
    execute "DROP INDEX IF EXISTS lumina_foundation_skill_levels_name_index;"
    execute "DROP INDEX IF EXISTS lumina_foundation_skill_levels_name_index_tpo;"
    execute "DROP TABLE IF EXISTS lumina_foundation_skill_levels;"
  end

end
