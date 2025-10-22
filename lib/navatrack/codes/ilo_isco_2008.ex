defmodule Navatrack.Codes.IloIsco2008 do
  use Ash.Resource,
    otp_app: :navatrack,
    domain: Navatrack.Codes,
    data_layer: AshPostgres.DataLayer

  def snake_case_singular(), do: "ilo_isco_2008"
  def snake_case_plural(), do: "ilo_isco_2008s"
  def title_case_singular(), do: "ILO ISCO 2008"
  def title_case_plural(), do: "ILO ISCO 2008s"

  postgres do
    table "ilo_isco_2008s"
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
