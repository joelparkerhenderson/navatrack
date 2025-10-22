defmodule Navatrack.Codes.UkGdadPcfSkill do
  use Ash.Resource,
    otp_app: :navatrack,
    domain: Navatrack.Codes,
    data_layer: AshPostgres.DataLayer

  def snake_case_singular(), do: "uk_gdad_pcf_skill"
  def snake_case_plural(), do: "uk_gdad_pcf_skills"
  def title_case_singular(), do: "UK GDAD PCF Skill"
  def title_case_plural(), do: "UK GDAD PCF Skills"

  postgres do
    table "uk_gdad_pcf_skills"
    repo Navatrack.Repo
  end

  actions do
    defaults [:read]
  end

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

  def fab!(map \\ %{}) do
    __MODULE__ |> Ash.Changeset.for_create(:create, __MODULE__.fab_map(map)) |> Ash.create!()
  end

  def fab_map(map \\ %{}) do
    Map.merge(
      %{
        locale_code: "en-US",
      },
      map
    )
  end

end
