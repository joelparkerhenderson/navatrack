defmodule NavatrackWeb.Users.ShowTest do
  import Phoenix.LiveViewTest
  use NavatrackWeb.ConnCase
  use NavatrackWeb.AuthCase
  alias Navatrack.Accounts.User, as: X

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
    conn = get(conn, ~p"/users/#{x.id}")
    response = html_response(conn, 200)

    assert response =~ "Users"

    assert response =~ "Id: #{x.id}"
    # assert response =~ "Created at: #{x.created_at}"
    # assert response =~ "Updated at: #{x.updated_at}"
    # assert response =~ "Deleted at: #{x.deleted_at}"
    assert response =~ "Locale code: #{x.locale_code}"
    assert response =~ "📛 Name: #{x.name}"
    assert response =~ "🚦 Sign: #{x.sign}"
    assert response =~ "📍 Status: #{x.status}"
    assert response =~ "🏷️ Tags: #{x.tagging}"
    assert response =~ "🗒️ Note: #{x.note}"

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
    assert response =~ "Facebook URL: <a href=\"#{x.facebook_as_url}\">#{x.facebook_as_url}</a>"
    assert response =~ "GitHub URL: <a href=\"#{x.github_as_url}\">#{x.github_as_url}</a>"
    assert response =~ "Instagram URL: <a href=\"#{x.instagram_as_url}\">#{x.instagram_as_url}</a>"
    assert response =~ "LinkedIn URL: <a href=\"#{x.linkedin_as_url}\">#{x.linkedin_as_url}</a>"
    assert response =~ "Mastodon URL: <a href=\"#{x.mastodon_as_url}\">#{x.mastodon_as_url}</a>"
    assert response =~ "ORCID URL: <a href=\"#{x.orcid_as_url}\">#{x.orcid_as_url}</a>"
    assert response =~ "TikTok URL: <a href=\"#{x.tiktok_as_url}\">#{x.tiktok_as_url}</a>"
    assert response =~ "Wikipedia URL: <a href=\"#{x.wikipedia_as_url}\">#{x.wikipedia_as_url}</a>"
    assert response =~ "YouTube URL: <a href=\"#{x.youtube_as_url}\">#{x.youtube_as_url}</a>"

    assert response =~ "Location"

    assert response =~ "ISO 3166-1 alpha 2: #{x.location_iso_3166_1_alpha_2}"
    assert response =~ "ISO 3166-2: #{x.location_iso_3166_2}"
    assert response =~ "Postal code: #{x.location_postal_code}"
    assert response =~ "Latitude as decimal degrees: #{x.location_latitude_as_decimal_degrees}"
    assert response =~ "Longitude as decimal degrees: #{x.location_longitude_as_decimal_degrees}"

    assert response =~ "Deeper Dive"

    assert response =~ "Email distribution list: #{x.email_distribution_list}"
    assert response =~ "DaisyUI timeline HTML: #{x.daisyui_timeline_html}"
    assert response =~ "Org mode: #{x.org_mode}"
    assert response =~ "Task list as markdown: #{x.task_list_as_markdown}"
    assert response =~ "Ways of working as markdown: #{x.ways_of_working_as_markdown}"
    assert response =~ "Objectives and Key Results (OKRs) as markdown: #{x.objectives_and_key_results_as_markdown}"
    assert response =~ "Key Performance Indicators (KPIs) as markdown: #{x.key_performance_indicators_as_markdown}"

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

    assert response =~ "Ideals"
    assert response =~ "Purpose Statement: #{x.purpose_statement}"
    assert response =~ "Vision Statement: #{x.vision_statement}"
    assert response =~ "Mission Statement: #{x.mission_statement}"
    assert response =~ "Values Statement: #{x.values_statement}"

    assert response =~ "AI Agent Instructions"
    assert response =~ "URL: <a href=\"#{x.ai_agent_instructions_as_url}\">#{x.ai_agent_instructions_as_url}</a>"
    assert response =~ "Markdown: #{x.ai_agent_instructions_as_markdown}"

    assert response =~ "Work Profile"

    assert response =~ "Résumé as PDF URL: <a href=\"#{x.work_profile_resume_as_pdf_url}\">#{x.work_profile_resume_as_pdf_url}</a>"
    assert response =~ "Résumé as markdown: #{x.work_profile_resume_as_markdown}"
    assert response =~ "Curriculum vitae as PDF URL: <a href=\"#{x.work_profile_curriculum_vitae_as_pdf_url}\">#{x.work_profile_curriculum_vitae_as_pdf_url}</a>"
    assert response =~ "Curriculum vitae as markdown: #{x.work_profile_curriculum_vitae_as_markdown}"

    assert response =~ "Work Role"

    assert response =~ "Name: #{x.work_role_name}"
    assert response =~ "Start date: #{x.work_role_start_date}"
    assert response =~ "Stop date: #{x.work_role_stop_date}"
    assert response =~ "Level: #{x.work_role_level}"
    assert response =~ "Description as markdown: #{x.work_role_description_as_markdown}"
    assert response =~ "Professional development aim as markdown: #{x.work_role_professional_development_plan_as_markdown}"
    assert response =~ "Onet SOC 2019 code: #{x.work_role_onet_soc_2019_code}"
    assert response =~ "UK Civil Service Grade abbreviation: #{x.work_role_uk_civil_service_grade_abbreviation}"
    assert response =~ "UK SOC 2020 code: #{x.work_role_uk_soc_2020_code}"
    assert response =~ "UK GDAD PCF URL: <a href=\"#{x.work_role_uk_gdad_pcf_url}\">#{x.work_role_uk_gdad_pcf_url}</a>"
  end

  test "create", %{conn: conn} do
    {:ok, lv, _html} = live(conn, ~p"/users/new")

    result =
      lv
      |> form("#x_form", %{
        "form[name]" => "alfa"
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
