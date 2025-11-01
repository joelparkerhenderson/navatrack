defmodule Navatrack.Codes.MeasurementSystem do
  use Ash.Resource,
    otp_app: :navatrack,
    domain: Navatrack.Codes,
    data_layer: AshPostgres.DataLayer
  use One

  def snake_case_singular(), do: "measurement_system"
  def snake_case_plural(), do: "measurement_systems"
  def title_case_singular(), do: "Measurement System"
  def title_case_plural(), do: "Measurement Systems"

  postgres do
    table "measurement_systems"
    repo Navatrack.Repo
  end

  actions do
    defaults [:read]
  end

  attributes do
    uuid_primary_key :id
    attribute :locale_code, :string
    attribute :name, :string
    attribute :name_phonetic, :string
    attribute :name_abbreviation, :string
    attribute :name_abbreviation_phonetic, :string
  end

end
