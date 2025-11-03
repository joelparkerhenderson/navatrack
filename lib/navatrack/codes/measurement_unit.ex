defmodule Navatrack.Codes.MeasurementUnit do
  use Ash.Resource,
    otp_app: :navatrack,
    domain: Navatrack.Codes,
    data_layer: AshPostgres.DataLayer,
    fragments: [
      Navatrack.Codes.MeasurementUnit.Actions,
      Navatrack.Codes.MeasurementUnit.Attributes
    ]
  use One

  def snake_case_singular(), do: "measurement_unit"
  def snake_case_plural(), do: "measurement_units"
  def title_case_singular(), do: "Measurement Unit"
  def title_case_plural(), do: "Measurement Units"

  postgres do
    table "measurement_units"
    repo Navatrack.Repo
  end

end
