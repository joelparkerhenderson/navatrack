defmodule Navatrack.Codes.MeasurementUnit.Attributes do
  use Spark.Dsl.Fragment, of: Ash.Resource

  attributes do
    attribute :id, type: :string, primary_key?: true, public?: true, allow_nil?: false, writable?: false, generated?: false
    attribute :locale_code, :string do
      description "Locale code"
    end

    attribute :name, :string do
      description "Name"
    end

    attribute :name_phonetic, :string
    attribute :category, :string
    attribute :synonyms, :string
    attribute :loinc_property, :string
    attribute :guidance, :string
    attribute :measurement_system_id, :uuid
  end

end
