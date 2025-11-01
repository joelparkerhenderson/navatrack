defmodule Navatrack.Repo.Migrations.CreateMeasurementSystems do
  @moduledoc """
  Create table measurement_systems.
  """

  use Ecto.Migration

  def up do
    execute """
    CREATE TABLE measurement_systems (
      id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
      locale_code text,
      name text not null,
      name_phonetic text,
      name_abbreviation text,
      name_abbreviation_phonetic text
      )
    """

    execute """
    CREATE INDEX measurement_systems_index_gto
      ON measurement_systems
      USING GIN ((
        id
          || ' ' ||
        locale_code
          || ' ' ||
        name
          || ' ' ||
        name_phonetic
          || ' ' ||
        name_abbreviation
      ) gin_trgm_ops);
    """
    execute "CREATE INDEX measurement_systems_locale_code_index ON measurement_systems (locale_code);"
    execute "CREATE INDEX measurement_systems_name_index ON measurement_systems (name);"
    execute "CREATE INDEX measurement_systems_name_index_tpo ON measurement_systems (name text_pattern_ops);"
    execute "CREATE INDEX measurement_systems_name_abbreviation_index ON measurement_systems (name);"
  end

  def down do
    execute "DROP INDEX IF EXISTS measurement_systems_index_gto"
    execute "DROP INDEX IF EXISTS measurement_systems_locale_code_index;"
    execute "DROP INDEX IF EXISTS measurement_systems_name_index;"
    execute "DROP INDEX IF EXISTS measurement_systems_name_index_tpo"
    execute "DROP INDEX IF EXISTS measurement_systems_name_abbreviation_index;"
    execute "DROP TABLE IF EXISTS measurement_systems;"
  end
end
