defmodule Navatrack.Repo.Migrations.CreateTableUserIloIsco2008Links do
  @moduledoc """
  Create table user_ilo_isco_2008_links
  """

  use Ecto.Migration

  def up do
    execute """
    CREATE TABLE user_ilo_isco_2008_links (
      id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
      created_at TIMESTAMP(6) WITH TIME ZONE DEFAULT (now() AT TIME ZONE 'utc'),
      updated_at TIMESTAMP(6) WITH TIME ZONE DEFAULT (now() AT TIME ZONE 'utc'),
      deleted_at TIMESTAMP(6) WITH TIME ZONE,
      locale_code text,
      user_id uuid REFERENCES users(id) ON DELETE SET NULL,
      ilo_isco_2008_id uuid REFERENCES users(id) ON DELETE SET NULL,
      status text,
      tagging text
    );
    """

    execute """
    CREATE TRIGGER trigger_user_ilo_isco_2008_links_updated_at
      BEFORE UPDATE ON user_ilo_isco_2008_links
      FOR EACH ROW EXECUTE FUNCTION
      trigger_updated_at();
    """

    execute "CREATE INDEX user_ilo_isco_2008_links_created_at_index ON user_ilo_isco_2008_links (created_at);"

    execute "CREATE INDEX user_ilo_isco_2008_links_updated_at_index ON user_ilo_isco_2008_links (updated_at);"

    execute "CREATE INDEX user_ilo_isco_2008_links_deleted_at_index ON user_ilo_isco_2008_links (deleted_at);"

    execute "CREATE INDEX user_ilo_isco_2008_links_locale_code_index ON user_ilo_isco_2008_links (locale_code);"

    execute "CREATE INDEX user_ilo_isco_2008_links_user_id_index ON user_ilo_isco_2008_links (user_id);"

    execute "CREATE INDEX user_ilo_isco_2008_links_ilo_isco_2008_id_index ON user_ilo_isco_2008_links (ilo_isco_2008_id);"
  end

  def down do
    execute "DROP TRIGGER IF EXISTS trigger_user_ilo_isco_2008_links_updated_at;"
    execute "DROP INDEX IF EXISTS user_ilo_isco_2008_links_locale_code_index;"
    execute "DROP INDEX IF EXISTS user_ilo_isco_2008_links_created_at_index;"
    execute "DROP INDEX IF EXISTS user_ilo_isco_2008_links_updated_at_index;"
    execute "DROP INDEX IF EXISTS user_ilo_isco_2008_links_deleted_at_index;"
    execute "DROP INDEX IF EXISTS user_ilo_isco_2008_links_user_id_index;"
    execute "DROP INDEX IF EXISTS user_ilo_isco_2008_links_ilo_isco_2008_id_index"
    execute "DROP TABLE IF EXISTS user_ilo_isco_2008_links;"
  end
end
