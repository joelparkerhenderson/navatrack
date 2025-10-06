defmodule Navatrack.Repo.Migrations.CreateExtensionPgPCRE do
  @moduledoc """
  Create extension pgpcre.
  """

  use Ecto.Migration

  def up do
    # TODO The extension must first be installed on the system where PostgreSQL is running.
    # execute("CREATE EXTENSION IF NOT EXISTS \"pgpcre\"")
  end

  def down do
    # Uncomment this if you actually want to uninstall the extensions:
    # execute("DROP EXTENSION IF EXISTS \"pgpcre\"")
  end
end
