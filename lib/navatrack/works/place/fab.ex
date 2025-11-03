defmodule Navatrack.Works.Place.Fab do
  defmacro __using__(_opts) do
    quote do

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
  end
end
