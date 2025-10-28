defmodule Navatrack.Repo.Migrations.CreateTableMessages do
  @moduledoc """
  Create table messages.
  """

  use Ecto.Migration

  def up do
    execute """
    CREATE TABLE messages (
      --- meta
      id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
      created_at TIMESTAMP(6) WITH TIME ZONE DEFAULT (now() AT TIME ZONE 'utc'),
      updated_at TIMESTAMP(6) WITH TIME ZONE DEFAULT (now() AT TIME ZONE 'utc'),
      deleted_at TIMESTAMP(6) WITH TIME ZONE,
      locale_code text,
      parent_id uuid CONSTRAINT messages_parent_id_fk REFERENCES messages (id),
      parent_order int CONSTRAINT messages_parent_order_check CHECK (parent_order >= 0),
      --- card
      name text,
      sign text CONSTRAINT messages_sign_check CHECK (LENGTH(sign) = 1),
      status text,
      tagging text,
      note text,
      -- links
      from_user_id uuid CONSTRAINT messages_from_user_id_fk REFERENCES users (id),
      to_user_id uuid CONSTRAINT messages_to_user_id_fk REFERENCES users (id)
    );
    """

    execute """
    CREATE TRIGGER trigger_messages_updated_at
      BEFORE UPDATE ON messages
      FOR EACH ROW EXECUTE FUNCTION
      trigger_updated_at();
    """

    execute """
    CREATE INDEX messages_index_gto
      ON messages
      USING GIN ((
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
    execute "CREATE INDEX messages_created_at_index ON messages (created_at);"
    execute "CREATE INDEX messages_updated_at_index ON messages (updated_at);"
    execute "CREATE INDEX messages_deleted_at_index ON messages (deleted_at);"
    execute "CREATE INDEX messages_locale_code_index ON messages (locale_code);"
    execute "CREATE INDEX messages_name_index ON messages (name);"
    execute "CREATE INDEX messages_name_index_tpo ON messages (name text_pattern_ops);"
    execute "CREATE INDEX messages_tagging_index ON messages (tagging);"
    execute "CREATE INDEX messages_tagging_index_tpo ON messages (tagging text_pattern_ops);"
  end

  def down do
    execute "DROP CONSTRAINT IF EXISTS messages_parent_id_fk;"
    execute "DROP CONSTRAINT IF EXISTS messages_parent_order_check;"
    execute "DROP CONSTRAINT IF EXISTS messages_from_user_id_fk;"
    execute "DROP CONSTRAINT IF EXISTS messages_to_user_id_fk;"
    execute "DROP TRIGGER IF EXISTS trigger_messages_updated_at;"
    execute "DROP INDEX IF EXISTS messages_index_gto;"
    execute "DROP INDEX IF EXISTS messages_created_at_index;"
    execute "DROP INDEX IF EXISTS messages_updated_at_index;"
    execute "DROP INDEX IF EXISTS messages_deleted_at_index;"
    execute "DROP INDEX IF EXISTS messages_locale_code_index;"
    execute "DROP INDEX IF EXISTS messages_name_index;"
    execute "DROP INDEX IF EXISTS messages_name_index_tpo;"
    execute "DROP INDEX IF EXISTS messages_tagging_index;"
    execute "DROP INDEX IF EXISTS messages_tagging_index_tpo;"
    execute "DROP TABLE IF EXISTS messages;"
  end
end
