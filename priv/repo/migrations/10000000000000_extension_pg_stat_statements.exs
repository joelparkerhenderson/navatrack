defmodule Navatrack.Repo.Migrations.CreateExtensionPgStatStatements do
  @moduledoc """
  Create extension pg_stat_statements.
  """

  use Ecto.Migration

  def up do
    execute("CREATE EXTENSION IF NOT EXISTS \"pg_stat_statements\"")
  end

  def down do
    # Uncomment this if you actually want to uninstall the extensions:
    # execute("DROP EXTENSION IF EXISTS \"pg_stat_statements\"")
  end
end
