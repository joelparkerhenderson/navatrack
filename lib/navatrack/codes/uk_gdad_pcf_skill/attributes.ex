defmodule Navatrack.Codes.UkGdadPcfSkill.Attributes do
  use Spark.Dsl.Fragment, of: Ash.Resource

  attributes do
    uuid_primary_key :id

    attribute :locale_code, :string do
      allow_nil? false
      public? true
    end

    attribute :name, :string do
      allow_nil? false
      public? true
    end

    attribute :url, :string do
      allow_nil? false
      public? true
    end

    attribute :description, :string do
      allow_nil? false
      public? true
    end

    attribute :level_1_description_as_markdown, :string do
      allow_nil? false
      public? true
    end

    attribute :level_2_description_as_markdown, :string do
      allow_nil? false
      public? true
    end

    attribute :level_3_description_as_markdown, :string do
      allow_nil? false
      public? true
    end

    attribute :level_4_description_as_markdown, :string do
      allow_nil? false
      public? true
    end

    attribute :roles_that_require_this_skill_as_markdown, :string do
      allow_nil? false
      public? true
    end

  end
end
