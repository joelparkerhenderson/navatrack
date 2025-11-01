defmodule Navatrack.Codes.Currency do
  use Ash.Resource,
    otp_app: :navatrack,
    domain: Navatrack.Codes,
    data_layer: AshPostgres.DataLayer
  use One

  def snake_case_singular(), do: "currency"
  def snake_case_plural(), do: "currencies"
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
    attribute :id, type: :string, primary_key?: true, public?: true, allow_nil?: false, writable?: false, generated?: false
    attribute :locale_code, :string
    attribute :name, :string
    attribute :number, :integer
    attribute :symbol, :string
    attribute :position, :boolean
  end

end
