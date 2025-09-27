defmodule Navatrack.Codes.UkGdadPcfSkill do
  use Ash.Resource,
    otp_app: :navatrack,
    domain: Navatrack.Codes

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

    attribute :description_as_markdown, :string do
      allow_nil? false
      public? true
    end

    attribute :description_as_html, :string do
      allow_nil? false
      public? true
    end

    attribute :level_1_description_as_markdown, :string do
      allow_nil? false
      public? true
    end

    attribute :level_1_description_as_html, :string do
      allow_nil? false
      public? true
    end

    attribute :level_2_description_as_markdown, :string do
      allow_nil? false
      public? true
    end

    attribute :level_2_description_as_html, :string do
      allow_nil? false
      public? true
    end

    attribute :level_3_description_as_markdown, :string do
      allow_nil? false
      public? true
    end

    attribute :level_3_description_as_html, :string do
      allow_nil? false
      public? true
    end

    attribute :level_4_description_as_markdown, :string do
      allow_nil? false
      public? true
    end

    attribute :level_4_description_as_html, :string do
      allow_nil? false
      public? true
    end

    attribute :roles_that_require_this_skill_as_markdown, :string do
      allow_nil? false
      public? true
    end

    attribute :roles_that_require_this_skill_as_html, :string do
      allow_nil? false
      public? true
    end
  end

  actions do
    defaults [:read]
  end
end
