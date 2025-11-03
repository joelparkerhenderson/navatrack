defmodule Navatrack.Works.Message do
  use Ash.Resource,
    otp_app: :navatrack,
    domain: Navatrack.Works,
    data_layer: AshPostgres.DataLayer,
    fragments: [
      Navatrack.Works.Message.Actions,
      Navatrack.Works.Message.Attributes,
    ]
  use Navatrack.Works.Message.Fab

  def snake_case_singular(), do: "message"
  def snake_case_plural(), do: "messages"
  def title_case_singular(), do: "Message"
  def title_case_plural(), do: "Messages"

  postgres do
    table "messages"
    repo Navatrack.Repo
  end

  relationships do

    belongs_to :parent, __MODULE__, allow_nil?: true

    belongs_to :from, Navatrack.Accounts.User do
      source_attribute :from_user_id
    end

    belongs_to :to, Navatrack.Accounts.User do
      source_attribute :to_user_id
    end

  end

end
