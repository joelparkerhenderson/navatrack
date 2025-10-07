defmodule Navatrack.Works.Group do
  use Ash.Resource,
    otp_app: :navatrack,
    domain: Navatrack.Accounts,
    data_layer: AshPostgres.DataLayer

  def singular_snake_case(), do: "group"
  def plural_snake_case(), do: "groups"
  def singular_title_case(), do: "Group"
  def plural_title_case(), do: "Groups"

  postgres do
    table "groups"
    repo Navatrack.Repo
  end

  actions do
    defaults [:create, :read, :update, :destroy]

    default_accept [
      :created_at,
      :updated_at,
      :deleted_at,
      :locale_code,
      :name,
      :status,
      :tagging,
      :url,
      :email,
      :phone,
      :messaging,
      :postal,
      :orcid_pid,
      :rdf_type,
      :linkedin_url,
      :github_url,
      :codeberg_url,
      :location_iso_3166_1_alpha_2,
      :location_iso_3166_2,
      :location_postal_code,
      :location_latitude_as_decimal_degrees,
      :location_longitude_as_decimal_degrees,
      :note,
      :daisyui_timeline_html,
      :org_mode,
      :task_list_as_markdown,
      :ways_of_working_as_markdown,
      :objectives_and_key_results_as_markdown,
      :key_performance_indicators_as_markdown,
      :agents_as_markdown,
      :avatar_image_400x400_url,
      :avatar_image_400x400_alt,
      :main_image_1080x1080_url,
      :main_image_1080x1080_alt,
      :main_image_1920x1080_url,
      :main_image_1920x1080_alt,
      :main_image_1080x1920_url,
      :main_image_1080x1920_alt,
      :gs1_digital_link,
      :gs1_country_code,
      :gs1_global_location_number,
      :isic_v4_code,
      :isic_v4_name,
      :copyright_policy_as_url,
      :copyright_policy_as_markdown,
      :corrections_policy_as_url,
      :corrections_policy_as_markdown,
      :legal_policy_as_url,
      :legal_policy_as_markdown,
      :ethics_policy_as_url,
      :ethics_policy_as_markdown,
      :privacy_policy_as_url,
      :privacy_policy_as_markdown,
      :security_policy_as_url,
      :security_policy_as_markdown,
      :coordinated_disclosure_policy_as_url,
      :coordinated_disclosure_policy_as_markdown,
      :open_source_policy_as_url,
      :open_source_policy_as_markdown,
      :code_of_conduct_policy_as_url,
      :code_of_conduct_policy_as_markdown,
      :equal_opportunity_policy_as_url,
      :equal_opportunity_policy_as_markdown,
      :social_network_policy_as_url,
      :social_network_policy_as_markdown,
      :health_and_safety_policy_as_url,
      :health_and_safety_policy_as_markdown,
      :employee_handbook_policy_as_url,
      :employee_handbook_policy_as_markdown,
      :human_resources_policy_as_url,
      :human_resources_policy_as_markdown
    ]
  end

  attributes do
    uuid_primary_key :id
    attribute :created_at, :utc_datetime_usec
    attribute :updated_at, :utc_datetime_usec
    attribute :deleted_at, :utc_datetime_usec
    attribute :locale_code, :string
    attribute :name, :string
    attribute :status, :string
    attribute :tagging, :string
    attribute :url, :string
    attribute :email, :string
    attribute :phone, :string
    attribute :messaging, :string
    attribute :postal, :string
    attribute :orcid_pid, :string
    attribute :rdf_type, :string
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
    attribute :avatar_image_400x400_url, :string
    attribute :avatar_image_400x400_alt, :string
    attribute :main_image_1080x1080_url, :string
    attribute :main_image_1080x1080_alt, :string
    attribute :main_image_1920x1080_url, :string
    attribute :main_image_1920x1080_alt, :string
    attribute :main_image_1080x1920_url, :string
    attribute :main_image_1080x1920_alt, :string
    attribute :gs1_digital_link, :string
    attribute :gs1_country_code, :string
    attribute :gs1_global_location_number, :string
    attribute :isic_v4_code, :string
    attribute :isic_v4_name, :string
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
  end

  relationships do
    many_to_many :users, Navatrack.Accounts.User do
      through Navatrack.Accounts.UserGroupLink
      source_attribute_on_join_resource :group_id
      destination_attribute_on_join_resource :user_id
    end
  end
end
