defmodule Navatrack.Repo.Migrations.CreateTableUserEventLinks do
  @moduledoc """
  Create table user_event_links
  """

  use Ecto.Migration

  def up do
    execute """
    CREATE TABLE user_event_links (
      id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
      created_at TIMESTAMP(6) WITH TIME ZONE DEFAULT (now() AT TIME ZONE 'utc'),
      updated_at TIMESTAMP(6) WITH TIME ZONE DEFAULT (now() AT TIME ZONE 'utc'),
      retired_at TIMESTAMP(6) WITH TIME ZONE,
      locale_code text,
      user_id uuid REFERENCES users(id) ON DELETE SET NULL,
      event_id uuid REFERENCES events(id) ON DELETE SET NULL,
      status text,
      tagging text
    );
    """
    execute """
    CREATE TRIGGER trigger_user_event_links_updated_at
      BEFORE UPDATE ON user_event_links
      FOR EACH ROW EXECUTE FUNCTION
      trigger_updated_at();
    """
    execute "CREATE INDEX user_event_links_created_at_index ON user_event_links (created_at);"
    execute "CREATE INDEX user_event_links_updated_at_index ON user_event_links (updated_at);"
    execute "CREATE INDEX user_event_links_retired_at_index ON user_event_links (retired_at);"
    execute "CREATE INDEX user_event_links_locale_code_index ON user_event_links (locale_code);"
    execute "CREATE INDEX user_event_links_user_id_index ON user_event_links (user_id);"
    execute "CREATE INDEX user_event_links_event_id_index ON user_event_links (event_id);"
  end

  def down do
    execute "DROP TRIGGER IF EXISTS trigger_user_event_links_updated_at;"
    execute "DROP INDEX IF EXISTS user_event_links_locale_code_index;"
    execute "DROP INDEX IF EXISTS user_event_links_created_at_index;"
    execute "DROP INDEX IF EXISTS user_event_links_updated_at_index;"
    execute "DROP INDEX IF EXISTS user_event_links_retired_at_index;"
    execute "DROP INDEX IF EXISTS user_event_links_user_id_index;"
    execute "DROP INDEX IF EXISTS user_event_links_event_id_index"
    execute "DROP TABLE IF EXISTS user_event_links;"
  end
end
