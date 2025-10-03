defmodule Navatrack.Repo.Migrations.CreateExtensionPgCrypto do
  @moduledoc """
  Create extension pgcrypto.
  """

  use Ecto.Migration

  def up do
    execute("CREATE EXTENSION IF NOT EXISTS \"pgcrypto\"")
  end

  def down do
    # Uncomment this if you actually want to uninstall the extensions:
    # execute("DROP EXTENSION IF EXISTS \"pgcrypto\"")
  end
end
