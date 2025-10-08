defmodule NavatrackWeb.UsersTest do
  import Phoenix.LiveViewTest
  use NavatrackWeb.ConnCase
  use NavatrackWeb.AuthCase
  alias Navatrack.Accounts.User, as: X

  defp x! do
    X
      |> Ash.Changeset.for_create(:create, %{
        locale_code: "en-US",
        name: "my-name",
        status: "my-status",
        tagging: "my-tagging",
        url: "https://my-url",
        email: "my-email@example.com",
        phone: "my-phone",
        messaging: "my-messaging",
        postal: "my-postal",
        orcid_pid: "my-orchid-pid",
        rdf_type: "my-rdf-type",
        linkedin_url: "https://linkedin.com/in/my-handle",
        github_url: "https://github.com/in/my-handle",
        codeberg_url: "https://codeberg.org/in/my-handle",
        location_iso_3166_1_alpha_2: "my",
        location_iso_3166_2: "my-location-iso-3166-2",
        location_postal_code: "my-postal-code",
        location_latitude_as_decimal_degrees: "1.2",
        location_longitude_as_decimal_degrees: "3.4",
        note: "my-note",
        daisyui_timeline_html: "my-daisyui-timeline-html",
        org_mode: "my-org-mode",
        task_list_as_markdown: "my-task-list-as-markdown",
        ways_of_working_as_markdown: "my-ways-of-working-as-markdown",
        objectives_and_key_results_as_markdown: "my-objectives-and-key-results-as-markdown",
        key_performance_indicators_as_markdown: "my-key-performance-indicators-as-markdown",
        agents_as_url: "https://my-agents-as-markdown",
        agents_as_markdown: "my-agents-as-markdown",
        avatar_image_400x400_url: "https://my-avatar-image-400x400-url",
        avatar_image_400x400_alt: "my-avatar-image-400x400-alt",
        main_image_1080x1080_url: "https://my-main-image-1080x1080-url",
        main_image_1080x1080_alt: "my-main-image-1080x1080-alt",
        main_image_1920x1080_url: "https://my-main-image-1920x1080-url",
        main_image_1920x1080_alt: "my-main-image-1920x1080-alt",
        main_image_1080x1920_url: "https://my-main-image-1080x1920-url",
        main_image_1080x1920_alt: "my-main-image-1080x1920-alt",
        work_profile_resume_as_pdf_url: "https://my-work-profile-resume-as-pdf-url",
        work_profile_resume_as_markdown: "my-work-profile-resume-as-markdown",
        work_profile_curriculum_vitae_as_pdf_url: "https://my-work-profile-curriculum-vitae-as-pdf-url",
        work_profile_curriculum_vitae_as_markdown: "my-work-profile-curriculum-vitae-as-markdown",
        work_role_name: "my-work-role-name",
        work_role_start_date:  Date.from_iso8601!("1970-01-01"),
        work_role_stop_date: Date.from_iso8601!("1970-01-01"),
        work_role_level: "my-work-role-level",
        work_role_description_as_markdown: "my-work-role-description-as-markdown",
        work_role_professional_development_plan_as_markdown: "my-work-role-professional-development-plan-as-markdown",
        work_role_onet_soc_2019_code: "my-work-role-onet-soc-2019-code",
        work_role_uk_civil_service_grade_abbreviation: "my-work-role-uk-civil-service-grade-abbreviation",
        work_role_uk_soc_2020_code: "my-work-role-uk-soc-2020-code",
        work_role_uk_gdad_pcf_url: "https://my-work-role-uk-gdad-pcf-url",
      })
    |> Ash.create!()
  end

  setup %{conn: conn} do
    {:ok, user} = my_user()
    {:ok, user} = my_sign_in(user)

    conn =
      conn
      |> Phoenix.ConnTest.init_test_session(%{})
      |> AshAuthentication.Plug.Helpers.store_in_session(user)

    {:ok, conn: conn}
  end

  test "index", %{conn: conn} do
    conn = get(conn, ~p"/users")
    response = html_response(conn, 200)
    assert response =~ "Users"
    assert response =~ "📛 Name"
    assert response =~ "🚦 Status"
    assert response =~ "🏷️ Tags"
    assert response =~ "🔗 URL"
    assert response =~ "📧 Email"
    assert response =~ "📱 Phone"
    assert response =~ "🌎 Country"
    assert response =~ "👷 Work Role"
  end

  test "new", %{conn: conn} do
    conn = get(conn, ~p"/users/new")
    response = html_response(conn, 200)
    assert response =~ "Users"
    assert response =~ "📛 Name"
    assert response =~ "🚦 Status"
    assert response =~ "🏷️ Tags"
    assert response =~ "Contacts"
    assert response =~ "🔗 URL"
    assert response =~ "📧 Email"
    assert response =~ "📱 Phone"
    assert response =~ "💬 Messaging"
    assert response =~ "📫 Postal"
    assert response =~ "🌺 ORCID PID"
    assert response =~ "🖇️ RDF Type"
    assert response =~ "Socials"
    assert response =~ "LinkedIn URL"
    assert response =~ "GitHub URL"
    assert response =~ "Codeberg URL"
    assert response =~ "Locations"
    assert response =~ "Country code (ISO 3166-1 Alpha 2)"
    assert response =~ "Subcountry code (ISO 3166-2)"
    assert response =~ "Postal code"
    assert response =~ "Latitude"
    assert response =~ "Longitude"
    assert response =~ "AGENTS.md"
    assert response =~ "URL"
    assert response =~ "Markdown"
    assert response =~ "Images"
    assert response =~ "Avatar image 400x400"
    assert response =~ "Main image 1080x1080 square"
    assert response =~ "Main image 1920x1080 landscape"
    assert response =~ "Main image 1080x1920 portrait"
    assert response =~ "Deeper Dive"
    assert response =~ "Note"
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
    assert response =~ "Professional Development Plan"
    assert response =~ "Dates"
    assert response =~ "Start Date"
    assert response =~ "Stop Date"
    assert response =~ "Work Codes"
    assert response =~ "O*NET SOC 2019"
    assert response =~ "United Kingdom (UK) Civil Service Grade Abbreviation"
    assert response =~ "United Kingdom (UK) Standard Occupational Classification (SOC) 2020 Code Service Grade Abbreviation"
    assert response =~ "United Kingdom (UK) Government Digital and Data (GDAD) Profession Capability Framework (PCF) URL"
  end

  test "show", %{conn: conn} do
    x = x!()
    conn = get(conn, ~p"/users/#{x.id}")
    response = html_response(conn, 200)
    assert response =~ "Users"
    assert response =~ "Id: #{x.id}"
    # assert response =~ "Created at: #{x.created_at}"
    # assert response =~ "Updated at: #{x.updated_at}"
    # assert response =~ "Deleted at: #{x.deleted_at}"
    assert response =~ "Locale code: #{x.locale_code}"
    assert response =~ "Name: #{x.name}"
    assert response =~ "Status: #{x.status}"
    assert response =~ "Tagging: #{x.tagging}"
    assert response =~ "URL: #{x.url}"

    assert response =~ "Contact"

    assert response =~ "Email: #{x.email}"
    assert response =~ "Phone: #{x.phone}"
    assert response =~ "Messaging: #{x.messaging}"
    assert response =~ "Postal: #{x.postal}"
    assert response =~ "ORCID PID: #{x.orcid_pid}"
    assert response =~ "RDF type: #{x.rdf_type}"
    assert response =~ "LinkedIn URL: #{x.linkedin_url}"
    assert response =~ "GitHub URL: #{x.github_url}"
    assert response =~ "Codeberg URL: #{x.codeberg_url}"

    assert response =~ "Location"

    assert response =~ "ISO 3166-1 alpha 2: #{x.location_iso_3166_1_alpha_2}"
    assert response =~ "ISO 3166-2: #{x.location_iso_3166_2}"
    assert response =~ "Postal code: #{x.location_postal_code}"
    assert response =~ "Latitude as decimal degrees: #{x.location_latitude_as_decimal_degrees}"
    assert response =~ "Longitude as decimal degrees: #{x.location_longitude_as_decimal_degrees}"

    assert response =~ "About"

    assert response =~ "Note: #{x.note}"
    assert response =~ "DaisyUI timeline HTML: #{x.daisyui_timeline_html}"
    assert response =~ "Org mode: #{x.org_mode}"
    assert response =~ "Task list as markdown: #{x.task_list_as_markdown}"
    assert response =~ "Ways of working as markdown: #{x.ways_of_working_as_markdown}"
    assert response =~ "Objectives and Key Results (OKRs) as markdown: #{x.objectives_and_key_results_as_markdown}"
    assert response =~ "Key Performance Indicators (KPIs) as markdown: #{x.key_performance_indicators_as_markdown}"

    assert response =~ "AGENTS.md"

    assert response =~ "URL: #{x.agents_as_url}"
    assert response =~ "Markdown: #{x.agents_as_markdown}"

    assert response =~ "Images"

    assert response =~ "Avatar image 400x400 url: #{x.avatar_image_400x400_url}"
    assert response =~ "Avatar image 400x400 alt: #{x.avatar_image_400x400_alt}"
    assert response =~ "Main image 1080x1080 url: #{x.main_image_1080x1080_url}"
    assert response =~ "Main image 1080x1080 alt: #{x.main_image_1080x1080_alt}"
    assert response =~ "Main image 1920x1080 url: #{x.main_image_1920x1080_url}"
    assert response =~ "Main image 1920x1080 alt: #{x.main_image_1920x1080_alt}"
    assert response =~ "Main image 1080x1920 url: #{x.main_image_1080x1920_url}"
    assert response =~ "Main image 1080x1920 alt: #{x.main_image_1080x1920_alt}"

    assert response =~ "Work Profile"

    assert response =~ "Résumé as PDF URL: #{x.work_profile_resume_as_pdf_url}"
    assert response =~ "Résumé as markdown: #{x.work_profile_resume_as_markdown}"
    assert response =~ "Curriculum vitae as PDF URL: #{x.work_profile_curriculum_vitae_as_pdf_url}"
    assert response =~ "Curriculum vitae as markdown: #{x.work_profile_curriculum_vitae_as_markdown}"

    assert response =~ "Work Role"

    assert response =~ "Name: #{x.work_role_name}"
    assert response =~ "Start date: #{x.work_role_start_date}"
    assert response =~ "Stop date: #{x.work_role_stop_date}"
    assert response =~ "Level: #{x.work_role_level}"
    assert response =~ "Description as markdown: #{x.work_role_description_as_markdown}"
    assert response =~ "Professional development plan as markdown: #{x.work_role_professional_development_plan_as_markdown}"
    assert response =~ "Onet SOC 2019 code: #{x.work_role_onet_soc_2019_code}"
    assert response =~ "UK Civil Service Grade abbreviation: #{x.work_role_uk_civil_service_grade_abbreviation}"
    assert response =~ "UK SOC 2020 code: #{x.work_role_uk_soc_2020_code}"
    assert response =~ "UK GDAD PCF URL: #{x.work_role_uk_gdad_pcf_url}"
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
        assert html =~ "Users"

      other ->
        flunk("Unexpected result: #{inspect(other)}")
    end
  end

end
