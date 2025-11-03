defmodule Navatrack.Works.Aim do
  use Ash.Resource,
    otp_app: :navatrack,
    domain: Navatrack.Works,
    data_layer: AshPostgres.DataLayer,
    fragments: [
      Navatrack.Works.Aim.Actions,
      Navatrack.Works.Aim.Attributes,
    ]
  use Navatrack.Works.Aim.Fab

  def snake_case_singular(), do: "aim"
  def snake_case_plural(), do: "aims"
  def title_case_singular(), do: "Aim"
  def title_case_plural(), do: "Aims"

  postgres do
    table "aims"
    repo Navatrack.Repo
  end

  relationships do

    belongs_to :parent, __MODULE__, allow_nil?: true

    many_to_many :users, Navatrack.Accounts.User do
      through Navatrack.Accounts.UserAimLink
      source_attribute_on_join_resource :aim_id
      destination_attribute_on_join_resource :user_id
    end

  end

end
