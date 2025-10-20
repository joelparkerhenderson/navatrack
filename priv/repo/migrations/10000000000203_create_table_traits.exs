defmodule Navatrack.Repo.Migrations.CreateTableTraits do
  @moduledoc """
  Create table traits.
  """

  use Ecto.Migration

  def up do
    execute """
    CREATE TABLE traits (
      id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
      created_at TIMESTAMP(6) WITH TIME ZONE DEFAULT (now() AT TIME ZONE 'utc'),
      updated_at TIMESTAMP(6) WITH TIME ZONE DEFAULT (now() AT TIME ZONE 'utc'),
      deleted_at TIMESTAMP(6) WITH TIME ZONE,
      locale_code text,
      parent_id uuid CONSTRAINT parent_id_fk REFERENCES traits (id),
      parent_order int CONSTRAINT parent_order_check CHECK (parent_order >= 0),
      --- card
      name text,
      sign text CONSTRAINT sign_check CHECK (LENGTH(sign) = 1),
      status text,
      tagging text,
      note text,
      --- content
      summary_as_markdown text,
      description_as_markdown text,
      -- images
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

    execute """
    CREATE TRIGGER trigger_traits_updated_at
      BEFORE UPDATE ON traits
      FOR EACH ROW EXECUTE FUNCTION
      trigger_updated_at();
    """

    execute """
    CREATE INDEX traits_index_gto
      ON traits USING GIN ((
        sign
          || ' ' ||
        name
          || ' ' ||
        status
          || ' ' ||
        tagging
          || ' ' ||
        note
          || ' ' ||
        summary_as_markdown
          || ' ' ||
        description_as_markdown
      ) gin_trgm_ops);
    """
    execute "CREATE INDEX traits_created_at_index ON traits (created_at);"
    execute "CREATE INDEX traits_updated_at_index ON traits (updated_at);"
    execute "CREATE INDEX traits_deleted_at_index ON traits (deleted_at);"
    execute "CREATE INDEX traits_locale_code_index ON traits (locale_code);"
    execute "CREATE INDEX traits_name_index ON traits (name);"
    execute "CREATE INDEX traits_name_index_tpo ON traits (name text_pattern_ops);"
    execute "CREATE INDEX traits_tagging_index ON traits (tagging);"
    execute "CREATE INDEX traits_tagging_index_tpo ON traits (tagging text_pattern_ops);"
  end

  def down do
    execute "DROP CONSTRAINT IF EXISTS parent_id_fk;"
    execute "DROP CONSTRAINT IF EXISTS parent_order_check;"
    execute "DROP CONSTRAINT IF EXISTS sign_check;"
    execute "DROP CONSTRAINT IF EXISTS avatar_image_400x400_url_check;"
    execute "DROP CONSTRAINT IF EXISTS main_image_1080x1080_url_check;"
    execute "DROP CONSTRAINT IF EXISTS main_image_1920x1080_url_check;"
    execute "DROP CONSTRAINT IF EXISTS main_image_1080x1920_url_check;"
    execute "DROP TRIGGER IF EXISTS trigger_traits_updated_at;"
    execute "DROP INDEX IF EXISTS traits_index_gto;"
    execute "DROP INDEX IF EXISTS traits_created_at_index;"
    execute "DROP INDEX IF EXISTS traits_updated_at_index;"
    execute "DROP INDEX IF EXISTS traits_deleted_at_index;"
    execute "DROP INDEX IF EXISTS traits_locale_code_index;"
    execute "DROP INDEX IF EXISTS traits_name_index;"
    execute "DROP INDEX IF EXISTS traits_name_index_tpo;"
    execute "DROP INDEX IF EXISTS traits_tagging_index;"
    execute "DROP INDEX IF EXISTS traits_tagging_index_tpo;"
    execute "DROP TABLE IF EXISTS traits;"
  end
end
