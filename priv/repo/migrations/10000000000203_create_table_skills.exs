defmodule Navatrack.Repo.Migrations.CreateTableSkills do
  @moduledoc """
  Create table skills.
  """

  use Ecto.Migration

  def up do
    execute """
    CREATE TABLE IF NOT EXISTS skills (
      id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
      created_at TIMESTAMP(6) WITH TIME ZONE DEFAULT (now() AT TIME ZONE 'utc'),
      updated_at TIMESTAMP(6) WITH TIME ZONE DEFAULT (now() AT TIME ZONE 'utc'),
      deleted_at TIMESTAMP(6) WITH TIME ZONE,
      sign char,
      title text,
      status text,
      tags text[],
      summary_as_markdown text,
      description_as_markdown text,
      avatar_image_400x400_url text CONSTRAINT check_avatar_image_400x400_url CHECK (avatar_image_400x400_url ~* '^https://'),
      avatar_image_400x400_alt text,
      main_image_1080x1080_url text CONSTRAINT check_main_image_1080x1080_url CHECK (main_image_1080x1080_url ~* '^https://'),
      main_image_1080x1080_alt text,
      main_image_1920x1080_url text CONSTRAINT check_main_image_1920x1080_url CHECK (main_image_1920x1080_url ~* '^https://'),
      main_image_1920x1080_alt text,
      main_image_1080x1920_url text CONSTRAINT check_main_image_1080x1920_url CHECK (main_image_1080x1920_url ~* '^https://'),
      main_image_1080x1920_alt text
    );
    """
    execute """
    CREATE TRIGGER trigger_skills_updated_at
      BEFORE UPDATE ON skills
      FOR EACH ROW
      EXECUTE FUNCTION trigger_updated_at();
    """
    execute """
    CREATE INDEX index_skills_created_at ON skills (created_at);
    """
    execute """
    CREATE INDEX index_skills_updated_at ON skills (updated_at);
    """
    execute """
    CREATE INDEX index_skills_deleted_at ON skills (deleted_at);
    """
    execute """
    CREATE INDEX index_skills_sign ON skills (sign);
    """
    execute """
    CREATE INDEX index_skills_tags ON skills (tags);
    """
  end

  def down do
    execute """
    DROP TRIGGER IF EXISTS trigger_skills_updated_at;
    """
    execute """
    DROP INDEX IF EXISTS index_skills_created_at;
    """
    execute """
    DROP INDEX IF EXISTS index_skills_updated_at;
    """
    execute """
    DROP INDEX IF EXISTS index_skills_deleted_at;
    """
    execute """
    DROP INDEX IF EXISTS index_skills_sign;
    """
    execute """
    DROP INDEX IF EXISTS index_skills_tags;
    """
    execute """
    DROP TABLE IF EXISTS skills;
    """
  end

end
