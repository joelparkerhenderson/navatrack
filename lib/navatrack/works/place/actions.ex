defmodule Navatrack.Works.Place.Actions do
  use Spark.Dsl.Fragment, of: Ash.Resource

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

end
