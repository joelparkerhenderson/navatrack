defmodule Navatrack.Repo.Migrations.CreateTablePermissions do
  @moduledoc """
  Create table access_permissions.
  """

  use Ecto.Migration

  def up do
    execute """
    CREATE TABLE access_permissions (
      id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
      created_at TIMESTAMP(6) WITH TIME ZONE DEFAULT (now() AT TIME ZONE 'utc'),
      updated_at TIMESTAMP(6) WITH TIME ZONE DEFAULT (now() AT TIME ZONE 'utc'),
      deleted_at TIMESTAMP(6) WITH TIME ZONE,
      locale_code text,
      parent_id uuid CONSTRAINT parent_id_fk REFERENCES access_permissions (id),
      parent_order int CONSTRAINT parent_order_check CHECK (parent_order >= 0),
      --- link
      access_attribute_id uuid NOT NULL CONSTRAINT access_attribute_id_fk REFERENCES access_attributes (id),
      access_operation_id uuid NOT NULL CONSTRAINT access_operation_id_fk REFERENCES access_operations (id)
    );
    """

    execute """
    CREATE TRIGGER trigger_access_permissions_updated_at
      BEFORE UPDATE ON access_permissions
      FOR EACH ROW EXECUTE FUNCTION
      trigger_updated_at();
    """

    execute "CREATE INDEX access_permissions_created_at_index ON access_permissions (created_at);"
    execute "CREATE INDEX access_permissions_updated_at_index ON access_permissions (updated_at);"
    execute "CREATE INDEX access_permissions_deleted_at_index ON access_permissions (deleted_at);"
    execute "CREATE INDEX access_permissions_locale_code_index ON access_permissions (locale_code);"
    execute "CREATE INDEX access_permissions_access_attribute_id_index ON access_permissions (access_attribute_id);"
    execute "CREATE INDEX access_permissions_access_operation_id_index ON access_permissions (access_operation_id);"
  end

  def down do
    execute "DROP CONSTRAINT IF EXISTS parent_id_fk;"
    execute "DROP CONSTRAINT IF EXISTS parent_order_check;"
    execute "DROP CONSTRAINT IF EXISTS access_attribute_id_fk;"
    execute "DROP CONSTRAINT IF EXISTS access_operation_id_fk;"
    execute "DROP TRIGGER IF EXISTS trigger_access_permissions_updated_at;"
    execute "DROP INDEX IF EXISTS access_permissions_index_gto;"
    execute "DROP INDEX IF EXISTS access_permissions_created_at_index;"
    execute "DROP INDEX IF EXISTS access_permissions_updated_at_index;"
    execute "DROP INDEX IF EXISTS access_permissions_deleted_at_index;"
    execute "DROP INDEX IF EXISTS access_permissions_locale_code_index;"
    execute "DROP INDEX IF EXISTS access_permissions_access_attribute_id_index;"
    execute "DROP INDEX IF EXISTS access_permissions_access_operation_id_index;"
    execute "DROP TABLE IF EXISTS access_permissions;"
  end
end
