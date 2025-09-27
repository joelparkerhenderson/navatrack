defmodule Navatrack.Codes.ILOISCO2008 do
  use Ash.Resource,
    otp_app: :navatrack,
    domain: Navatrack.Codes,
    data_layer: AshPostgres.DataLayer

  def singular_snake_case(), do: "iso_isco_2008"
  def plural_snake_case(), do: "iso_isco_2008s"
  def singular_title_case(), do: "ILO ISCO 2008"
  def plural_title_case(), do: "ILO ISCO 2008s"

  postgres do
    table "ilo_isco_2008s"
    repo Navatrack.Repo
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

    attribute :definition, :string do
      allow_nil? false
      public? true
    end

  end

  actions do
 	  defaults [:read]
  end

end
