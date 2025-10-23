defmodule NavatrackWeb.Groups.ShowTest do
  # import Phoenix.LiveViewTest
  use NavatrackWeb.ConnCase
  use NavatrackWeb.AuthCase
  alias Navatrack.Works.Group, as: X

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
    conn = get(conn, ~p"/groups/#{x.id}")
    response = html_response(conn, 200)

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

    assert response =~ "Contact"
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
    # assert response =~ "Purpose Statement: #{x.purpose_statement}"
    # assert response =~ "Vision Statement: #{x.vision_statement}"
    # assert response =~ "Mission Statement: #{x.mission_statement}"
    # assert response =~ "Values Statement: #{x.values_statement}"

    assert response =~ "AI Agent Instructions"
    assert response =~ "URL: <a href=\"#{x.ai_agent_instructions_as_url}\">#{x.ai_agent_instructions_as_url}</a>"
    assert response =~ "Markdown: #{x.ai_agent_instructions_as_markdown}"

    assert response =~ "Deeper Dive"
    assert response =~ "Email distribution list: #{x.email_distribution_list}"
    assert response =~ "DaisyUI timeline HTML: #{x.daisyui_timeline_html}"
    assert response =~ "Org Mode: #{x.org_mode}"
    assert response =~ "Task list: #{x.task_list_as_markdown}"
    assert response =~ "Ways Of Working (WOW): #{x.ways_of_working_as_markdown}"
    assert response =~ "Objectives and Key Results (OKRs): #{x.objectives_and_key_results_as_markdown}"
    assert response =~ "Key Performance Indicators (KPIs): #{x.key_performance_indicators_as_markdown}"

    assert response =~ "🏠 Home: <a href=\"#{x.home_emoji_url}\">#{x.home_emoji_url}</a>"
    assert response =~ "🛎️ Concierge: <a href=\"#{x.bellhop_bell_emoji_url}\">#{x.bellhop_bell_emoji_url}</a>"
    assert response =~ "🎯 Target: <a href=\"#{x.target_emoji_url}\">#{x.target_emoji_url}</a>"
    assert response =~ "⚙️ Technical Contact: <a href=\"#{x.gear_emoji_url}\">#{x.gear_emoji_url}</a>"
    assert response =~ "🗓️ Calendar: <a href=\"#{x.spiral_calendar_emoji_url}\">#{x.spiral_calendar_emoji_url}</a>"
    assert response =~ "✨ AI: <a href=\"#{x.sparkles_emoji_url}\">#{x.sparkles_emoji_url}</a>"
    assert response =~ "💬 Chat: <a href=\"#{x.speech_bubble_emoji_url}\">#{x.speech_bubble_emoji_url}</a>"
    assert response =~ "📰 News: <a href=\"#{x.newspaper_emoji_url}\">#{x.newspaper_emoji_url}</a>"
    assert response =~ "📊 Charts: <a href=\"#{x.bar_chart_emoji_url}\">#{x.bar_chart_emoji_url}</a>"
    assert response =~ "🎥 Videos: <a href=\"#{x.movie_camera_emoji_url}\">#{x.movie_camera_emoji_url}</a>"
    assert response =~ "👷 Workers: <a href=\"#{x.construction_worker_emoji_url}\">#{x.construction_worker_emoji_url}</a>"
    assert response =~ "🔮 Future: <a href=\"#{x.crystal_ball_emoji_url}\">#{x.crystal_ball_emoji_url}</a>"
    assert response =~ "🦋 Feature Tracker: <a href=\"#{x.butterfly_emoji_url}\">#{x.butterfly_emoji_url}</a>"
    assert response =~ "🐞 Bug Tracker: <a href=\"#{x.lady_beetle_emoji_url}\">#{x.lady_beetle_emoji_url}</a>"

    assert response =~ "Touchpoints"

    assert response =~ "Glossary"
    assert response =~ "URL: <a href=\"#{x.glossary_as_url}\">#{x.glossary_as_url}</a>"
    assert response =~ "Markdown: #{x.glossary_as_markdown}"

    assert response =~ "Business Analysis"

    assert response =~ "GS1 Codes"
    assert response =~ "GS1 digital link: #{x.gs1_digital_link}"
    assert response =~ "GS1 country code: #{x.gs1_country_code}"
    assert response =~ "GS1 global location number: #{x.gs1_global_location_number}"

    assert response =~ "International Standard Industrial Classification V4"
    assert response =~ "ISIC v4 code: #{x.isic_v4_code}"
    assert response =~ "ISIC v4 name: #{x.isic_v4_name}"

    assert response =~ "Six-Pager Double-Sider"
    assert response =~ "URL: <a href=\"#{x.six_pager_double_sider_as_url}\">#{x.six_pager_double_sider_as_url}</a>"
    assert response =~ "Markdown: #{x.six_pager_double_sider_as_markdown}"

    assert response =~ "SWOT: Strengths Weaknesses Opportunities Threats"
    assert response =~ "URL: <a href=\"#{x.swot_as_url}\">#{x.swot_as_url}</a>"
    assert response =~ "Strengths: #{x.swot_strengths_as_markdown}"
    assert response =~ "Weaknesses: #{x.swot_weaknesses_as_markdown}"
    assert response =~ "Opportunities: #{x.swot_opportunities_as_markdown}"
    assert response =~ "Threats: #{x.swot_threats_as_markdown}"

    assert response =~ "Porter&#39;s Five Forces"
    assert response =~ "URL: <a href=\"#{x.porters_five_forces_as_url}\">#{x.porters_five_forces_as_url}</a>"
    assert response =~ "Threat Of Entrants: #{x.porters_five_forces_entrants_as_markdown}"
    assert response =~ "Threat Of Substitutes: #{x.porters_five_forces_substitutes_as_markdown}"
    assert response =~ "Bargaining Power Of Customers: #{x.porters_five_forces_customers_as_markdown}"
    assert response =~ "Bargaining Power Of Suppliers: #{x.porters_five_forces_suppliers_as_markdown}"
    assert response =~ "Rivalry Of Competitors: #{x.porters_five_forces_competitors_as_markdown}"

    assert response =~ "SIPOC: Suppliers Inputs Processes Outputs Customers"
    assert response =~ "URL: <a href=\"#{x.sipoc_as_url}\">#{x.sipoc_as_url}</a>"
    assert response =~ "Suppliers: #{x.sipoc_suppliers_as_markdown}"
    assert response =~ "Inputs: #{x.sipoc_inputs_as_markdown}"
    assert response =~ "Processes: #{x.sipoc_processes_as_markdown}"
    assert response =~ "Outputs: #{x.sipoc_outputs_as_markdown}"
    assert response =~ "Customers: #{x.sipoc_customers_as_markdown}"

    assert response =~ "STEEPLE: Social Technological Economic Environmental Political Legal Ethical"
    assert response =~ "URL: <a href=\"#{x.steeple_as_url}\">#{x.steeple_as_url}</a>"
    assert response =~ "Social: #{x.steeple_social_as_markdown}"
    assert response =~ "Technological: #{x.steeple_technological_as_markdown}"
    assert response =~ "Economic: #{x.steeple_economic_as_markdown}"
    assert response =~ "Environmental: #{x.steeple_environmental_as_markdown}"
    assert response =~ "Political: #{x.steeple_political_as_markdown}"
    assert response =~ "Legal: #{x.steeple_legal_as_markdown}"
    assert response =~ "Ethical: #{x.steeple_ethical_as_markdown}"

    assert response =~ "Roles and Responsibilities"
    assert response =~ "URL: <a href=\"#{x.roles_and_responsibilities_as_url}\">#{x.roles_and_responsibilities_as_url}</a>"
    assert response =~ "Markdown: #{x.roles_and_responsibilities_as_markdown}"

    assert response =~ "Responsibility Assignment Matrix (RAM)"
    assert response =~ "URL: <a href=\"#{x.responsibility_assignment_matrix_as_url}\">#{x.responsibility_assignment_matrix_as_url}</a>"
    assert response =~ "Markdown: #{x.responsibility_assignment_matrix_as_markdown}"

    assert response =~ "Policies"

    assert response =~ "Code of Conduct Policy"
    assert response =~ "URL: <a href=\"#{x.code_of_conduct_policy_as_url}\">#{x.code_of_conduct_policy_as_url}</a>"
    assert response =~ "Markdown: #{x.code_of_conduct_policy_as_markdown}"

    assert response =~ "Coordinated Disclosure Policy"
    assert response =~ "URL: <a href=\"#{x.coordinated_disclosure_policy_as_url}\">#{x.coordinated_disclosure_policy_as_url}</a>"
    assert response =~ "Markdown: #{x.coordinated_disclosure_policy_as_markdown}"

    assert response =~ "Copyright Policy"
    assert response =~ "URL: <a href=\"#{x.copyright_policy_as_url}\">#{x.copyright_policy_as_url}</a>"
    assert response =~ "Markdown: #{x.copyright_policy_as_markdown}"

    assert response =~ "Corrections Policy"
    assert response =~ "URL: <a href=\"#{x.corrections_policy_as_url}\">#{x.corrections_policy_as_url}</a>"
    assert response =~ "Markdown: #{x.corrections_policy_as_markdown}"

    assert response =~ "Diversity Policy"
    assert response =~ "URL: <a href=\"#{x.diversity_policy_as_url}\">#{x.diversity_policy_as_url}</a>"
    assert response =~ "Markdown: #{x.diversity_policy_as_markdown}"

    assert response =~ "Equal Opportunity Policy"
    assert response =~ "URL: <a href=\"#{x.equal_opportunity_policy_as_url}\">#{x.equal_opportunity_policy_as_url}</a>"
    assert response =~ "Markdown: #{x.equal_opportunity_policy_as_markdown}"

    assert response =~ "Ethics Policy"
    assert response =~ "URL: <a href=\"#{x.ethics_policy_as_url}\">#{x.ethics_policy_as_url}</a>"
    assert response =~ "Markdown: #{x.ethics_policy_as_markdown}"

    assert response =~ "Legal Policy"
    assert response =~ "URL: <a href=\"#{x.legal_policy_as_url}\">#{x.legal_policy_as_url}</a>"
    assert response =~ "Markdown: #{x.legal_policy_as_markdown}"

    assert response =~ "License Policy"
    assert response =~ "URL: <a href=\"#{x.license_policy_as_url}\">#{x.license_policy_as_url}</a>"
    assert response =~ "Markdown: #{x.license_policy_as_markdown}"

    assert response =~ "Open Source Policy"
    assert response =~ "URL: <a href=\"#{x.open_source_policy_as_url}\">#{x.open_source_policy_as_url}</a>"
    assert response =~ "Markdown: #{x.open_source_policy_as_markdown}"

    assert response =~ "Privacy Policy"
    assert response =~ "URL: <a href=\"#{x.privacy_policy_as_url}\">#{x.privacy_policy_as_url}</a>"
    assert response =~ "Markdown: #{x.privacy_policy_as_markdown}"

    assert response =~ "Safety Policy"
    assert response =~ "URL: <a href=\"#{x.safety_policy_as_url}\">#{x.safety_policy_as_url}</a>"
    assert response =~ "Markdown: #{x.safety_policy_as_markdown}"

    assert response =~ "Security Policy"
    assert response =~ "URL: <a href=\"#{x.security_policy_as_url}\">#{x.security_policy_as_url}</a>"
    assert response =~ "Markdown: #{x.security_policy_as_markdown}"

    assert response =~ "Socials Policy"
    assert response =~ "URL: <a href=\"#{x.socials_policy_as_url}\">#{x.socials_policy_as_url}</a>"
    assert response =~ "Markdown: #{x.socials_policy_as_markdown}"

    assert response =~ "Staff Policy"
    assert response =~ "URL: <a href=\"#{x.staff_policy_as_url}\">#{x.staff_policy_as_url}</a>"
    assert response =~ "Markdown: #{x.staff_policy_as_markdown}"

    assert response =~ "Explain"
    assert response =~ "Stakeholders: #{x.explain_stakeholders_as_markdown}"
    assert response =~ "History: #{x.explain_history_as_markdown}"
    assert response =~ "Authentication: #{x.explain_authentication_as_markdown}"
    assert response =~ "Authorization: #{x.explain_authorization_as_markdown}"
    assert response =~ "Use Cases: #{x.explain_use_cases_as_markdown}"
    assert response =~ "Demographics: #{x.explain_demographics_as_markdown}"
    assert response =~ "UI: #{x.explain_ui_as_markdown}"
    assert response =~ "API: #{x.explain_api_as_markdown}"
    assert response =~ "Data: #{x.explain_data_as_markdown}"
    assert response =~ "Mobile: #{x.explain_mobile_as_markdown}"
    assert response =~ "Legal: #{x.explain_legal_as_markdown}"
    assert response =~ "Financial: #{x.explain_financial_as_markdown}"
    assert response =~ "Service Level Agreement (SLA): #{x.explain_service_level_agreement_as_markdown}"
    assert response =~ "Disaster Recovery (DR): #{x.explain_disaster_recovery_as_markdown}"

    assert response =~ "Chart"
    assert response =~ "URL: <a href=\"#{x.apache_echart_as_url}\">#{x.apache_echart_as_url}</a>"
    assert response =~ "TypeScript: #{x.apache_echart_as_typescript}"

    assert response =~ "Net Promoter Score (NPS)"

    assert response =~ "Customer Perspective"
    assert response =~ "Actual Value: #{x.net_promoter_score_customer_perspective_actual}"
    assert response =~ "Target Value: #{x.net_promoter_score_customer_perspective_expect}"
    assert response =~ "Unit: #{x.net_promoter_score_customer_perspective_unit}"
    assert response =~ "Description: #{x.net_promoter_score_customer_perspective_description_as_markdown}"

    assert response =~ "User Perspective"
    assert response =~ "Actual Value: #{x.net_promoter_score_user_perspective_actual}"
    assert response =~ "Target Value: #{x.net_promoter_score_user_perspective_expect}"
    assert response =~ "Unit: #{x.net_promoter_score_user_perspective_unit}"
    assert response =~ "Description: #{x.net_promoter_score_user_perspective_description_as_markdown}"

    assert response =~ "Worker Perspective"
    assert response =~ "Actual Value: #{x.net_promoter_score_worker_perspective_actual}"
    assert response =~ "Target Value: #{x.net_promoter_score_worker_perspective_expect}"
    assert response =~ "Unit: #{x.net_promoter_score_worker_perspective_unit}"
    assert response =~ "Description: #{x.net_promoter_score_worker_perspective_description_as_markdown}"

    assert response =~ "User Metrics"

    assert response =~ "Active Users"
    assert response =~ "Actual Value: #{x.active_users_actual}"
    assert response =~ "Target Value: #{x.active_users_expect}"
    assert response =~ "Unit: #{x.active_users_unit}"
    assert response =~ "Description: #{x.active_users_description}"

  end

end
