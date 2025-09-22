defmodule Navatrack.Codes.ILOISCO2008 do
  use Ash.Resource,
    otp_app: :navatrack,
    domain: Navatrack.Codes,
    data_layer: AshPostgres.DataLayer

  def singular_snake_case(), do: "iso_isco_2008"
  def plural_snake_case(), do: "iso_isco_2008s"
  def singular_title_case(), do: "ILO ISCO 2008"
  def plural_title_case(), do: "ILO ISCO 2008s"

  postgres do
    table "ilo_isco_20082008s"
    repo Navatrack.Repo
  end

  actions do
 	  defaults [:create, :read, :update, :destroy]
  end

  attributes do
    uuid_primary_key :id
    attribute :created_at, :utc_datetime_usec
    attribute :updated_at, :utc_datetime_usec
    attribute :deleted_at, :utc_datetime_usec
    attribute :sign, :string
    attribute :tags, {:array, :string}
    attribute :code, :string
    attribute :title, :string
    attribute :definition, :string
  end

  actions do
 	  defaults [:create, :read, :update, :destroy]
    default_accept [
      :created_at,
      :updated_at,
      :deleted_at,
      :sign,
      :tags,
      :code,
      :title,
      :definition,
    ]
  end

end
