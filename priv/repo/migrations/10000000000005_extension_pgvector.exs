defmodule Navatrack.Repo.Migrations.CreateExtensionPgVector do
  @moduledoc """
  Create extension pgvector.
  """

  use Ecto.Migration

  def up do
    #TODO The extension must first be installed on the system where PostgreSQL is running.
    # execute("CREATE EXTENSION IF NOT EXISTS \"pgvector\"")
  end

  def down do
    # Uncomment this if you actually want to uninstall the extensions:
    # execute("DROP EXTENSION IF EXISTS \"pgvector\"")
  end
end
