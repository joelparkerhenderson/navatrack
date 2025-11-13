defmodule NavatrackWeb.Users.NewTest do
  # import Phoenix.LiveViewTest
  use NavatrackWeb.ConnCase
  use NavatrackWeb.AuthCase
  # alias Navatrack.Accounts.User, as: X

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
    {:ok, lv, _html} = live(conn, ~p"/users/new")

    response = html_response(conn, 200)
    assert response =~ "Users"
    assert response =~ "📛 Name"
    assert response =~ "🚦 Sign"
    assert response =~ "📍 Status"
    assert response =~ "🏷️ Tags"
    assert response =~ "🗒️ Note"

    assert response =~ "Contacts"
    assert response =~ "🔗 URL"
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

    assert response =~ "Images"
    assert response =~ "Avatar image 400x400"
    assert response =~ "Main image 1080x1080 square"
    assert response =~ "Main image 1920x1080 landscape"
    assert response =~ "Main image 1080x1920 portrait"

    assert response =~ "Ideals"
    assert response =~ "Purpose Statement"
    assert response =~ "Vision Statement"
    assert response =~ "Mission Statement"
    assert response =~ "Values Statement"

    assert response =~ "AI Agent Instructions"

    assert response =~ "Deeper Dive"
    assert response =~ "Email distribution list"
    assert response =~ "DaisyUI timeline HTML"
    assert response =~ "Org Mode"
    assert response =~ "Task list as markdown"
    assert response =~ "Ways Of Working"
    assert response =~ "Objectives and Key Results (OKRs)"
    assert response =~ "Key Performance Indicators (KPIs)"

    assert response =~ "Work Profile"
    assert response =~ "Résumé"
    assert response =~ "Curriculum Vitae"

    assert response =~ "Work Role"
    assert response =~ "Summary"
    assert response =~ "Role Name/Title/etc."
    assert response =~ "Role Level/Grade/etc."
    assert response =~ "Description"
    assert response =~ "Professional Development Aim"
    assert response =~ "Dates"
    assert response =~ "Start Date"
    assert response =~ "Stop Date"
    assert response =~ "Work Codes"
    assert response =~ "O*NET SOC 2019"
    assert response =~ "United Kingdom (UK) Civil Service Grade Abbreviation"
    assert response =~ "United Kingdom (UK) Standard Occupational Classification (SOC) 2020 Code Service Grade Abbreviation"
    assert response =~ "United Kingdom (UK) Government Digital and Data (GDAD) Profession Capability Framework (PCF) URL"

    x = X.fab!

    result =
      lv
      |> form("#x_form", %{
        "form[name]" => x.name
      })
      |> render_submit()

    case result do
      {:error, {:live_redirect, %{to: path}}} ->
        assert path == "/users"
      html when is_binary(html) ->
        assert html =~ "📛"
      other ->
        flunk("Unexpected result: #{inspect(other)}")
    end
  end

end
