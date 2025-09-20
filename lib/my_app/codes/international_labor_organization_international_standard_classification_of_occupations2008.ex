defmodule MyApp.Codes.InternationalLaborOrganizationInternationalStandardClassificationOfOccupations2008 do
  use Ash.Resource, otp_app: :navatrack, domain: MyApp.Codes, data_layer: AshPostgres.DataLayer

  postgres do
    table "international_labor_organization_international_standard_classification_of_occupations2008s"
    repo Navatrack.Repo
  end

  actions do
    defaults [:read, :destroy, create: [], update: []]
  end

  attributes do
    uuid_primary_key :id
    attribute :code, :string
    attribute :title, :string
    attribute :definition, :string
  end
end
