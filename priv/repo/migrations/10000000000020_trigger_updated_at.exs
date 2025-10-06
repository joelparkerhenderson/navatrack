defmodule Navatrack.Repo.Migrations.TriggerUpdatedAt do
  use Ecto.Migration

  def up do
    execute """
    CREATE OR REPLACE FUNCTION trigger_updated_at()
    RETURNS TRIGGER AS $$
    BEGIN
        NEW.updated_at = (NOW() AT TIME ZONE 'UTC');
        RETURN NEW;
    END;
    $$ language 'plpgsql';
    """
  end

  def down do
    execute "DROP FUNCTION IF EXISTS trigger_updated_at();"
  end
end
