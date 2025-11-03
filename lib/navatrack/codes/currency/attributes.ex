defmodule Navatrack.Codes.Currency.Attributes do
  use Spark.Dsl.Fragment, of: Ash.Resource

  attributes do
    attribute :id, type: :string, primary_key?: true, public?: true, allow_nil?: false, writable?: false, generated?: false
    attribute :locale_code, :string do
      description "Locale code"
    end

    attribute :name, :string do
      description "Name"
    end

    attribute :number, :integer
    attribute :symbol, :string
    attribute :position, :boolean
  end

end
