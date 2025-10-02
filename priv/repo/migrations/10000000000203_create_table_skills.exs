defmodule Navatrack.Repo.Migrations.CreateTableSkills do
  @moduledoc """
  Create table skills.
  """

  use Ecto.Migration

  def up do
    execute """
    CREATE TABLE skills (
      id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
      created_at TIMESTAMP(6) WITH TIME ZONE DEFAULT (now() AT TIME ZONE 'utc'),
      updated_at TIMESTAMP(6) WITH TIME ZONE DEFAULT (now() AT TIME ZONE 'utc'),
      deleted_at TIMESTAMP(6) WITH TIME ZONE,
      locale_code text,
      sign text,
      kind text,
      name text,
      status text,
      tags text[],
      summary_as_markdown text,
      description_as_markdown text,
      avatar_image_400x400_url text CONSTRAINT avatar_image_400x400_url_check CHECK (avatar_image_400x400_url ~* '^https://'),
      avatar_image_400x400_alt text,
      main_image_1080x1080_url text CONSTRAINT main_image_1080x1080_url_check CHECK (main_image_1080x1080_url ~* '^https://'),
      main_image_1080x1080_alt text,
      main_image_1920x1080_url text CONSTRAINT main_image_1920x1080_url_check CHECK (main_image_1920x1080_url ~* '^https://'),
      main_image_1920x1080_alt text,
      main_image_1080x1920_url text CONSTRAINT main_image_1080x1920_url_check CHECK (main_image_1080x1920_url ~* '^https://'),
      main_image_1080x1920_alt text
    );
    """
    execute "CREATE TRIGGER trigger_skills_updated_at BEFORE UPDATE ON skills FOR EACH ROW EXECUTE FUNCTION trigger_updated_at();"
    execute "CREATE INDEX skills_created_at_index ON skills (created_at);"
    execute "CREATE INDEX skills_updated_at_index ON skills (updated_at);"
    execute "CREATE INDEX skills_deleted_at_index ON skills (deleted_at);"
    execute "CREATE INDEX skills_locale_code_index ON skills (locale_code);"
    execute "CREATE INDEX skills_sign_index ON skills (sign);"
    execute "CREATE INDEX skills_sign_index_tpo ON skills (sign text_pattern_ops);"
    execute "CREATE INDEX skills_kind_index ON skills (kind);"
    execute "CREATE INDEX skills_kind_index_tpo ON skills (kind text_pattern_ops);"
    execute "CREATE INDEX skills_tags_index ON skills (tags);"
  end

  def down do
    execute "DROP TRIGGER IF EXISTS trigger_skills_updated_at;"
    execute "DROP INDEX IF EXISTS skills_created_at_index;"
    execute "DROP INDEX IF EXISTS skills_updated_at_index;"
    execute "DROP INDEX IF EXISTS skills_deleted_at_index;"
    execute "DROP INDEX IF EXISTS skills_locale_code_index;"
    execute "DROP INDEX IF EXISTS skills_sign_index;"
    execute "DROP INDEX IF EXISTS skills_sign_index_tpo;"
    execute "DROP INDEX IF EXISTS skills_kind_index;"
    execute "DROP INDEX IF EXISTS skills_kind_index_tpo;"
    execute "DROP INDEX IF EXISTS skills_tags_index;"
    execute "DROP TABLE IF EXISTS skills;"
  end

end
