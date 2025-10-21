defmodule Navatrack.Repo.Migrations.CreateTableAccessAttributes do
  @moduledoc """
  Create table access_attributes.
  """

  use Ecto.Migration

  def up do
    execute """
    CREATE TABLE access_attributes (
      id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
      created_at TIMESTAMP(6) WITH TIME ZONE DEFAULT (now() AT TIME ZONE 'utc'),
      updated_at TIMESTAMP(6) WITH TIME ZONE DEFAULT (now() AT TIME ZONE 'utc'),
      deleted_at TIMESTAMP(6) WITH TIME ZONE,
      locale_code text,
      parent_id uuid CONSTRAINT parent_id_fk REFERENCES access_attributes (id),
      parent_order int CONSTRAINT parent_order_check CHECK (parent_order >= 0),
      --- card
      name text,
      sign text CONSTRAINT sign_check CHECK (LENGTH(sign) = 1),
      status text,
      tagging text,
      note text
    );
    """

    execute """
    CREATE TRIGGER trigger_access_attributes_updated_at
      BEFORE UPDATE ON access_attributes
      FOR EACH ROW EXECUTE FUNCTION
      trigger_updated_at();
    """

    execute """
    CREATE INDEX access_attributes_index_gto
      ON access_attributes USING GIN ((
        sign
          || ' ' ||
        name
          || ' ' ||
        status
          || ' ' ||
        tagging
          || ' ' ||
        note
      ) gin_trgm_ops);
    """
    execute "CREATE INDEX access_attributes_created_at_index ON access_attributes (created_at);"
    execute "CREATE INDEX access_attributes_updated_at_index ON access_attributes (updated_at);"
    execute "CREATE INDEX access_attributes_deleted_at_index ON access_attributes (deleted_at);"
    execute "CREATE INDEX access_attributes_locale_code_index ON access_attributes (locale_code);"
    execute "CREATE INDEX access_attributes_name_index ON access_attributes (name);"
    execute "CREATE INDEX access_attributes_name_index_tpo ON access_attributes (name text_pattern_ops);"
    execute "CREATE INDEX access_attributes_tagging_index ON access_attributes (tagging);"
    execute "CREATE INDEX access_attributes_tagging_index_tpo ON access_attributes (tagging text_pattern_ops);"
  end

  def down do
    execute "DROP CONSTRAINT IF EXISTS parent_id_fk;"
    execute "DROP CONSTRAINT IF EXISTS parent_order_check;"
    execute "DROP CONSTRAINT IF EXISTS sign_check;"
    execute "DROP TRIGGER IF EXISTS trigger_access_attributes_updated_at;"
    execute "DROP INDEX IF EXISTS access_attributes_index_gto;"
    execute "DROP INDEX IF EXISTS access_attributes_created_at_index;"
    execute "DROP INDEX IF EXISTS access_attributes_updated_at_index;"
    execute "DROP INDEX IF EXISTS access_attributes_deleted_at_index;"
    execute "DROP INDEX IF EXISTS access_attributes_locale_code_index;"
    execute "DROP INDEX IF EXISTS access_attributes_name_index;"
    execute "DROP INDEX IF EXISTS access_attributes_name_index_tpo;"
    execute "DROP INDEX IF EXISTS access_attributes_tagging_index;"
    execute "DROP INDEX IF EXISTS access_attributes_tagging_index_tpo;"
    execute "DROP TABLE IF EXISTS access_attributes;"
  end
end
