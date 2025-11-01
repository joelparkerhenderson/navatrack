defmodule Navatrack.Repo.Migrations.CreateMeasurementUnits do
  @moduledoc """
  Create table measurement_units.
  """

  use Ecto.Migration

  def up do
    execute """
    CREATE TABLE measurement_units (
      id text PRIMARY KEY,
      locale_code text,
      name text not null,
      name_phonetic text,
      category text,
      synonyms text,
      loinc_property text,
      guidance text,
      measurement_system_id uuid CONSTRAINT measurement_units_measurement_system_id_fk REFERENCES measurement_systems (id)
      )
    """

    execute """
    CREATE INDEX measurement_units_index_gto
      ON measurement_units
      USING GIN ((
        id
          || ' ' ||
        locale_code
          || ' ' ||
        name
          || ' ' ||
        name_phonetic
          || ' ' ||
        category
          || ' ' ||
        synonyms
          || ' ' ||
        loinc_property
          || ' ' ||
        guidance
      ) gin_trgm_ops);
    """
    execute "CREATE INDEX measurement_units_locale_code_index ON measurement_units (locale_code);"
    execute "CREATE INDEX measurement_units_name_index ON measurement_units (name);"
    execute "CREATE INDEX measurement_units_name_index_tpo ON measurement_units (name text_pattern_ops);"
    execute "CREATE INDEX measurement_units_category_index ON measurement_units (category);"
    execute "CREATE INDEX measurement_units_loinc_property_index ON measurement_units (loinc_property);"
  end

  def down do
    execute "DROP INDEX IF EXISTS measurement_units_index_gto"
    execute "DROP INDEX IF EXISTS measurement_units_locale_code_index;"
    execute "DROP INDEX IF EXISTS measurement_units_name_index;"
    execute "DROP INDEX IF EXISTS measurement_units_name_index_tpo"
    execute "DROP INDEX IF EXISTS measurement_units_category_index"
    execute "DROP INDEX IF EXISTS measurement_units_loinc_property_index"
    execute "DROP TABLE IF EXISTS measurement_units;"
  end
end
