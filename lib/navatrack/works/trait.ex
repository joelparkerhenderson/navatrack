defmodule Navatrack.Works.Trait do
  use Ash.Resource,
    otp_app: :navatrack,
    domain: Navatrack.Works,
    data_layer: AshPostgres.DataLayer,
    fragments: [
      Navatrack.Works.Trait.Actions,
      Navatrack.Works.Trait.Attributes,
    ]
  use Navatrack.Works.Trait.Fab

  def snake_case_singular(), do: "trait"
  def snake_case_plural(), do: "traits"
  def title_case_singular(), do: "Trait"
  def title_case_plural(), do: "Traits"

  postgres do
    table "traits"
    repo Navatrack.Repo
  end

  relationships do

    belongs_to :parent, __MODULE__, allow_nil?: true

    many_to_many :users, Navatrack.Accounts.User do
      through Navatrack.Accounts.UserTraitLink
      source_attribute_on_join_resource :trait_id
      destination_attribute_on_join_resource :user_id
    end

  end

end
