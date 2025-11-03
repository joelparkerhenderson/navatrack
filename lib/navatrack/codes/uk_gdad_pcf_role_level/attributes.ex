defmodule Navatrack.Codes.UkGdadPcfRoleLevel.Attributes do
  use Spark.Dsl.Fragment, of: Ash.Resource

  attributes do
    uuid_primary_key :id

    attribute :locale_code, :string do
      allow_nil? false
      public? true
    end

    attribute :uk_gdad_pcf_role_id, :uuid do
      allow_nil? false
      public? true
    end

    attribute :uk_gdad_pcf_role_order, :integer do
      allow_nil? false
      public? true
    end

    attribute :name, :string do
      allow_nil? false
      public? true
    end

    attribute :description_as_markdown, :string do
      allow_nil? false
      public? true
    end
  end

end
