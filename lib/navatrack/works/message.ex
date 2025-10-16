defmodule Navatrack.Works.Message do
  use Ash.Resource,
    otp_app: :navatrack,
    domain: Navatrack.Works,
    data_layer: AshPostgres.DataLayer

  postgres do
    table "messages"
    repo Navatrack.Repo
  end

  actions do
    defaults [:read, :destroy, create: [], update: []]
  end

  attributes do
    uuid_primary_key :id

    attribute :name, :string do
      allow_nil? false
    end

    attribute :sign, :string
    attribute :status, :string
    attribute :tagging, :string
    attribute :note, :string
  end

  relationships do
    belongs_to :writer, Navatrack.Accounts.User
    belongs_to :reader, Navatrack.Accounts.User
  end
end
