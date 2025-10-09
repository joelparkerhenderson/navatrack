defmodule NavatrackWeb.GroupsTest do
  import Phoenix.LiveViewTest
  use NavatrackWeb.ConnCase
  use NavatrackWeb.AuthCase
  alias Navatrack.Works.Group, as: X

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
        gs1_digital_link: "my-gs1-digital-link",
        gs1_country_code: "my-gs1-country-code",
        gs1_global_location_number: "my-gs1-global-location-number",
        isic_v4_code: "my-isic-v4-code",
        isic_v4_name: "my-isic-v4-name",
        copyright_policy_as_url: "https://my-copyright-policy-as-url",
        copyright_policy_as_markdown: "my-copyright-policy-as-markdown",
        corrections_policy_as_url: "https://my-corrections-policy-as-url",
        corrections_policy_as_markdown: "my-corrections-policy-as-markdown",
        legal_policy_as_url: "https://my-legal-policy-as-url",
        legal_policy_as_markdown: "my-legal-policy-as-markdown",
        ethics_policy_as_url: "https://my-ethics-policy-as-url",
        ethics_policy_as_markdown: "my-ethics-policy-as-markdown",
        privacy_policy_as_url: "https://my-privacy-policy-as-url",
        privacy_policy_as_markdown: "my-privacy-policy-as-markdown",
        security_policy_as_url: "https://my-security-policy-as-url",
        security_policy_as_markdown: "my-security-policy-as-markdown",
        coordinated_disclosure_policy_as_url: "https://my-coordinated_disclosure-policy-as-url",
        coordinated_disclosure_policy_as_markdown: "my-coordinated_disclosure-policy-as-markdown",
        open_source_policy_as_url: "https://my-open_source-policy-as-url",
        open_source_policy_as_markdown: "my-open_source-policy-as-markdown",
        code_of_conduct_policy_as_url: "https://my-code_of_conduct-policy-as-url",
        code_of_conduct_policy_as_markdown: "my-code_of_conduct-policy-as-markdown",
        equal_opportunity_policy_as_url: "https://my-equal_opportunity-policy-as-url",
        equal_opportunity_policy_as_markdown: "my-equal_opportunity-policy-as-markdown",
        social_network_policy_as_url: "https://my-social_network-policy-as-url",
        social_network_policy_as_markdown: "my-social_network-policy-as-markdown",
        health_and_safety_policy_as_url: "https://my-health_and_safety-policy-as-url",
        health_and_safety_policy_as_markdown: "my-health_and_safety-policy-as-markdown",
        employee_handbook_policy_as_url: "https://my-employee_handbook-policy-as-url",
        employee_handbook_policy_as_markdown: "my-employee_handbook-policy-as-markdown",
        human_resources_policy_as_url: "https://my-human_resources-policy-as-url",
        human_resources_policy_as_markdown: "my-human_resources-policy-as-markdown",
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
    conn = get(conn, ~p"/groups")
    response = html_response(conn, 200)

    assert response =~ "Groups"
    assert response =~ "➡️ Id"
    assert response =~ "📛 Name"
    assert response =~ "🚦 Status"
    assert response =~ "🏷️ Tags"
  end

  test "new", %{conn: conn} do
    conn = get(conn, ~p"/groups/new")
    response = html_response(conn, 200)

    assert response =~ "Groups"
    assert response =~ "📛 Name"
    assert response =~ "🚦 Status"
    assert response =~ "🏷️ Tags"

    assert response =~ "Contact"
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
    assert response =~ "Images"
    assert response =~ "Avatar image 400x400"
    assert response =~ "Main image 1080x1080 square"
    assert response =~ "Main image 1920x1080 landscape"
    assert response =~ "Main image 1080x1920 portrait"
    assert response =~ "Deeper Dive"
    assert response =~ "Note"
    assert response =~ "DaisyUI timeline HTML"
    assert response =~ "Org Mode"
    assert response =~ "Task list as markdown"
    assert response =~ "Ways Of Working"
    assert response =~ "Objectives and Key Results (OKRs)"
    assert response =~ "Key Performance Indicators (KPIs)"
    assert response =~ "GS1 codes"
    assert response =~ "GS1 Digital Link"
    assert response =~ "GS1 Country Code"
    assert response =~ "GS1 Global Location Number"
    assert response =~ "International Standard Industrial Classification V4"
    assert response =~ "Code"
    assert response =~ "Name"
    assert response =~ "Policies"
    assert response =~ "Ethics Policy"
    assert response =~ "Copyright Policy"
    assert response =~ "Corrections Policy"
    assert response =~ "Legal Policy"
    assert response =~ "Privacy Policy"
    assert response =~ "Security Policy"
    assert response =~ "Coordinated Disclosure Policy"
    assert response =~ "Open Source Policy"
    assert response =~ "Code of Conduct Policy"
    assert response =~ "Equal Opportunity Policy"
    assert response =~ "Social Network Policy"
    assert response =~ "Health &amp; Safety Policy"
    assert response =~ "Employee Handbook Policy"
    assert response =~ "Human Resources Policy"
  end

  test "show", %{conn: conn} do
    x = x!()
    conn = get(conn, ~p"/groups/#{x.id}")
    response = html_response(conn, 200)

    assert response =~ "Groups"

    assert response =~ "Id: #{x.id}"
    # assert response =~ "Created at: #{x.created_at}"
    # assert response =~ "Updated at: #{x.updated_at}"
    # assert response =~ "Deleted at: #{x.deleted_at}"
    assert response =~ "Locale code: #{x.locale_code}"
    assert response =~ "📛 Name: #{x.name}"
    assert response =~ "🚦 Status: #{x.status}"
    assert response =~ "🏷️ Tags: #{x.tagging}"

    assert response =~ "Contact"
    assert response =~ "URL: #{x.url}"
    assert response =~ "Email: #{x.email}"
    assert response =~ "Phone: #{x.phone}"
    assert response =~ "Messaging: #{x.messaging}"
    assert response =~ "Postal: #{x.postal}"
    assert response =~ "ORCID PID: #{x.orcid_pid}"
    assert response =~ "RDF Type: #{x.rdf_type}"

    assert response =~ "Socials"
    assert response =~ "LinkedIn URL: #{x.linkedin_url}"
    assert response =~ "GitHub URL: #{x.github_url}"
    assert response =~ "Codeberg URL: #{x.codeberg_url}"

    assert response =~ "Locations"
    assert response =~ "Country code ISO 3166-1 Alpha 2: #{x.location_iso_3166_1_alpha_2}"
    assert response =~ "Subcountry code ISO 3166-2: #{x.location_iso_3166_2}"
    assert response =~ "location_postal_code: #{x.location_postal_code}"
    assert response =~ "Latitude: #{x.location_latitude_as_decimal_degrees}"
    assert response =~ "Longitude: #{x.location_longitude_as_decimal_degrees}"

    assert response =~ "AGENTS.md"
    assert response =~ "URL: #{x.agents_as_url}"
    assert response =~ "Markdown: #{x.agents_as_markdown}"

    assert response =~ "URL: #{x.avatar_image_400x400_url}"
    assert response =~ "Alt: #{x.avatar_image_400x400_alt}"

    assert response =~ "Images"

    assert response =~ "Avatar image 400x400"
    assert response =~ "URL: #{x.avatar_image_400x400_url}"
    assert response =~ "Alt: #{x.avatar_image_400x400_alt}"

    assert response =~ "Main image 1080x1080 square"
    assert response =~ "URL: #{x.main_image_1080x1080_url}"
    assert response =~ "Alt: #{x.main_image_1080x1080_alt}"

    assert response =~ "Main image 1920x1080 landscape"
    assert response =~ "URL: #{x.main_image_1920x1080_url}"
    assert response =~ "Alt: #{x.main_image_1920x1080_alt}"

    assert response =~ "Main image 1080x1920 portrait"
    assert response =~ "URL: #{x.main_image_1080x1920_url}"
    assert response =~ "Alt: #{x.main_image_1080x1920_alt}"

    assert response =~ "Deeper Dive"
    assert response =~ "Note: #{x.note}"
    assert response =~ "DaisyUI timeline html: #{x.daisyui_timeline_html}"
    assert response =~ "Org mode: #{x.org_mode}"
    assert response =~ "Task list as markdown: #{x.task_list_as_markdown}"
    assert response =~ "Ways of Working as markdown: #{x.ways_of_working_as_markdown}"
    assert response =~ "Objectives and Key Results (OKRs) as markdown: #{x.objectives_and_key_results_as_markdown}"
    assert response =~ "Key Performance Indicators (KPIs) as markdown: #{x.key_performance_indicators_as_markdown}"

    assert response =~ "GS1 codes"
    assert response =~ "GS1 digital link: #{x.gs1_digital_link}"
    assert response =~ "GS1 country code: #{x.gs1_country_code}"
    assert response =~ "GS1 global location number: #{x.gs1_global_location_number}"

    assert response =~ "International Standard Industrial Classification V4"
    assert response =~ "ISIC v4 code: #{x.isic_v4_code}"
    assert response =~ "ISIC v4 name: #{x.isic_v4_name}"

    assert response =~ "Policies"

    assert response =~ "Ethics Policy"
    assert response =~ "URL: #{x.ethics_policy_as_url}"
    assert response =~ "Markdown: #{x.ethics_policy_as_markdown}"

    assert response =~ "Copyright Policy"
    assert response =~ "URL: #{x.copyright_policy_as_url}"
    assert response =~ "Markdown: #{x.copyright_policy_as_markdown}"

    assert response =~ "Corrections Policy"
    assert response =~ "URL: #{x.corrections_policy_as_url}"
    assert response =~ "Markdown: #{x.corrections_policy_as_markdown}"

    assert response =~ "Legal Policy"
    assert response =~ "URL: #{x.legal_policy_as_url}"
    assert response =~ "Markdown: #{x.legal_policy_as_markdown}"

    assert response =~ "Privacy Policy"
    assert response =~ "URL: #{x.privacy_policy_as_url}"
    assert response =~ "Markdown: #{x.privacy_policy_as_markdown}"

    assert response =~ "Security Policy"
    assert response =~ "URL: #{x.security_policy_as_url}"
    assert response =~ "Markdown: #{x.security_policy_as_markdown}"

    assert response =~ "Coordinated Disclosure Policy"
    assert response =~ "URL: #{x.coordinated_disclosure_policy_as_url}"
    assert response =~ "Markdown: #{x.coordinated_disclosure_policy_as_markdown}"

    assert response =~ "Open Source Policy"
    assert response =~ "URL: #{x.open_source_policy_as_url}"
    assert response =~ "Markdown: #{x.open_source_policy_as_markdown}"

    assert response =~ "Code of Conduct Policy"
    assert response =~ "URL: #{x.code_of_conduct_policy_as_url}"
    assert response =~ "Markdown: #{x.code_of_conduct_policy_as_markdown}"

    assert response =~ "Equal Opportunity Policy"
    assert response =~ "URL: #{x.equal_opportunity_policy_as_url}"
    assert response =~ "Markdown: #{x.equal_opportunity_policy_as_markdown}"

    assert response =~ "Social Network Policy"
    assert response =~ "URL: #{x.social_network_policy_as_url}"
    assert response =~ "Markdown: #{x.social_network_policy_as_markdown}"

    assert response =~ "Health &amp; Safety Policy"
    assert response =~ "URL: #{x.health_and_safety_policy_as_url}"
    assert response =~ "Markdown: #{x.health_and_safety_policy_as_markdown}"

    assert response =~ "Employee Handbook Policy"
    assert response =~ "URL: #{x.employee_handbook_policy_as_url}"
    assert response =~ "Markdown: #{x.employee_handbook_policy_as_markdown}"

    assert response =~ "Human Resources Policy"
    assert response =~ "URL: #{x.human_resources_policy_as_url}"
    assert response =~ "Markdown: #{x.human_resources_policy_as_markdown}"
  end

  test "create", %{conn: conn} do
    {:ok, lv, _html} = live(conn, ~p"/groups/new")

    result =
      lv
      |> form("#x_form", %{
        "form[name]" => "alfa"
      })
      |> render_submit()

    case result do
      {:error, {:live_redirect, %{to: path}}} ->
        assert path == "/groups"

      html when is_binary(html) ->
        assert html =~ "Groups"

      other ->
        flunk("Unexpected result: #{inspect(other)}")
    end
  end
end
