defmodule Navatrack.Repo.Migrations.CreateExtensionPgTrgm do
  @moduledoc """
  Create extension pg_trgm.
  """

  use Ecto.Migration

  def up do
    execute("CREATE EXTENSION IF NOT EXISTS \"pg_trgm\"")
  end

  def down do
    # Uncomment this if you actually want to uninstall the extensions:
    # execute("DROP EXTENSION IF EXISTS \"pg_trgm\"")
  end
end
