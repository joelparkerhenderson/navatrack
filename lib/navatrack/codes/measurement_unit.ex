defmodule Navatrack.Codes.MeasurementUnit do
  use Ash.Resource,
    otp_app: :navatrack,
    domain: Navatrack.Codes,
    data_layer: AshPostgres.DataLayer
  use One

  def snake_case_singular(), do: "measurement_unit"
  def snake_case_plural(), do: "measurement_units"
  def title_case_singular(), do: "Measurement Unit"
  def title_case_plural(), do: "Measurement Units"

  postgres do
    table "measurement_units"
    repo Navatrack.Repo
  end

  actions do
    defaults [:read]
  end

  attributes do
    attribute :id, type: :string, primary_key?: true, public?: true, allow_nil?: false, writable?: false, generated?: false
    attribute :locale_code, :string
    attribute :name, :string
    attribute :name_phonetic, :string
    attribute :category, :string
    attribute :synonyms, :string
    attribute :loinc_property, :string
    attribute :guidance, :string
    attribute :measurement_system_id, :uuid
  end

end
