defmodule Navatrack.Repo.Migrations.CreateTableLuminaFoundationSkillLevels do
  @moduledoc """
  Create table lumina_foundation_skill_levels.
  """

  use Ecto.Migration

  def up do
    execute """
    CREATE TABLE IF NOT EXISTS lumina_foundation_skill_levels (
      id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
      created_at TIMESTAMP(6) WITH TIME ZONE DEFAULT (now() AT TIME ZONE 'utc'),
      updated_at TIMESTAMP(6) WITH TIME ZONE DEFAULT (now() AT TIME ZONE 'utc'),
      deleted_at TIMESTAMP(6) WITH TIME ZONE,
      sign char,
      tags text[],
      number smallint CONSTRAINT check_number CHECK (number BETWEEN 1 AND 8),
      title text,
      description text
    );
    """
    execute """
    CREATE TRIGGER trigger_lumina_foundation_skill_levels_updated_at
      BEFORE UPDATE ON ilo_isco_2008s
      FOR EACH ROW
      EXECUTE FUNCTION trigger_updated_at();
    """
    execute """
    CREATE INDEX index_lumina_foundation_skill_levels_created_at ON lumina_foundation_skill_levels (created_at);
    """
    execute """
    CREATE INDEX index_lumina_foundation_skill_levels_updated_at ON lumina_foundation_skill_levels (updated_at);
    """
    execute """
    CREATE INDEX index_lumina_foundation_skill_levels_deleted_at ON lumina_foundation_skill_levels (deleted_at);
    """
    execute """
    CREATE INDEX index_lumina_foundation_skill_levels_sign ON lumina_foundation_skill_levels (sign);
    """
    execute """
    CREATE INDEX index_lumina_foundation_skill_levels_tags ON lumina_foundation_skill_levels (tags);
    """
    execute """
    CREATE INDEX index_lumina_foundation_skill_levels_number ON lumina_foundation_skill_levels (number);
    """
  end

  def down do
    execute """
    DROP TRIGGER IF EXISTS trigger_lumina_foundation_skill_levels_updated_at;
    """
    execute """
    DROP INDEX IF EXISTS index_lumina_foundation_skill_levels_created_at;
    """
    execute """
    DROP INDEX IF EXISTS index_lumina_foundation_skill_levels_updated_at;
    """
    execute """
    DROP INDEX IF EXISTS index_lumina_foundation_skill_levels_deleted_at;
    """
    execute """
    DROP INDEX IF EXISTS index_lumina_foundation_skill_levels_sign;
    """
    execute """
    DROP INDEX IF EXISTS index_lumina_foundation_skill_levels_tags;
    """
    execute """
    DROP INDEX IF EXISTS index_lumina_foundation_skill_levels_number;
    """
    execute """
    DROP TABLE IF EXISTS lumina_foundation_skill_levels;
    """
  end

end
