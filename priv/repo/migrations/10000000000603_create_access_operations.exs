defmodule Navatrack.Repo.Migrations.CreateTableAccessOperations do
  @moduledoc """
  Create table access_operations.
  """

  use Ecto.Migration

  def up do
    execute """
    CREATE TABLE access_operations (
      id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
      created_at TIMESTAMP(6) WITH TIME ZONE DEFAULT (now() AT TIME ZONE 'utc'),
      updated_at TIMESTAMP(6) WITH TIME ZONE DEFAULT (now() AT TIME ZONE 'utc'),
      deleted_at TIMESTAMP(6) WITH TIME ZONE,
      locale_code text,
      parent_id uuid CONSTRAINT access_operations_parent_id_fk REFERENCES access_operations (id),
      parent_order int CONSTRAINT access_operations_parent_order_check CHECK (parent_order >= 0),
      --- card
      name text,
      sign text CONSTRAINT access_operations_sign_check CHECK (LENGTH(sign) = 1),
      status text,
      tagging text,
      note text
    );
    """

    execute """
    CREATE TRIGGER trigger_access_operations_updated_at
      BEFORE UPDATE ON access_operations
      FOR EACH ROW EXECUTE FUNCTION
      trigger_updated_at();
    """

    execute """
    CREATE INDEX access_operations_index_gto
      ON access_operations USING GIN ((
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
    execute "CREATE INDEX access_operations_created_at_index ON access_operations (created_at);"
    execute "CREATE INDEX access_operations_updated_at_index ON access_operations (updated_at);"
    execute "CREATE INDEX access_operations_deleted_at_index ON access_operations (deleted_at);"
    execute "CREATE INDEX access_operations_locale_code_index ON access_operations (locale_code);"
    execute "CREATE INDEX access_operations_name_index ON access_operations (name);"
    execute "CREATE INDEX access_operations_name_index_tpo ON access_operations (name text_pattern_ops);"
    execute "CREATE INDEX access_operations_tagging_index ON access_operations (tagging);"
    execute "CREATE INDEX access_operations_tagging_index_tpo ON access_operations (tagging text_pattern_ops);"
  end

  def down do
    execute "DROP CONSTRAINT IF EXISTS access_operations_parent_id_fk;"
    execute "DROP CONSTRAINT IF EXISTS access_operations_parent_order_check;"
    execute "DROP CONSTRAINT IF EXISTS access_operations_sign_check;"
    execute "DROP TRIGGER IF EXISTS trigger_access_operations_updated_at;"
    execute "DROP INDEX IF EXISTS access_operations_index_gto;"
    execute "DROP INDEX IF EXISTS access_operations_created_at_index;"
    execute "DROP INDEX IF EXISTS access_operations_updated_at_index;"
    execute "DROP INDEX IF EXISTS access_operations_deleted_at_index;"
    execute "DROP INDEX IF EXISTS access_operations_locale_code_index;"
    execute "DROP INDEX IF EXISTS access_operations_name_index;"
    execute "DROP INDEX IF EXISTS access_operations_name_index_tpo;"
    execute "DROP INDEX IF EXISTS access_operations_tagging_index;"
    execute "DROP INDEX IF EXISTS access_operations_tagging_index_tpo;"
    execute "DROP TABLE IF EXISTS access_operations;"
  end
end
