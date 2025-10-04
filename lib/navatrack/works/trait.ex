defmodule Navatrack.Works.Trait do
  use Ash.Resource,
    otp_app: :navatrack,
    domain: Navatrack.Works,
    data_layer: AshPostgres.DataLayer

  def singular_snake_case(), do: "trait"
  def plural_snake_case(), do: "traits"
  def singular_title_case(), do: "Trait"
  def plural_title_case(), do: "Traits"

  postgres do
    table "traits"
    repo Navatrack.Repo
  end

  attributes do
    uuid_primary_key :id
    attribute :created_at, :utc_datetime_usec
    attribute :updated_at, :utc_datetime_usec
    attribute :deleted_at, :utc_datetime_usec
    attribute :sign, :string
    attribute :kind, :string
    attribute :name, :string
    attribute :status, :string
    attribute :tagging, :string
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

  actions do
 	  defaults [:create, :read, :update, :destroy]
    default_accept [
      :created_at,
      :updated_at,
      :deleted_at,
      :sign,
      :kind,
      :name,
      :status,
      :tagging,
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

end
