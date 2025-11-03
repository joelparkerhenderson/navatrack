defmodule Navatrack.Codes.Currency do
  use Ash.Resource,
    otp_app: :navatrack,
    domain: Navatrack.Codes,
    data_layer: AshPostgres.DataLayer,
    fragments: [
      Navatrack.Codes.Currency.Actions,
      Navatrack.Codes.Currency.Attributes,
    ]
  use One

  def snake_case_singular(), do: "currency"
  def snake_case_plural(), do: "currencies"
  def title_case_singular(), do: "Currency"
  def title_case_plural(), do: "Currencies"

  postgres do
    table "currencies"
    repo Navatrack.Repo
  end

end
