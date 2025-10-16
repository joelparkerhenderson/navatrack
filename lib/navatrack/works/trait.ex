defmodule Navatrack.Works.Trait do
  use Ash.Resource,
    otp_app: :navatrack,
    domain: Navatrack.Works,
    data_layer: AshPostgres.DataLayer

  def snake_case_singular(), do: "trait"
  def snake_case_plural(), do: "traits"
  def title_case_singular(), do: "Trait"
  def title_case_plural(), do: "Traits"

  postgres do
    table "traits"
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
      :sign,
      :status,
      :tagging,
      :note,
      :summary_as_markdown,
      :description_as_markdown,
      :avatar_image_400x400_url,
      :avatar_image_400x400_alt,
      :main_image_1080x1080_url,
      :main_image_1080x1080_alt,
      :main_image_1920x1080_url,
      :main_image_1920x1080_alt,
      :main_image_1080x1920_url,
      :main_image_1080x1920_alt
    ]
  end

  attributes do
    uuid_primary_key :id
    attribute :created_at, :utc_datetime_usec
    attribute :updated_at, :utc_datetime_usec
    attribute :deleted_at, :utc_datetime_usec
    attribute :locale_code, :string
    attribute :name, :string
    attribute :sign, :string
    attribute :status, :string
    attribute :tagging, :string
    attribute :note, :string
    attribute :summary_as_markdown, :string
    attribute :description_as_markdown, :string
    attribute :avatar_image_400x400_url, :string
    attribute :avatar_image_400x400_alt, :string
    attribute :main_image_1080x1080_url, :string
    attribute :main_image_1080x1080_alt, :string
    attribute :main_image_1920x1080_url, :string
    attribute :main_image_1920x1080_alt, :string
    attribute :main_image_1080x1920_url, :string
    attribute :main_image_1080x1920_alt, :string
  end

  relationships do
    many_to_many :users, Navatrack.Accounts.User do
      through Navatrack.Accounts.UserTraitLink
      source_attribute_on_join_resource :trait_id
      destination_attribute_on_join_resource :user_id
    end
  end

end
