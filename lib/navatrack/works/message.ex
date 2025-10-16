defmodule Navatrack.Works.Message do
  use Ash.Resource,
    otp_app: :navatrack,
    domain: Navatrack.Works,
    data_layer: AshPostgres.DataLayer

  def snake_case_singular(), do: "message"
  def snake_case_plural(), do: "messages"
  def title_case_singular(), do: "Message"
  def title_case_plural(), do: "Messages"

  postgres do
    table "messages"
    repo Navatrack.Repo
  end

  actions do
    defaults [:create, :read, :update, :destroy]

    default_accept [
      :created_at,
      :updated_at,
      :deleted_at,
      :locale_code,
      :name,
      :sign,
      :status,
      :tagging,
      :note,
      :writer_as_user_id,
      :reader_as_user_id
    ]
  end

  attributes do
    uuid_primary_key :id
    attribute :created_at, :utc_datetime_usec
    attribute :updated_at, :utc_datetime_usec
    attribute :deleted_at, :utc_datetime_usec
    attribute :locale_code, :string
    attribute :name, :string
    attribute :sign, :string
    attribute :status, :string
    attribute :tagging, :string
    attribute :note, :string
    attribute :writer_as_user_id, :uuid, allow_nil?: false
    attribute :reader_as_user_id, :uuid, allow_nil?: false
  end

  relationships do
    belongs_to :writer, Navatrack.Accounts.User do
      source_attribute :writer_as_user_id
    end
    belongs_to :reader, Navatrack.Accounts.User do
      source_attribute :reader_as_user_id
    end
  end
end
