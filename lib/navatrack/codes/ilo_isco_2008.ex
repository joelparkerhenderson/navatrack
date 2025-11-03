defmodule Navatrack.Codes.IloIsco2008 do
  use Ash.Resource,
    otp_app: :navatrack,
    domain: Navatrack.Codes,
    data_layer: AshPostgres.DataLayer,
    fragments: [
      Navatrack.Codes.IloIsco2008.Actions,
      Navatrack.Codes.IloIsco2008.Attributes,
    ]
  use One

  def snake_case_singular(), do: "ilo_isco_2008"
  def snake_case_plural(), do: "ilo_isco_2008s"
  def title_case_singular(), do: "ILO ISCO 2008"
  def title_case_plural(), do: "ILO ISCO 2008s"

  postgres do
    table "ilo_isco_2008s"
    repo Navatrack.Repo
  end

end
