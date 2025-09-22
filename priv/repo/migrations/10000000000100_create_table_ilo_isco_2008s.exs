defmodule Navatrack.Repo.Migrations.CreateTableILOISCO2008s do
  @moduledoc """
  Create table ilo_isco_2008s.
  """

  use Ecto.Migration

  def up do
    execute """
    CREATE TABLE IF NOT EXISTS ilo_isco_2008s (
      id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
      created_at TIMESTAMP(6) WITH TIME ZONE DEFAULT (now() AT TIME ZONE 'utc'),
      updated_at TIMESTAMP(6) WITH TIME ZONE DEFAULT (now() AT TIME ZONE 'utc'),
      deleted_at TIMESTAMP(6) WITH TIME ZONE,
      sign char,
      tags text[],
      code text CONSTRAINT check_code CHECK (code ~* '^[0-9]*$' AND char_length(code) < 4),
      title text,
      definition text
    );
    """
    execute """
    CREATE TRIGGER trigger_ilo_isco_2008s_updated_at
      BEFORE UPDATE ON ilo_isco_2008s
      FOR EACH ROW
      EXECUTE FUNCTION trigger_updated_at();
    """
    execute """
    CREATE INDEX index_ilo_isco_2008s_created_at ON ilo_isco_2008s (created_at);
    """
    execute """
    CREATE INDEX index_ilo_isco_2008s_updated_at ON ilo_isco_2008s (updated_at);
    """
    execute """
    CREATE INDEX index_ilo_isco_2008s_deleted_at ON ilo_isco_2008s (deleted_at);
    """
    execute """
    CREATE INDEX index_ilo_isco_2008s_sign ON ilo_isco_2008s (sign);
    """
    execute """
    CREATE INDEX index_ilo_isco_2008s_tags ON ilo_isco_2008s (tags);
    """
    execute """
    CREATE INDEX index_ilo_isco_2008s_code ON ilo_isco_2008s (code);
    """
  end

  def down do
    execute """
    CREATE TRIGGER IF EXISTS trigger_ilo_isco_2008s_updated_at
    """
    execute """
    DROP INDEX IF EXISTS index_ilo_isco_2008s_created_at;
    """
    execute """
    DROP INDEX IF EXISTS index_ilo_isco_2008s_updated_at;
    """
    execute """
    DROP INDEX IF EXISTS index_ilo_isco_2008s_deleted_at;
    """
    execute """
    DROP INDEX IF EXISTS index_ilo_isco_2008s_sign;
    """
    execute """
    DROP INDEX IF EXISTS index_ilo_isco_2008s_tags;
    """
    execute """
    DROP INDEX IF EXISTS index_ilo_isco_2008s_code;
    """
    execute """
    DROP TABLE IF EXISTS ilo_isco_2008s;
    """
  end

end
