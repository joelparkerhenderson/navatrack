defmodule Navatrack.Repo.Migrations.CreateTablePlaceReviews do
  @moduledoc """
  Create table place_reviews.
  """

  use Ecto.Migration

  def up do
    execute """
    CREATE TABLE place_reviews (
      --- meta
      id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
      created_at TIMESTAMP(6) WITH TIME ZONE DEFAULT (now() AT TIME ZONE 'utc'),
      updated_at TIMESTAMP(6) WITH TIME ZONE DEFAULT (now() AT TIME ZONE 'utc'),
      deleted_at TIMESTAMP(6) WITH TIME ZONE,
      locale_code text,
      parent_id uuid CONSTRAINT place_reviews_parent_id_fk REFERENCES place_reviews (id),
      parent_order int CONSTRAINT place_reviews_parent_order_check CHECK (parent_order >= 0),
      --- card
      name text,
      sign text CONSTRAINT place_reviews_sign_check CHECK (LENGTH(sign) = 1),
      status text,
      tagging text,
      note text,
      -- links
      by_user_id uuid CONSTRAINT place_reviews_by_user_id_fk REFERENCES users (id),
      to_place_id uuid CONSTRAINT place_reviews_to_place_id_fk REFERENCES places (id),
      -- review
      strength text,
      start text,
      stop text,
      continue text,
      change text,
      advice text
    );
    """

    execute """
    CREATE TRIGGER trigger_place_reviews_updated_at
      BEFORE UPDATE ON place_reviews
      FOR EACH ROW EXECUTE FUNCTION
      trigger_updated_at();
    """

    execute """
    CREATE INDEX place_reviews_index_gto
      ON place_reviews
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
          || ' ' ||
        strength
          || ' ' ||
        start
          || ' ' ||
        stop
          || ' ' ||
        continue
          || ' ' ||
        change
          || ' ' ||
        advice
      ) gin_trgm_ops);
    """
    execute "CREATE INDEX place_reviews_created_at_index ON place_reviews (created_at);"
    execute "CREATE INDEX place_reviews_updated_at_index ON place_reviews (updated_at);"
    execute "CREATE INDEX place_reviews_deleted_at_index ON place_reviews (deleted_at);"
    execute "CREATE INDEX place_reviews_locale_code_index ON place_reviews (locale_code);"
    execute "CREATE INDEX place_reviews_name_index ON place_reviews (name);"
    execute "CREATE INDEX place_reviews_name_index_tpo ON place_reviews (name text_pattern_ops);"
    execute "CREATE INDEX place_reviews_tagging_index ON place_reviews (tagging);"
    execute "CREATE INDEX place_reviews_tagging_index_tpo ON place_reviews (tagging text_pattern_ops);"
  end

  def down do
    execute "DROP CONSTRAINT IF EXISTS place_reviews_parent_id_fk;"
    execute "DROP CONSTRAINT IF EXISTS place_reviews_parent_order_check;"
    execute "DROP CONSTRAINT IF EXISTS place_reviews_by_user_id_fk;"
    execute "DROP CONSTRAINT IF EXISTS place_reviews_to_place_id_fk;"
    execute "DROP TRIGGER IF EXISTS trigger_place_reviews_updated_at;"
    execute "DROP INDEX IF EXISTS place_reviews_index_gto;"
    execute "DROP INDEX IF EXISTS place_reviews_created_at_index;"
    execute "DROP INDEX IF EXISTS place_reviews_updated_at_index;"
    execute "DROP INDEX IF EXISTS place_reviews_deleted_at_index;"
    execute "DROP INDEX IF EXISTS place_reviews_locale_code_index;"
    execute "DROP INDEX IF EXISTS place_reviews_name_index;"
    execute "DROP INDEX IF EXISTS place_reviews_name_index_tpo;"
    execute "DROP INDEX IF EXISTS place_reviews_tagging_index;"
    execute "DROP INDEX IF EXISTS place_reviews_tagging_index_tpo;"
    execute "DROP TABLE IF EXISTS place_reviews;"
  end
end
