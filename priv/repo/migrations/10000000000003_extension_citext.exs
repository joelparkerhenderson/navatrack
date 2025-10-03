defmodule Navatrack.Repo.Migrations.CreateExtensionCIText do
  @moduledoc """
  Create extension citext.
  """

  use Ecto.Migration

  def up do
    execute("CREATE EXTENSION IF NOT EXISTS \"citext\"")
  end

  def down do
    # Uncomment this if you actually want to uninstall the extensions:
    # execute("DROP EXTENSION IF EXISTS \"citext\"")
  end
end
