defmodule Navatrack.Repo.Migrations.CreateTableUserPlanLinks do
  @moduledoc """
  Create table user_plan_links
  """

  use Ecto.Migration

  def up do
    execute """
    CREATE TABLE user_plan_links (
      id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
      created_at TIMESTAMP(6) WITH TIME ZONE DEFAULT (now() AT TIME ZONE 'utc'),
      updated_at TIMESTAMP(6) WITH TIME ZONE DEFAULT (now() AT TIME ZONE 'utc'),
      deleted_at TIMESTAMP(6) WITH TIME ZONE,
      locale_code text,
      user_id uuid REFERENCES users(id) ON DELETE SET NULL,
      plan_id uuid REFERENCES plans(id) ON DELETE SET NULL,
      status text,
      tagging text
    );
    """
    execute """
    CREATE TRIGGER trigger_user_plan_links_updated_at
      BEFORE UPDATE ON user_plan_links
      FOR EACH ROW EXECUTE FUNCTION
      trigger_updated_at();
    """
    execute "CREATE INDEX user_plan_links_created_at_index ON user_plan_links (created_at);"
    execute "CREATE INDEX user_plan_links_updated_at_index ON user_plan_links (updated_at);"
    execute "CREATE INDEX user_plan_links_deleted_at_index ON user_plan_links (deleted_at);"
    execute "CREATE INDEX user_plan_links_locale_code_index ON user_plan_links (locale_code);"
    execute "CREATE INDEX user_plan_links_user_id_index ON user_plan_links (user_id);"
    execute "CREATE INDEX user_plan_links_plan_id_index ON user_plan_links (plan_id);"
  end

  def down do
    execute "DROP TRIGGER IF EXISTS trigger_user_plan_links_updated_at;"
    execute "DROP INDEX IF EXISTS user_plan_links_locale_code_index;"
    execute "DROP INDEX IF EXISTS user_plan_links_created_at_index;"
    execute "DROP INDEX IF EXISTS user_plan_links_updated_at_index;"
    execute "DROP INDEX IF EXISTS user_plan_links_deleted_at_index;"
    execute "DROP INDEX IF EXISTS user_plan_links_user_id_index;"
    execute "DROP INDEX IF EXISTS user_plan_links_plan_id_index"
    execute "DROP TABLE IF EXISTS user_plan_links;"
  end
end
