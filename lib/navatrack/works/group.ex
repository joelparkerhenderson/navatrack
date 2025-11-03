defmodule Navatrack.Works.Group do
  use Ash.Resource,
    otp_app: :navatrack,
    domain: Navatrack.Works,
    data_layer: AshPostgres.DataLayer,
    fragments: [
      Navatrack.Works.Group.Actions,
      Navatrack.Works.Group.Attributes,
    ]
  use Navatrack.Works.Group.Fab

  def snake_case_singular(), do: "group"
  def snake_case_plural(), do: "groups"
  def title_case_singular(), do: "Group"
  def title_case_plural(), do: "Groups"

  postgres do
    table "groups"
    repo Navatrack.Repo
  end

  relationships do

    belongs_to :parent, __MODULE__, allow_nil?: true

    many_to_many :users, Navatrack.Accounts.User do
      through Navatrack.Accounts.UserGroupLink
      source_attribute_on_join_resource :group_id
      destination_attribute_on_join_resource :user_id
    end

  end

end
