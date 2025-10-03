defmodule Navatrack.Repo.Migrations.CreateExtensionPostGIS do
  @moduledoc """
  Create extension postgis.
  """

  use Ecto.Migration

  def up do
    #TODO The extension must first be installed on the system where PostgreSQL is running.
    # execute("CREATE EXTENSION IF NOT EXISTS \"postgis\"")
  end

  def down do
    # Uncomment this if you actually want to uninstall the extensions:
    # execute("DROP EXTENSION IF EXISTS \"postgis\"")
  end
end
