defmodule NavatrackWeb.Places.ShowTest do
  # import Phoenix.LiveViewTest
  use NavatrackWeb.ConnCase
  use NavatrackWeb.AuthCase
  alias Navatrack.Works.Place, as: X

  setup %{conn: conn} do
    {:ok, user} = my_user()
    {:ok, user} = my_sign_in(user)
    conn =
      conn
      |> Phoenix.ConnTest.init_test_session(%{})
      |> AshAuthentication.Plug.Helpers.store_in_session(user)

    {:ok, conn: conn}
  end

  test "show", %{conn: conn} do
    x = X.fab!
    conn = get(conn, ~p"/places/#{x.id}")
    response = html_response(conn, 200)

    assert response =~ "Places"

    assert response =~ "Id: #{x.id}"
    # assert response =~ "Created at: #{x.created_at}"
    # assert response =~ "Updated at: #{x.updated_at}"
    # assert response =~ "Retired at: #{x.retired_at}"
    assert response =~ "Locale code: #{x.locale_code}"
    assert response =~ "📛 Name: #{x.name}"
    assert response =~ "🚦 Sign: #{x.sign}"
    assert response =~ "📍 Status: #{x.status}"
    assert response =~ "🏷️ Tags: #{x.tagging}"

    assert response =~ "Contacts"
    assert response =~ "🌐 Web: #{x.web}"
    assert response =~ "📧 Email: #{x.email}"
    assert response =~ "📱 Phone: #{x.phone}"
    assert response =~ "💬 Chat: #{x.chat}"
    assert response =~ "🗓️ Calendar: #{x.calendar}"
    assert response =~ "📫 Postal: #{x.postal}"
    assert response =~ "🖇️ RDF Type: #{x.rdf_type}"

    assert response =~ "Socials"
    assert response =~ "Bluesky URL: <a href=\"#{x.bluesky_as_url}\">#{x.bluesky_as_url}</a>"
    assert response =~ "Codeberg URL: <a href=\"#{x.codeberg_as_url}\">#{x.codeberg_as_url}</a>"
    assert response =~ "GitHub URL: <a href=\"#{x.github_as_url}\">#{x.github_as_url}</a>"
    assert response =~ "Facebook URL: <a href=\"#{x.facebook_as_url}\">#{x.facebook_as_url}</a>"
    assert response =~ "Instagram URL: <a href=\"#{x.instagram_as_url}\">#{x.instagram_as_url}</a>"
    assert response =~ "LinkedIn URL: <a href=\"#{x.linkedin_as_url}\">#{x.linkedin_as_url}</a>"
    assert response =~ "Mastodon URL: <a href=\"#{x.mastodon_as_url}\">#{x.mastodon_as_url}</a>"
    assert response =~ "ORCID URL: <a href=\"#{x.orcid_as_url}\">#{x.orcid_as_url}</a>"
    assert response =~ "TikTok URL: <a href=\"#{x.tiktok_as_url}\">#{x.tiktok_as_url}</a>"
    assert response =~ "Wikipedia URL: <a href=\"#{x.wikipedia_as_url}\">#{x.wikipedia_as_url}</a>"
    assert response =~ "YouTube URL: <a href=\"#{x.youtube_as_url}\">#{x.youtube_as_url}</a>"

    assert response =~ "Location"
    assert response =~ "Country code ISO 3166-1 Alpha 2: #{x.location_iso_3166_1_alpha_2}"
    assert response =~ "Subcountry code ISO 3166-2: #{x.location_iso_3166_2}"
    assert response =~ "Postal code: #{x.location_postal_code}"
    assert response =~ "Latitude: #{x.location_latitude_as_decimal_degrees}"
    assert response =~ "Longitude: #{x.location_longitude_as_decimal_degrees}"
    assert response =~ "Altitude above ground level as meters: #{x.location_altitude_agl_as_meters}"
    assert response =~ "Altitude mean sea level as meters: #{x.location_altitude_msl_as_meters}"
    assert response =~ "Elevation above ground level as meters: #{x.location_elevation_agl_as_meters}"
    assert response =~ "Elevation mean sea level as meters: #{x.location_elevation_msl_as_meters}"
    assert response =~ "What3Words.com: #{x.location_what3words}"
    assert response =~ "WhatFreeWords.org: #{x.location_whatfreewords}"

    assert response =~ "Images"

    assert response =~ "Avatar image 400x400"
    assert response =~ "URL: <a href=\"#{x.avatar_image_400x400_url}\">#{x.avatar_image_400x400_url}</a>"
    assert response =~ "Alt: #{x.avatar_image_400x400_alt}"

    assert response =~ "Main image 1080x1080 square"
    assert response =~ "URL: <a href=\"#{x.main_image_1080x1080_url}\">#{x.main_image_1080x1080_url}</a>"
    assert response =~ "Alt: #{x.main_image_1080x1080_alt}"

    assert response =~ "Main image 1920x1080 landscape"
    assert response =~ "URL: <a href=\"#{x.main_image_1920x1080_url}\">#{x.main_image_1920x1080_url}</a>"
    assert response =~ "Alt: #{x.main_image_1920x1080_alt}"

    assert response =~ "Main image 1080x1920 portrait"
    assert response =~ "URL: <a href=\"#{x.main_image_1080x1920_url}\">#{x.main_image_1080x1920_url}</a>"
    assert response =~ "Alt: #{x.main_image_1080x1920_alt}"
  end

end
