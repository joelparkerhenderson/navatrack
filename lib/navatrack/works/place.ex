defmodule Navatrack.Works.Place do
  use Ash.Resource,
    otp_app: :navatrack,
    domain: Navatrack.Works,
    data_layer: AshPostgres.DataLayer

  def snake_case_singular(), do: "place"
  def snake_case_plural(), do: "places"
  def title_case_singular(), do: "Place"
  def title_case_plural(), do: "Places"

  postgres do
    table "places"
    repo Navatrack.Repo
  end

  actions do
    defaults [:read, :destroy, :create, :update]
    default_accept [
      ### meta
      :created_at,
      :updated_at,
      :retired_at,
      :locale_code,
      :parent_id,
      :parent_order,
      ### card
      :name,
      :sign,
      :status,
      :tagging,
      :note,
      ### contact
      :web,
      :email,
      :phone,
      :chat,
      :calendar,
      :postal,
      :rdf_type,
      ### social
      :bluesky_as_url,
      :codeberg_as_url,
      :facebook_as_url,
      :github_as_url,
      :instagram_as_url,
      :linkedin_as_url,
      :mastodon_as_url,
      :orcid_as_url,
      :tiktok_as_url,
      :wikipedia_as_url,
      :youtube_as_url,
      ### location
      :location_iso_3166_1_alpha_2,
      :location_iso_3166_2,
      :location_postal_code,
      :location_latitude_as_decimal_degrees,
      :location_longitude_as_decimal_degrees,
      :location_altitude_agl_as_meters,
      :location_altitude_msl_as_meters,
      :location_elevation_agl_as_meters,
      :location_elevation_msl_as_meters,
      :location_what3words,
      :location_whatfreewords,
      ### images
      :avatar_image_400x400_url,
      :avatar_image_400x400_alt,
      :main_image_1080x1080_url,
      :main_image_1080x1080_alt,
      :main_image_1920x1080_url,
      :main_image_1920x1080_alt,
      :main_image_1080x1920_url,
      :main_image_1080x1920_alt,
    ]
  end

  attributes do
    ### meta
    uuid_primary_key :id
    attribute :created_at, :utc_datetime_usec
    attribute :updated_at, :utc_datetime_usec
    attribute :retired_at, :utc_datetime_usec
    attribute :locale_code, :string
    attribute :name, :string
    attribute :sign, :string
    attribute :status, :string
    attribute :tagging, :string
    attribute :note, :string
    attribute :parent_id, :uuid
    attribute :parent_order, :integer
    attribute :web, :string
    attribute :email, :string
    attribute :phone, :string
    attribute :chat, :string
    attribute :calendar, :string
    attribute :postal, :string
    attribute :rdf_type, :string
    attribute :bluesky_as_url, :string
    attribute :codeberg_as_url, :string
    attribute :facebook_as_url, :string
    attribute :github_as_url, :string
    attribute :instagram_as_url, :string
    attribute :linkedin_as_url, :string
    attribute :mastodon_as_url, :string
    attribute :orcid_as_url, :string
    attribute :tiktok_as_url, :string
    attribute :wikipedia_as_url, :string
    attribute :youtube_as_url, :string
    attribute :location_iso_3166_1_alpha_2, :string
    attribute :location_iso_3166_2, :string
    attribute :location_postal_code, :string
    attribute :location_latitude_as_decimal_degrees, :decimal
    attribute :location_longitude_as_decimal_degrees, :decimal
    attribute :location_altitude_agl_as_meters, :decimal
    attribute :location_altitude_msl_as_meters, :decimal
    attribute :location_elevation_agl_as_meters, :decimal
    attribute :location_elevation_msl_as_meters, :decimal
    attribute :location_what3words, :string
    attribute :location_whatfreewords, :string
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
  end

  def fab!(map \\ %{}) do
    __MODULE__ |> Ash.Changeset.for_create(:create, __MODULE__.fab_map(map)) |> Ash.create!()
  end

  def fab_map(map \\ %{}) do
    Map.merge(
      %{
        ### meta
        locale_code: "en-US",
        parent_id: nil,
        parent_order: nil,
        ### card
        name: "my-name",
        sign: "○",
        status: "my-status",
        tagging: "my-tagging",
        note: "my-note",
        ### contact
        web: "https://my-web",
        email: "my-email@example.com",
        phone: "my-phone",
        chat: "my-chat",
        calendar: "my-calendar",
        postal: "my-postal",
        rdf_type: "my-rdf-type",
        ### social
        bluesky_as_url: "https://bsky.app/profile/my-handle",
        codeberg_as_url: "https://codeberg.org/in/my-handle",
        facebook_as_url: "https://facebook.com/my-handle",
        github_as_url: "https://github.com/in/my-handle",
        instagram_as_url: "https://instagram.com/my-handle",
        linkedin_as_url: "https://linkedin.com/in/my-handle",
        mastodon_as_url: "https://mastodon.social/@my-handle",
        orcid_as_url: "https://orcid.org/my-handle",
        tiktok_as_url: "https://tiktok.com/my-handle",
        wikipedia_as_url: "https://wikipedia.org/my-handle",
        youtube_as_url: "https://youtube.com/my-handle",
        ### location
        location_iso_3166_1_alpha_2: "my",
        location_iso_3166_2: "my-location-iso-3166-2",
        location_postal_code: "my-postal-code",
        location_latitude_as_decimal_degrees: "1.2",
        location_longitude_as_decimal_degrees: "3.4",
        location_altitude_agl_as_meters: "5.6",
        location_altitude_msl_as_meters: "7.8",
        location_elevation_agl_as_meters: "9.0",
        location_elevation_msl_as_meters: "11.12",
        location_what3words: "my.what3words.location",
        location_whatfreewords: "my.whatfreewords.location",
        ### images
        avatar_image_400x400_url: "https://my-avatar-image-400x400-url",
        avatar_image_400x400_alt: "my-avatar-image-400x400-alt",
        main_image_1080x1080_url: "https://my-main-image-1080x1080-url",
        main_image_1080x1080_alt: "my-main-image-1080x1080-alt",
        main_image_1920x1080_url: "https://my-main-image-1920x1080-url",
        main_image_1920x1080_alt: "my-main-image-1920x1080-alt",
        main_image_1080x1920_url: "https://my-main-image-1080x1920-url",
        main_image_1080x1920_alt: "my-main-image-1080x1920-alt"
      },
      map
    )
  end

end
