defmodule Navatrack.Repo.Migrations.CreateExtensionPgTrgm do
  @moduledoc """
  Create extension pg_trgm.
  """

  use Ecto.Migration

  def up do
    execute("CREATE EXTENSION IF NOT EXISTS \"citext\"")
  end

  def down do
    # Uncomment this if you actually want to uninstall the extensions
    # when this migration is rolled back:
    # execute("DROP EXTENSION IF EXISTS \"citext\"")
  end
end
