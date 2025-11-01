defmodule Navatrack.Repo.Migrations.CreateTableEventReviews do
  @moduledoc """
  Create table event_reviews.
  """

  use Ecto.Migration

  def up do
    execute """
    CREATE TABLE event_reviews (
      --- meta
      id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
      created_at TIMESTAMP(6) WITH TIME ZONE DEFAULT (now() AT TIME ZONE 'utc'),
      updated_at TIMESTAMP(6) WITH TIME ZONE DEFAULT (now() AT TIME ZONE 'utc'),
      retired_at TIMESTAMP(6) WITH TIME ZONE,
      locale_code text,
      parent_id uuid CONSTRAINT event_reviews_parent_id_fk REFERENCES event_reviews (id),
      parent_order int CONSTRAINT event_reviews_parent_order_check CHECK (parent_order >= 0),
      --- card
      name text,
      sign text CONSTRAINT event_reviews_sign_check CHECK (LENGTH(sign) = 1),
      status text,
      tagging text,
      note text,
      -- links
      by_user_id uuid CONSTRAINT event_reviews_by_user_id_fk REFERENCES users (id),
      to_event_id uuid CONSTRAINT event_reviews_to_event_id_fk REFERENCES events (id),
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
    CREATE TRIGGER trigger_event_reviews_updated_at
      BEFORE UPDATE ON event_reviews
      FOR EACH ROW EXECUTE FUNCTION
      trigger_updated_at();
    """

    execute """
    CREATE INDEX event_reviews_index_gto
      ON event_reviews
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
    execute "CREATE INDEX event_reviews_created_at_index ON event_reviews (created_at);"
    execute "CREATE INDEX event_reviews_updated_at_index ON event_reviews (updated_at);"
    execute "CREATE INDEX event_reviews_retired_at_index ON event_reviews (retired_at);"
    execute "CREATE INDEX event_reviews_locale_code_index ON event_reviews (locale_code);"
    execute "CREATE INDEX event_reviews_name_index ON event_reviews (name);"
    execute "CREATE INDEX event_reviews_name_index_tpo ON event_reviews (name text_pattern_ops);"
    execute "CREATE INDEX event_reviews_tagging_index ON event_reviews (tagging);"
    execute "CREATE INDEX event_reviews_tagging_index_tpo ON event_reviews (tagging text_pattern_ops);"
  end

  def down do
    execute "DROP CONSTRAINT IF EXISTS event_reviews_parent_id_fk;"
    execute "DROP CONSTRAINT IF EXISTS event_reviews_parent_order_check;"
    execute "DROP CONSTRAINT IF EXISTS event_reviews_by_user_id_fk;"
    execute "DROP CONSTRAINT IF EXISTS event_reviews_to_event_id_fk;"
    execute "DROP TRIGGER IF EXISTS trigger_event_reviews_updated_at;"
    execute "DROP INDEX IF EXISTS event_reviews_index_gto;"
    execute "DROP INDEX IF EXISTS event_reviews_created_at_index;"
    execute "DROP INDEX IF EXISTS event_reviews_updated_at_index;"
    execute "DROP INDEX IF EXISTS event_reviews_retired_at_index;"
    execute "DROP INDEX IF EXISTS event_reviews_locale_code_index;"
    execute "DROP INDEX IF EXISTS event_reviews_name_index;"
    execute "DROP INDEX IF EXISTS event_reviews_name_index_tpo;"
    execute "DROP INDEX IF EXISTS event_reviews_tagging_index;"
    execute "DROP INDEX IF EXISTS event_reviews_tagging_index_tpo;"
    execute "DROP TABLE IF EXISTS event_reviews;"
  end
end
