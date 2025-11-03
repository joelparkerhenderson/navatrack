defmodule Navatrack.Codes.MeasurementSystem.Attributes do
  use Spark.Dsl.Fragment, of: Ash.Resource

  attributes do
    uuid_primary_key :id
    attribute :locale_code, :string do
      description "Locale code"
    end

    attribute :name, :string do
      description "Name"
    end

    attribute :name_phonetic, :string
    attribute :name_abbreviation, :string
    attribute :name_abbreviation_phonetic, :string
  end

end
