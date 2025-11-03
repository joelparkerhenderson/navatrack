defmodule Navatrack.Codes.IloIsco2008.Attributes do
  use Spark.Dsl.Fragment, of: Ash.Resource

  attributes do
    uuid_primary_key :id

    attribute :locale_code, :string do
      allow_nil? false
      public? true
    end

    attribute :code, :string do
      allow_nil? false
      public? true
    end

    attribute :name, :string do
      allow_nil? false
      public? true
    end

    attribute :definition_as_markdown, :string do
      allow_nil? false
      public? true
    end

  end

end
