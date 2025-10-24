defmodule NavatrackWeb.Places.NewTest do
  # import Phoenix.LiveViewTest
  use NavatrackWeb.ConnCase
  use NavatrackWeb.AuthCase
  # alias Navatrack.Works.Place, as: X

  setup %{conn: conn} do
    {:ok, user} = my_user()
    {:ok, user} = my_sign_in(user)
    conn =
      conn
      |> Phoenix.ConnTest.init_test_session(%{})
      |> AshAuthentication.Plug.Helpers.store_in_session(user)

    {:ok, conn: conn}
  end

  test "new", %{conn: conn} do
    conn = get(conn, ~p"/places/new")
    response = html_response(conn, 200)

    assert response =~ "Place"
    assert response =~ "📛 Name"
    assert response =~ "🚦 Sign"
    assert response =~ "📍 Status"
    assert response =~ "🏷️ Tags"
    assert response =~ "🗒️ Note"

    assert response =~ "Contacts"
    assert response =~ "🌐 Web"
    assert response =~ "📧 Email"
    assert response =~ "📱 Phone"
    assert response =~ "💬 Chat"
    assert response =~ "🗓️ Calendar"
    assert response =~ "📫 Postal"
    assert response =~ "🖇️ RDF Type"

    assert response =~ "Socials"
    assert response =~ "Bluesky URL"
    assert response =~ "Codeberg URL"
    assert response =~ "Facebook URL"
    assert response =~ "GitHub URL"
    assert response =~ "Instagram URL"
    assert response =~ "LinkedIn URL"
    assert response =~ "Mastodon URL"
    assert response =~ "ORCID URL"
    assert response =~ "TikTok URL"
    assert response =~ "Wikipedia URL"
    assert response =~ "YouTube URL"

    assert response =~ "Location"
    assert response =~ "Country code (ISO 3166-1 Alpha 2)"
    assert response =~ "Subcountry code (ISO 3166-2)"
    assert response =~ "Postal code"
    assert response =~ "Latitude"
    assert response =~ "Longitude"
    assert response =~ "Longitude"
    assert response =~ "Altitude above ground level as meters"
    assert response =~ "Altitude mean sea level as meters"
    assert response =~ "Elevation above ground level as meters"
    assert response =~ "Elevation mean sea level as meters"
    assert response =~ "What3Words.com"
    assert response =~ "WhatFreeWords.org"

    assert response =~ "Images"
    assert response =~ "Avatar image 400x400"
    assert response =~ "Main image 1080x1080 square"
    assert response =~ "Main image 1920x1080 landscape"
    assert response =~ "Main image 1080x1920 portrait"

    assert response =~ "Images"
    assert response =~ "Avatar image 400x400"
    assert response =~ "Main image 1080x1080 square"
    assert response =~ "Main image 1920x1080 landscape"
    assert response =~ "Main image 1080x1920 portrait"

  end

end
