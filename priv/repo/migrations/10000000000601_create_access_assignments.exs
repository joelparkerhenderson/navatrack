defmodule Navatrack.Repo.Migrations.CreateTableAssignments do
  @moduledoc """
  Create table access_assignments.
  """

  use Ecto.Migration

  def up do
    execute """
    CREATE TABLE access_assignments (
      id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
      created_at TIMESTAMP(6) WITH TIME ZONE DEFAULT (now() AT TIME ZONE 'utc'),
      updated_at TIMESTAMP(6) WITH TIME ZONE DEFAULT (now() AT TIME ZONE 'utc'),
      deleted_at TIMESTAMP(6) WITH TIME ZONE,
      locale_code text,
      parent_id uuid CONSTRAINT parent_id_fk REFERENCES access_assignments (id),
      parent_order int CONSTRAINT parent_order_check CHECK (parent_order >= 0),
      --- link
      user_id uuid NOT NULL CONSTRAINT user_id_fk REFERENCES users (id),
      access_attribute_id uuid NOT NULL CONSTRAINT access_attribute_id_fk REFERENCES access_attributes (id)
    );
    """

    execute """
    CREATE TRIGGER trigger_access_assignments_updated_at
      BEFORE UPDATE ON access_assignments
      FOR EACH ROW EXECUTE FUNCTION
      trigger_updated_at();
    """

    execute "CREATE INDEX access_assignments_created_at_index ON access_assignments (created_at);"
    execute "CREATE INDEX access_assignments_updated_at_index ON access_assignments (updated_at);"
    execute "CREATE INDEX access_assignments_deleted_at_index ON access_assignments (deleted_at);"
    execute "CREATE INDEX access_assignments_locale_code_index ON access_assignments (locale_code);"
    execute "CREATE INDEX access_assignments_user_id_index ON access_assignments (user_id);"
    execute "CREATE INDEX access_assignments_access_attribute_id_index ON access_assignments (access_attribute_id);"
  end

  def down do
    execute "DROP CONSTRAINT IF EXISTS parent_id_fk;"
    execute "DROP CONSTRAINT IF EXISTS parent_order_check;"
    execute "DROP CONSTRAINT IF EXISTS user_id_fk;"
    execute "DROP CONSTRAINT IF EXISTS access_attribute_id_fk;"
    execute "DROP TRIGGER IF EXISTS trigger_access_assignments_updated_at;"
    execute "DROP INDEX IF EXISTS access_assignments_index_gto;"
    execute "DROP INDEX IF EXISTS access_assignments_created_at_index;"
    execute "DROP INDEX IF EXISTS access_assignments_updated_at_index;"
    execute "DROP INDEX IF EXISTS access_assignments_deleted_at_index;"
    execute "DROP INDEX IF EXISTS access_assignments_locale_code_index;"
    execute "DROP INDEX IF EXISTS access_assignments_user_id_index;"
    execute "DROP INDEX IF EXISTS access_assignments_access_attribute_id_index;"
    execute "DROP TABLE IF EXISTS access_assignments;"
  end
end
