defmodule Navatrack.Codes.MeasurementSystem do
  use Ash.Resource,
    otp_app: :navatrack,
    domain: Navatrack.Codes,
    data_layer: AshPostgres.DataLayer,
    fragments: [
      Navatrack.Codes.MeasurementSystem.Actions,
      Navatrack.Codes.MeasurementSystem.Attributes,
    ]
  use One

  def snake_case_singular(), do: "measurement_system"
  def snake_case_plural(), do: "measurement_systems"
  def title_case_singular(), do: "Measurement System"
  def title_case_plural(), do: "Measurement Systems"

  postgres do
    table "measurement_systems"
    repo Navatrack.Repo
  end

end
