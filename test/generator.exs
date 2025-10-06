defmodule Generator do
  use Ash.Generator

  def user(opts \\ []) do
    changeset_generator(
      User,
      :create,
      overrides: opts,
      actor: opts[:actor]
    )
  end

  def group(opts \\ []) do
    changeset_generator(
      Group,
      :create,
      overrides: opts,
      actor: opts[:actor]
    )
  end
end
