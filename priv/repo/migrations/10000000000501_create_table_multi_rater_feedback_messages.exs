defmodule Navatrack.Repo.Migrations.CreateTableMultiRaterFeedbackMessages do
  @moduledoc """
  Create table multi_rater_feedback_messages.
  """

  use Ecto.Migration

  def up do
    execute """
    CREATE TABLE multi_rater_feedback_messages (
      --- meta
      id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
      created_at TIMESTAMP(6) WITH TIME ZONE DEFAULT (now() AT TIME ZONE 'utc'),
      updated_at TIMESTAMP(6) WITH TIME ZONE DEFAULT (now() AT TIME ZONE 'utc'),
      deleted_at TIMESTAMP(6) WITH TIME ZONE,
      locale_code text,
      --- card
      name text,
      sign text CONSTRAINT sign_check CHECK (LENGTH(sign) = 1),
      status text,
      tagging text,
      note text,
      -- links
      writer_as_user_id uuid CONSTRAINT writer_as_user_id_fk REFERENCES users (id),
      reader_as_user_id uuid CONSTRAINT reader_as_user_id_fk REFERENCES users (id),
      -- feedback
      strength text,
      start text,
      stop text,
      continue text,
      change text,
      advice text
    );
    """

    execute """
    CREATE TRIGGER trigger_multi_rater_feedback_messages_updated_at
      BEFORE UPDATE ON multi_rater_feedback_messages
      FOR EACH ROW EXECUTE FUNCTION
      trigger_updated_at();
    """

    execute """
    CREATE INDEX multi_rater_feedback_messages_index_gto
      ON multi_rater_feedback_messages
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
    execute "CREATE INDEX multi_rater_feedback_messages_created_at_index ON multi_rater_feedback_messages (created_at);"
    execute "CREATE INDEX multi_rater_feedback_messages_updated_at_index ON multi_rater_feedback_messages (updated_at);"
    execute "CREATE INDEX multi_rater_feedback_messages_deleted_at_index ON multi_rater_feedback_messages (deleted_at);"
    execute "CREATE INDEX multi_rater_feedback_messages_locale_code_index ON multi_rater_feedback_messages (locale_code);"
    execute "CREATE INDEX multi_rater_feedback_messages_name_index ON multi_rater_feedback_messages (name);"
    execute "CREATE INDEX multi_rater_feedback_messages_name_index_tpo ON multi_rater_feedback_messages (name text_pattern_ops);"
    execute "CREATE INDEX multi_rater_feedback_messages_tagging_index ON multi_rater_feedback_messages (tagging);"
    execute "CREATE INDEX multi_rater_feedback_messages_tagging_index_tpo ON multi_rater_feedback_messages (tagging text_pattern_ops);"
  end

  def down do
    execute "DROP CONSTRAINT IF EXISTS writer_as_user_id_fk;"
    execute "DROP CONSTRAINT IF EXISTS reader_as_user_id_fk;"
    execute "DROP TRIGGER IF EXISTS trigger_multi_rater_feedback_messages_updated_at;"
    execute "DROP INDEX IF EXISTS multi_rater_feedback_messages_index_gto;"
    execute "DROP INDEX IF EXISTS multi_rater_feedback_messages_created_at_index;"
    execute "DROP INDEX IF EXISTS multi_rater_feedback_messages_updated_at_index;"
    execute "DROP INDEX IF EXISTS multi_rater_feedback_messages_deleted_at_index;"
    execute "DROP INDEX IF EXISTS multi_rater_feedback_messages_locale_code_index;"
    execute "DROP INDEX IF EXISTS multi_rater_feedback_messages_name_index;"
    execute "DROP INDEX IF EXISTS multi_rater_feedback_messages_name_index_tpo;"
    execute "DROP INDEX IF EXISTS multi_rater_feedback_messages_tagging_index;"
    execute "DROP INDEX IF EXISTS multi_rater_feedback_messages_tagging_index_tpo;"
    execute "DROP TABLE IF EXISTS multi_rater_feedback_messages;"
  end
end
