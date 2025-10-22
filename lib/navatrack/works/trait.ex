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
      ### meta
      :created_at,
      :updated_at,
      :deleted_at,
      :locale_code,
      :parent_id,
      :parent_order,
      ### card
      :name,
      :sign,
      :status,
      :tagging,
      :note,
      ### content
      :summary_as_markdown,
      :description_as_markdown,
      ### avatar
      :avatar_image_400x400_url,
      :avatar_image_400x400_alt,
      ### main image
      :main_image_1080x1080_url,
      :main_image_1080x1080_alt,
      :main_image_1920x1080_url,
      :main_image_1920x1080_alt,
      :main_image_1080x1920_url,
      :main_image_1080x1920_alt
    ]
  end

  attributes do
    ### meta
    uuid_primary_key :id
    attribute :created_at, :utc_datetime_usec
    attribute :updated_at, :utc_datetime_usec
    attribute :deleted_at, :utc_datetime_usec
    attribute :locale_code, :string
    attribute :parent_id, :uuid
    attribute :parent_order, :integer
    ### card
    attribute :name, :string
    attribute :sign, :string
    attribute :status, :string
    attribute :tagging, :string
    attribute :note, :string
    ### content
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

    belongs_to :parent, __MODULE__, allow_nil?: true

    many_to_many :users, Navatrack.Accounts.User do
      through Navatrack.Accounts.UserTraitLink
      source_attribute_on_join_resource :trait_id
      destination_attribute_on_join_resource :user_id
    end

  end

  def fab!(map \\ %{}) do
    __MODULE__ |> Ash.Changeset.for_create(:create, __MODULE__.fab_map(map)) |> Ash.create!()
  end

  def fab_map(map \\ %{}) do
    Map.merge(
      %{
        locale_code: "en-US",
        parent_id: nil,
        parent_order: nil,
        ### card
        name: "my-name",
        sign: "○",
        status: "my-status",
        tagging: "my-tagging",
        note: "my-note",
        summary_as_markdown: "summary-as-markdown",
        description_as_markdown: "description-as-markdown",
        avatar_image_400x400_url: "https://my-avatar-image-400x400-url",
        avatar_image_400x400_alt: "my-avatar-image-400x400-alt",
        main_image_1080x1080_url: "https://my-main-image-1080x1080-url",
        main_image_1080x1080_alt: "my-main-image-1080x1080-alt",
        main_image_1920x1080_url: "https://my-main-image-1920x1080-url",
        main_image_1920x1080_alt: "my-main-image-1920x1080-alt",
        main_image_1080x1920_url: "https://my-main-image-1080x1920-url",
        main_image_1080x1920_alt: "my-main-image-1080x1920-alt",
      },
      map
    )
  end

end
