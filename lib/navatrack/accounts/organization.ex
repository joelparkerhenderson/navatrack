defmodule Navatrack.Accounts.Organization do
  use Ash.Resource,
    otp_app: :navatrack,
    domain: Navatrack.Accounts,
    data_layer: AshPostgres.DataLayer

  postgres do
    table "organizations"
    repo Navatrack.Repo
  end

  actions do
    defaults [:read, :destroy, create: [], update: []]
  end

  attributes do
    uuid_primary_key :id
    attribute :title, :string
    attribute :status, :string
    attribute :tags, {:array, :string}
    attribute :url, :string
    attribute :email, :string
    attribute :phone, :string
    attribute :messaging, :string
    attribute :postal, :string
    attribute :orcid_pid, :string
    attribute :rdf, :string
    attribute :linkedin_url, :string
    attribute :github_url, :string
    attribute :codeberg_url, :string
    attribute :location_iso_3166_1_alpha_2, :string
    attribute :location_iso_3166_2, :string
    attribute :location_postal_code, :string
    attribute :location_latitude_as_decimal_degrees, :decimal
    attribute :location_longitude_as_decimal_degrees, :decimal
    attribute :note, :string
    attribute :daisyui_timeline_html, :string
    attribute :org_mode, :string
    attribute :task_list_as_markdown, :string
    attribute :ways_of_working_as_markdown, :string
    attribute :objectives_and_key_results_as_markdown, :string
    attribute :key_performance_indicators_as_markdown, :string
    attribute :agents_as_markdown, :string
    attribute :avatar_400x400_url, :string
    attribute :avatar_400x400_alt, :string
    attribute :image_1080x1080_url, :string
    attribute :image_1080x1080_alt, :string
    attribute :image_1920x1080_url, :string
    attribute :image_1920x1080_alt, :string
    attribute :image_1080x1920_url, :string
    attribute :image_1080x1920_alt, :string
    attribute :gs1_digital_link, :string
    attribute :gs1_country_code, :string
    attribute :gs1_global_location_number, :string
    attribute :international_standard_industrial_classification_v4_code, :string
    attribute :international_standard_industrial_classification_v4_name, :string
    attribute :copyright_policy_as_url, :string
    attribute :copyright_policy_as_markdown, :string
    attribute :corrections_policy_as_url, :string
    attribute :corrections_policy_as_markdown, :string
    attribute :legal_policy_as_url, :string
    attribute :legal_policy_as_markdown, :string
    attribute :ethics_policy_as_url, :string
    attribute :ethics_policy_as_markdown, :string
    attribute :privacy_policy_as_url, :string
    attribute :privacy_policy_as_markdown, :string
    attribute :security_policy_as_url, :string
    attribute :security_policy_as_markdown, :string
    attribute :coordinated_disclosure_policy_as_url, :string
    attribute :coordinated_disclosure_policy_as_markdown, :string
    attribute :open_source_policy_as_url, :string
    attribute :open_source_policy_as_markdown, :string
    attribute :code_of_conduct_policy_as_url, :string
    attribute :code_of_conduct_policy_as_markdown, :string
    attribute :equal_opportunity_policy_as_url, :string
    attribute :equal_opportunity_policy_as_markdown, :string
    attribute :social_network_policy_as_url, :string
    attribute :social_network_policy_as_markdown, :string
    attribute :health_and_safety_policy_as_url, :string
    attribute :health_and_safety_policy_as_markdown, :string
    attribute :employee_handbook_policy_as_url, :string
    attribute :employee_handbook_policy_as_markdown, :string
    attribute :human_resources_policy_as_url, :string
    attribute :human_resources_policy_as_markdown, :string
    timestamps()
  end
end
