defmodule Navatrack.Repo.Migrations.CreateTableUserLuminaFoundationSkillLevelLinks do
  @moduledoc """
  Create table user_lumina_foundation_skill_level_links
  """

  use Ecto.Migration

  def up do
    execute """
    CREATE TABLE user_lumina_foundation_skill_level_links (
      id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
      created_at TIMESTAMP(6) WITH TIME ZONE DEFAULT (now() AT TIME ZONE 'utc'),
      updated_at TIMESTAMP(6) WITH TIME ZONE DEFAULT (now() AT TIME ZONE 'utc'),
      retired_at TIMESTAMP(6) WITH TIME ZONE,
      locale_code text,
      user_id uuid REFERENCES users(id) ON DELETE SET NULL,
      lumina_foundation_skill_level_id uuid REFERENCES lumina_foundation_skill_levels(id) ON DELETE SET NULL,
      status text,
      tagging text
    );
    """
    execute """
    CREATE TRIGGER trigger_user_lumina_foundation_skill_level_links_updated_at
      BEFORE UPDATE ON user_lumina_foundation_skill_level_links
      FOR EACH ROW EXECUTE FUNCTION
      trigger_updated_at();
    """
    execute "CREATE INDEX user_lumina_foundation_skill_level_links_created_at_index ON user_lumina_foundation_skill_level_links (created_at);"
    execute "CREATE INDEX user_lumina_foundation_skill_level_links_updated_at_index ON user_lumina_foundation_skill_level_links (updated_at);"
    execute "CREATE INDEX user_lumina_foundation_skill_level_links_retired_at_index ON user_lumina_foundation_skill_level_links (retired_at);"
    execute "CREATE INDEX user_lumina_foundation_skill_level_links_locale_code_index ON user_lumina_foundation_skill_level_links (locale_code);"
    execute "CREATE INDEX user_lumina_foundation_skill_level_links_user_id_index ON user_lumina_foundation_skill_level_links (user_id);"
    execute "CREATE INDEX user_lumina_foundation_skill_level_links_lumina_foundation_skill_level_id_index ON user_lumina_foundation_skill_level_links (lumina_foundation_skill_level_id);"
  end

  def down do
    execute "DROP TRIGGER IF EXISTS trigger_user_lumina_foundation_skill_level_links_updated_at;"
    execute "DROP INDEX IF EXISTS user_lumina_foundation_skill_level_links_locale_code_index;"
    execute "DROP INDEX IF EXISTS user_lumina_foundation_skill_level_links_created_at_index;"
    execute "DROP INDEX IF EXISTS user_lumina_foundation_skill_level_links_updated_at_index;"
    execute "DROP INDEX IF EXISTS user_lumina_foundation_skill_level_links_retired_at_index;"
    execute "DROP INDEX IF EXISTS user_lumina_foundation_skill_level_links_user_id_index;"
    execute "DROP INDEX IF EXISTS user_lumina_foundation_skill_level_links_lumina_foundation_skill_level_id_index"
    execute "DROP TABLE IF EXISTS user_lumina_foundation_skill_level_links;"
  end
end
