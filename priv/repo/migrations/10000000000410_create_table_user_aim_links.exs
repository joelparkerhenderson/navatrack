defmodule Navatrack.Repo.Migrations.CreateTableUserAimLinks do
  @moduledoc """
  Create table user_aim_links
  """

  use Ecto.Migration

  def up do
    execute """
    CREATE TABLE user_aim_links (
      id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
      created_at TIMESTAMP(6) WITH TIME ZONE DEFAULT (now() AT TIME ZONE 'utc'),
      updated_at TIMESTAMP(6) WITH TIME ZONE DEFAULT (now() AT TIME ZONE 'utc'),
      retired_at TIMESTAMP(6) WITH TIME ZONE,
      locale_code text,
      user_id uuid REFERENCES users(id) ON DELETE SET NULL,
      aim_id uuid REFERENCES aims(id) ON DELETE SET NULL,
      status text,
      tagging text
    );
    """
    execute """
    CREATE TRIGGER trigger_user_aim_links_updated_at
      BEFORE UPDATE ON user_aim_links
      FOR EACH ROW EXECUTE FUNCTION
      trigger_updated_at();
    """
    execute "CREATE INDEX user_aim_links_created_at_index ON user_aim_links (created_at);"
    execute "CREATE INDEX user_aim_links_updated_at_index ON user_aim_links (updated_at);"
    execute "CREATE INDEX user_aim_links_retired_at_index ON user_aim_links (retired_at);"
    execute "CREATE INDEX user_aim_links_locale_code_index ON user_aim_links (locale_code);"
    execute "CREATE INDEX user_aim_links_user_id_index ON user_aim_links (user_id);"
    execute "CREATE INDEX user_aim_links_aim_id_index ON user_aim_links (aim_id);"
  end

  def down do
    execute "DROP TRIGGER IF EXISTS trigger_user_aim_links_updated_at;"
    execute "DROP INDEX IF EXISTS user_aim_links_locale_code_index;"
    execute "DROP INDEX IF EXISTS user_aim_links_created_at_index;"
    execute "DROP INDEX IF EXISTS user_aim_links_updated_at_index;"
    execute "DROP INDEX IF EXISTS user_aim_links_retired_at_index;"
    execute "DROP INDEX IF EXISTS user_aim_links_user_id_index;"
    execute "DROP INDEX IF EXISTS user_aim_links_aim_id_index"
    execute "DROP TABLE IF EXISTS user_aim_links;"
  end
end
