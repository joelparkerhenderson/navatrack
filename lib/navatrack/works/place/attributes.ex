defmodule Navatrack.Works.Place.Attributes do
  use Spark.Dsl.Fragment, of: Ash.Resource

  attributes do

    ### meta

    uuid_primary_key :id

    attribute :created_at, :utc_datetime_usec do
      description "Created at UTC datetime in microseconds"
    end

    attribute :updated_at, :utc_datetime_usec do
      description "Updated at UTC datetime in microseconds"
    end

    attribute :retired_at, :utc_datetime_usec do
      description "Updated at UTC datetime in microseconds"
    end

    attribute :locale_code, :string do
      description "Locale code"
    end

    attribute :name, :string do
      description "Name"
    end

    attribute :sign, :string do
      description "Sign emoji character"
    end

    attribute :status, :string do
      description "Status text"
    end

    attribute :tagging, :string do
      description "Tagging text with hashtags such as #alfa #bravo #charlie"
    end

    attribute :note, :string do
      description "Note text"
    end

    attribute :parent_id, :uuid do
      description "Parent id"
    end

    attribute :parent_order, :integer do
      description "Parent order"
    end

    attribute :web, :string do
      description "Web URL"
    end

    attribute :email, :string do
      description "Email address"
    end

    attribute :phone, :string do
      description "Phone number"
    end

    attribute :chat, :string do
      description "Chat URL suitable for instant messaging"
    end

    attribute :calendar, :string do
      description "Calendar URL suitable for scheduling"
    end

    attribute :postal, :string do
      description "Postal address suitable for mail"
    end

    attribute :rdf_type, :string do
      description "RDF type suitable for categorization"
    end

    ### social

    attribute :bluesky_as_url, :string do
      description "Bluesky URL"
    end

    attribute :codeberg_as_url, :string do
      description "Codeberg URL"
    end

    attribute :facebook_as_url, :string do
      description "Bluesky URL"
    end

    attribute :github_as_url, :string do
      description "GitHub URL"
    end

    attribute :instagram_as_url, :string do
      description "Instagram URL"
    end

    attribute :linkedin_as_url, :string do
      description "Instagram URL"
    end

    attribute :mastodon_as_url, :string do
      description "Mastodon URL"
    end

    attribute :orcid_as_url, :string do
      description "ORCID URL"
    end

    attribute :tiktok_as_url, :string do
      description "Tiktok URL"
    end

    attribute :wikipedia_as_url, :string do
      description "Wikipedia URL"
    end

    attribute :youtube_as_url, :string do
      description "Youtube URL"
    end

    ### location

    attribute :location_iso_3166_1_alpha_2, :string do
      description "Location ISO 3166-1 alpha-2 code"
    end

    attribute :location_iso_3166_2, :string do
      description "Location ISO 3166-2 code"
    end

    attribute :location_postal_code, :string do
      description "Location postal code"
    end

    attribute :location_latitude_as_decimal_degrees, :decimal do
      description "Location latitude as decimal degrees"
    end

    attribute :location_longitude_as_decimal_degrees, :decimal do
      description "Location longitude as decimal degrees"
    end

    attribute :location_altitude_agl_as_meters, :decimal do
      description "Location altitude above ground level (agl) as meters"
    end

    attribute :location_altitude_msl_as_meters, :decimal do
      description "Location altitude mean sea level (msl) as meters"
    end

    attribute :location_elevation_agl_as_meters, :decimal do
      description "Location elevation above ground level (agl) as meters"
    end

    attribute :location_elevation_msl_as_meters, :decimal do
      description "Location elevation mean sea level (msl) as meters"
    end

    attribute :location_what3words, :string do
      description "Location what3words.com"
    end

    attribute :location_whatfreewords, :string do
      description "Location whatfreewords.com"
    end

    ### images

    attribute :avatar_image_400x400_url, :string do
      description "Avatar image 400x400 URL"
    end

    attribute :avatar_image_400x400_alt, :string do
      description "Avatar image 400x400 alt text"
    end

    attribute :main_image_1080x1080_url, :string do
      description "Main image 1080x1080 URL"
    end

    attribute :main_image_1080x1080_alt, :string do
      description "Main image 1080x1080 alt text"
    end

    attribute :main_image_1920x1080_url, :string do
      description "Main image 1920x1080 URL"
    end

    attribute :main_image_1920x1080_alt, :string do
      description "Main image 1920x1080 alt text"
    end

    attribute :main_image_1080x1920_url, :string do
      description "Main image 1080x1920 URL"
    end

    attribute :main_image_1080x1920_alt, :string do
      description "Main image 1080x1920 alt text"
    end

  end

end
