defmodule Navatrack.Codes.Currency do
  use Ash.Resource, otp_app: :navatrack, domain: Navatrack.Codes, data_layer: AshPostgres.DataLayer

  def snake_case_singular(), do: "currency_type"
  def snake_case_plural(), do: "currency_types"
  def title_case_singular(), do: "Currency"
  def title_case_plural(), do: "Currencies"

  postgres do
    table "currencies"
    repo Navatrack.Repo
  end

  actions do
    defaults [:read]
  end

  attributes do
    uuid_primary_key :id
    attribute :locale_code, :string
    attribute :name, :string
    attribute :code, :string
    attribute :number, :integer
    attribute :symbol, :string
    attribute :position, :boolean
  end

end
