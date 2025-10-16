defmodule NavatrackWeb.Plans.ShowTest do
  # import Phoenix.LiveViewTest
  use NavatrackWeb.ConnCase
  use NavatrackWeb.AuthCase
  alias Navatrack.Works.Plan, as: X

  defp x! do
    X
      |> Ash.Changeset.for_create(:create, %{
        locale_code: "en-US",
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
        ###
        daisyui_timeline_html: "my-daisyui-timeline-html",
        org_mode: "my-org-mode",
        task_list_as_markdown: "my-task-list-as-markdown",
        ways_of_working_as_markdown: "my-ways-of-working-as-markdown",
        objectives_and_key_results_as_markdown: "my-objectives-and-key-results-as-markdown",
        key_performance_indicators_as_markdown: "my-key-performance-indicators-as-markdown",
        ### images
        avatar_image_400x400_url: "https://my-avatar-image-400x400-url",
        avatar_image_400x400_alt: "my-avatar-image-400x400-alt",
        main_image_1080x1080_url: "https://my-main-image-1080x1080-url",
        main_image_1080x1080_alt: "my-main-image-1080x1080-alt",
        main_image_1920x1080_url: "https://my-main-image-1920x1080-url",
        main_image_1920x1080_alt: "my-main-image-1920x1080-alt",
        main_image_1080x1920_url: "https://my-main-image-1080x1920-url",
        main_image_1080x1920_alt: "my-main-image-1080x1920-alt",
        ### ideals
        purpose_statement: "my-purpose-statement",
        vision_statement: "my-vision-statement",
        mission_statement: "my-mission-statement",
        values_statement: "my-values-statement",
        ### ai
        ai_agent_instructions_as_url: "https://my-agent-instructions-as-url",
        ai_agent_instructions_as_markdown: "my-agent-instructions-as-markdown",
        ### emoji
        home_emoji_url: "https://my-home-emoji-url",
        bellhop_bell_emoji_url: "https://my-bellhop-bell-emoji-url",
        target_emoji_url: "https://my-target-emoji-url",
        gear_emoji_url: "https://my-gear-emoji-url",
        spiral_calendar_emoji_url: "https://my-spiral-calendar-emoji-url",
        sparkles_emoji_url: "https://my-sparkles-emoji-url",
        speech_bubble_emoji_url: "https://my-speech-bubble-emoji-url",
        newspaper_emoji_url: "https://my-newspaper-emoji-url",
        bar_chart_emoji_url: "https://my-bar-chart-emoji-url",
        movie_camera_emoji_url: "https://my-movie-camera-emoji-url",
        construction_worker_emoji_url: "https://my-construction-worker-emoji-url",
        crystal_ball_emoji_url: "https://my-crystal-ball-emoji-url",
        butterfly_emoji_url: "https://my-butterfly-emoji-url",
        lady_beetle_emoji_url: "https://my-lady-beetle-emoji-url",
        ### deeper dive
        email_distribution_list: "my-email-distribution-list",
        glossary_as_url: "https://my-glossary-as-url",
        glossary_as_markdown: "my-glossary-as-markdown",
        ### business analysis
        gs1_digital_link: "my-gs1-digital-link",
        gs1_country_code: "my-gs1-country-code",
        gs1_global_location_number: "my-gs1-global-location-number",
        isic_v4_code: "my-isic-v4-code",
        isic_v4_name: "my-isic-v4-name",
        six_pager_double_sider_as_url: "https://my-six_pager-double-sider-as-url",
        six_pager_double_sider_as_markdown: "my-six-pager-double-sider-as-markdown",
        ### swot
        swot_as_url: "https://my-swot-as-url",
        swot_strengths_as_markdown: "my-swot-strengths-as-markdown",
        swot_weaknesses_as_markdown: "my-swot-weaknesses-as-markdown",
        swot_opportunities_as_markdown: "my-swot-opportunities-as-markdown",
        swot_threats_as_markdown: "my-swot-opportunities-as-markdown",
        ### sipoc
        sipoc_as_url: "https://my-sipoc-as-url",
        sipoc_suppliers_as_markdown: "my-sipoc-suppliers-as-markdown",
        sipoc_inputs_as_markdown: "my-sipoc-inputs-as-markdown",
        sipoc_processes_as_markdown: "my-sipoc-processes-as-markdown",
        sipoc_outputs_as_markdown: "my-sipoc-outputs-as-markdown",
        sipoc_customers_as_markdown: "my-sipoc-customers-as-markdown",
        ### steeple
        steeple_as_url: "https://my-steeple-as-url",
        steeple_social_as_markdown: "my-steeple-social-as-markdown",
        steeple_technological_as_markdown: "my-steeple-technological-as-markdown",
        steeple_economic_as_markdown: "my-steeple-economic-as-markdown",
        steeple_environmental_as_markdown: "my-steeple-environmental-as-markdown",
        steeple_political_as_markdown: "my-steeple-political-as-markdown",
        steeple_legal_as_markdown: "my-steeple-legal-as-markdown",
        steeple_ethical_as_markdown: "my-steeple-ethical-as-markdown",
        roles_and_responsibilities_as_url: "https://my-roles-and-responsibilities-as-url",
        roles_and_responsibilities_as_markdown: "my-roles-and-responsibilities-as-markdown",
        responsibility_assignment_matrix_as_url: "https://my-responsibility-assignment-matrix-as-url",
        responsibility_assignment_matrix_as_markdown: "my-responsibility-assignment-matrix-as-markdown",
        ### porters five forces
        porters_five_forces_as_url: "https://my-porters-five-forces-as-url",
        porters_five_forces_entrants_as_markdown: "my-porters-five-forces-entrants-as-markdown",
        porters_five_forces_substitutes_as_markdown: "my-porters-five-forces-substitutes-as-markdown",
        porters_five_forces_customers_as_markdown: "my-porters-five-forces-customers-as-markdown",
        porters_five_forces_suppliers_as_markdown: "my-porters-five-forces-suppliers-as-markdown",
        porters_five_forces_competitors_as_markdown: "my-porters-five-forces-competitors-as-markdown",
        ### policy
        code_of_conduct_policy_as_url: "https://my-code-of-conduct-url",
        code_of_conduct_policy_as_markdown: "my-code-of-conduct-as-markdown",
        coordinated_disclosure_policy_as_url: "https://my-coordinated_disclosure-policy-as-url",
        coordinated_disclosure_policy_as_markdown: "my-coordinated_disclosure-policy-as-markdown",
        copyright_policy_as_url: "https://my-copyright-policy-as-url",
        copyright_policy_as_markdown: "my-copyright-policy-as-markdown",
        corrections_policy_as_url: "https://my-corrections-policy-as-url",
        corrections_policy_as_markdown: "my-corrections-policy-as-markdown",
        diversity_policy_as_url: "https://my-diversity-policy-as-url",
        diversity_policy_as_markdown: "my-diversity-policy-as-markdown",
        equal_opportunity_policy_as_url: "https://my-equal_opportunity-policy-as-url",
        equal_opportunity_policy_as_markdown: "my-equal_opportunity-policy-as-markdown",
        ethics_policy_as_url: "https://my-ethics-policy-as-url",
        ethics_policy_as_markdown: "my-ethics-policy-as-markdown",
        legal_policy_as_url: "https://my-legal-policy-as-url",
        legal_policy_as_markdown: "my-legal-policy-as-markdown",
        license_policy_as_url: "https://my-license-url",
        license_policy_as_markdown: "my-license-as-markdown",
        open_source_policy_as_url: "https://my-open_source-policy-as-url",
        open_source_policy_as_markdown: "my-open_source-policy-as-markdown",
        privacy_policy_as_url: "https://my-privacy-policy-as-url",
        privacy_policy_as_markdown: "my-privacy-policy-as-markdown",
        safety_policy_as_url: "https://my-safety-policy-as-url",
        safety_policy_as_markdown: "my-safety-policy-as-markdown",
        security_policy_as_url: "https://my-security-policy-as-url",
        security_policy_as_markdown: "my-security-policy-as-markdown",
        socials_policy_as_url: "https://my-socials-policy-as-url",
        socials_policy_as_markdown: "my-socials-policy-as-markdown",
        staff_policy_as_url: "https://my-staff-policy-as-url",
        staff_policy_as_markdown: "my-staff-policy-as-markdown",
        ### arc42
        arc42_as_url: "https://my-arc42-as-url",
        arc42_01_introduction_and_goals_as_markdown: "my-arc42-01-introduction-and-goals-as-markdown",
        arc42_02_constraints_as_markdown: "my-arc42-02-constraints-as-markdown",
        arc42_03_context_and_scope_as_markdown: "my-arc42-03-context-and-scope-as-markdown",
        arc42_04_solution_strategy_as_markdown: "my-arc42-04-solution-strategy-as-markdown",
        arc42_05_building_block_view_as_markdown: "my-arc42-05-building-block-view-as-markdown",
        arc42_06_runtime_view_as_markdown: "my-arc42-06-runtime-view-as-markdown",
        arc42_07_deployment_view_as_markdown: "my-arc42-07-deployment-view-as-markdown",
        arc42_08_crosscutting_concepts_as_markdown: "my-arc42-08-crosscutting-concepts-as-markdown",
        arc42_09_architectural_decisions_as_markdown: "my-arc42-09-architectural-decisions-as-markdown",
        arc42_10_quality_requirements_as_markdown: "my-arc42-10-quality-requirements-as-markdown",
        arc42_11_risks_and_technical_debt_as_markdown: "my-arc42-11_risks-and-technical-debt-as-markdown",
        arc42_12_glossary_as_markdown: "my-arc42-12-glossary-as-markdown",
        ### explain
        explain_stakeholders_as_markdown: "my-explain-stakeholders-as-markdown",
        explain_history_as_markdown: "my-explain-history-as-markdown",
        explain_authentication_as_markdown: "my-explain-authentication-as-markdown",
        explain_authorization_as_markdown: "my-explain-authorization-as-markdown",
        explain_use_cases_as_markdown: "my-explain-use-cases-as-markdown",
        explain_demographics_as_markdown: "my-explain-demographics-as-markdown",
        explain_ui_as_markdown: "my-explain-ui-as-markdown",
        explain_api_as_markdown: "my-explain-api-as-markdown",
        explain_data_as_markdown: "my-explain-data-as-markdown",
        explain_mobile_as_markdown: "my-explain-mobile-as-markdown",
        explain_legal_as_markdown: "my-explain-legal-as-markdown",
        explain_financial_as_markdown: "my-explain-financial-as-markdown",
        explain_service_level_agreement_as_markdown: "my-explain-service-level-agreement-as-markdown",
        explain_disaster_recovery_as_markdown: "my-explain-disaster-recovery-as-markdown",
        ### quality
        quality_availability_as_markdown: "my-quality-availability-as-markdown",
        quality_certifiability_as_markdown: "my-quality-certifiability-as-markdown",
        quality_compatibility_as_markdown: "my-quality-compatibility-as-markdown",
        quality_efficiency_as_markdown: "my-quality-efficiency-as-markdown",
        quality_governability_as_markdown: "my-quality-governability-as-markdown",
        quality_maintainability_as_markdown: "my-quality-maintainability-as-markdown",
        quality_observability_as_markdown: "my-quality-observability-as-markdown",
        quality_operability_as_markdown: "my-quality-operability-as-markdown",
        quality_recoverability_as_markdown: "my-quality-recoverability-as-markdown",
        quality_scalability_as_markdown: "my-quality-scalability-as-markdown",
        quality_security_as_markdown: "my-quality-security-as-markdown",
        quality_suitability_as_markdown: "my-quality-suitability-as-markdown",
        quality_testability_as_markdown: "my-quality-testability-as-markdown",
        quality_transferability_as_markdown: "my-quality-transferability-as-markdown",
        quality_translatability_as_markdown: "my-quality-translatability-as-markdown",
        quality_warrantability_as_markdown: "my-quality-warrantability-as-markdown",
        ### apache echart
        apache_echart_as_url: "https://my-apache-echart-as-url",
        apache_echart_as_typescript: "my-apache-echart-as-typescript",
        ### net promoter score
        net_promoter_score_customer_perspective_actual: 1.0,
        net_promoter_score_customer_perspective_expect: 2.0,
        net_promoter_score_customer_perspective_unit: "my-net_promoter-score-customer-perspective-unit",
        net_promoter_score_customer_perspective_description_as_markdown: "my-net_promoter-score-customer-perspective-description-as-markdown",
        net_promoter_score_user_perspective_actual: 1.0,
        net_promoter_score_user_perspective_expect: 2.0,
        net_promoter_score_user_perspective_unit: "my-net_promoter-score-user-perspective-unit",
        net_promoter_score_user_perspective_description_as_markdown: "my-net_promoter-score-user-perspective-description-as-markdown",
        net_promoter_score_worker_perspective_actual: 1.0,
        net_promoter_score_worker_perspective_expect: 2.0,
        net_promoter_score_worker_perspective_unit: "my-net_promoter-score-worker-perspective-unit",
        net_promoter_score_worker_perspective_description_as_markdown: "my-net_promoter_score-worker-perspective-description-as-markdown",
        ### active users
        active_users_actual: 1.0,
        active_users_expect: 2.0,
        active_users_unit: "my-active-users-unit",
        active_users_description: "my-active-users-description",
        ### uptime percentage
        uptime_percentage_actual: 1.0,
        uptime_percentage_expect: 2.0,
        uptime_percentage_unit: "my-uptime-percentage-unit",
        uptime_percentage_description: "my-uptime-percentage-description",
        ### burn rate
        burn_rate_net_cash_per_week_actual: 1.0,
        burn_rate_net_cash_per_week_expect: 2.0,
        burn_rate_net_cash_per_week_unit: "my-burn_rate_net-cash-per-week-unit",
        burn_rate_net_cash_per_week_description: "my-burn_rate_net-cash-per-week-description",
        burn_rate_net_hours_per_week_actual: 1.0,
        burn_rate_net_hours_per_week_expect: 2.0,
        burn_rate_net_hours_per_week_unit: "my-burn_rate-hours-per-week-unit",
        burn_rate_net_hours_per_week_description: "my-burn_rate-hours-per-week-description",
        ### earned value management
        earned_value_management_planned_value: 1.0,
        earned_value_management_earned_value: 1.0,
        earned_value_management_actual_cost: 1.0,
        ### total project control
        total_project_control_dipp: 1.0,
        total_project_control_dipp_progress_index_numerator: 1.0,
        total_project_control_dipp_progress_index_denominator: 2.0,
        total_project_control_expected_monetary_value: 1.0,
        total_project_control_cost_estimate_to_complete: 1.0,
        ### deployment frequency
        deployment_frequency_actual: 1.0,
        deployment_frequency_expect: 2.0,
        deployment_frequency_unit: "my-deployment-frequency-unit",
        deployment_frequency_description: "my-deployment-frequency-description",
        ### lead time for changes
        lead_time_for_changes_actual: 1.0,
        lead_time_for_changes_expect: 2.0,
        lead_time_for_changes_unit: "my-lead-time-for-changes-unit",
        lead_time_for_changes_description: "my-lead-time-for-changes-description",
        ### change failure rate
        change_failure_rate_actual: 1.0,
        change_failure_rate_expect: 2.0,
        change_failure_rate_unit: "my-change-failure-rate-unit",
        change_failure_rate_description: "my-change-failure-rate-description",
        ### mean time to_ ecovery
        mean_time_to_recovery_actual: 1.0,
        mean_time_to_recovery_expect: 2.0,
        mean_time_to_recovery_unit: "my-mean-time-to-recovery-unit",
        mean_time_to_recovery_description: "my-mean-time-to-recovery-description",
        ### maintainability index
        maintainability_index_actual: 1.0,
        maintainability_index_expect: 2.0,
        maintainability_index_unit: "my-maintainability-index-unit",
        maintainability_index_description: "my-maintainability-index-description",
        ### line count
        line_count_actual: 1.0,
        line_count_expect: 2.0,
        line_count_unit: "my-line-count-unit",
        line_count_description: "my-line-count-description",
        ### test automation code coverage
        test_automation_code_coverage_actual: 1.0,
        test_automation_code_coverage_expect: 2.0,
        test_automation_code_coverage_unit: "my-test-automation-code-coverage-unit",
        test_automation_code_coverage_description: "my-test-automation-code-coverage-description",
        ### halstead_complexity
        halstead_complexity_volume_actual: 1.0,
        halstead_complexity_volume_expect: 2.0,
        halstead_complexity_volume_unit: "my-halstead-complexity-volume-unit",
        halstead_complexity_volume_description: "my-halstead-complexity-volume-description",
        halstead_complexity_difficulty_actual: 1.0,
        halstead_complexity_difficulty_expect: 2.0,
        halstead_complexity_difficulty_unit: "my-halstead-complexity-difficulty-unit",
        halstead_complexity_difficulty_description: "my-halstead-complexity-difficulty-description",
        halstead_complexity_effort_actual: 1.0,
        halstead_complexity_effort_expect: 2.0,
        halstead_complexity_effort_unit: "my-halstead-complexity-effort-unit",
        halstead_complexity_effort_description: "my-halstead-complexity-effort-description",
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

  test "show", %{conn: conn} do
    x = x!()
    conn = get(conn, ~p"/plans/#{x.id}")
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
    assert response =~ "ORCID URL: <a href=\"#{x.orcid_as_url}\">#{x.orcid_as_url}</a>"
    assert response =~ "TikTok URL: <a href=\"#{x.tiktok_as_url}\">#{x.tiktok_as_url}</a>"
    assert response =~ "Wikipedia URL: <a href=\"#{x.wikipedia_as_url}\">#{x.wikipedia_as_url}</a>"
    assert response =~ "YouTube URL: <a href=\"#{x.youtube_as_url}\">#{x.youtube_as_url}</a>"

    assert response =~ "Location"
    assert response =~ "Country code ISO 3166-1 Alpha 2: #{x.location_iso_3166_1_alpha_2}"
    assert response =~ "Subcountry code ISO 3166-2: #{x.location_iso_3166_2}"
    assert response =~ "location_postal_code: #{x.location_postal_code}"
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

    assert response =~ "Arc42"
    assert response =~ "URL: <a href=\"#{x.arc42_as_url}\">#{x.arc42_as_url}</a>"
    assert response =~ "01: Introduction and Goals: #{x.arc42_01_introduction_and_goals_as_markdown}"
    assert response =~ "02: Constraints: #{x.arc42_02_constraints_as_markdown}"
    assert response =~ "03: Context and Scope: #{x.arc42_03_context_and_scope_as_markdown}"
    assert response =~ "04: Solution Strategy: #{x.arc42_04_solution_strategy_as_markdown}"
    assert response =~ "05: Building Block View: #{x.arc42_05_building_block_view_as_markdown}"
    assert response =~ "06: Runtime View: #{x.arc42_06_runtime_view_as_markdown}"
    assert response =~ "07: Deployment View: #{x.arc42_07_deployment_view_as_markdown}"
    assert response =~ "08: Crosscutting Concepts: #{x.arc42_08_crosscutting_concepts_as_markdown}"
    assert response =~ "09: Architectural Decisions: #{x.arc42_09_architectural_decisions_as_markdown}"
    assert response =~ "10: Quality Requirements: #{x.arc42_10_quality_requirements_as_markdown}"
    assert response =~ "11: Risks and Technical Debt: #{x.arc42_11_risks_and_technical_debt_as_markdown}"
    assert response =~ "12: Glossary: #{x.arc42_12_glossary_as_markdown}"

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

    assert response =~ "Quality"
    assert response =~ "Availability: #{x.quality_availability_as_markdown}"
    assert response =~ "Certifiability: #{x.quality_certifiability_as_markdown}"
    assert response =~ "Compatibility: #{x.quality_compatibility_as_markdown}"
    assert response =~ "Efficiency: #{x.quality_efficiency_as_markdown}"
    assert response =~ "Governability: #{x.quality_governability_as_markdown}"
    assert response =~ "Maintainability: #{x.quality_maintainability_as_markdown}"
    assert response =~ "Observability: #{x.quality_observability_as_markdown}"
    assert response =~ "Operability: #{x.quality_operability_as_markdown}"
    assert response =~ "Recoverability: #{x.quality_recoverability_as_markdown}"
    assert response =~ "Scalability: #{x.quality_scalability_as_markdown}"
    assert response =~ "Security: #{x.quality_security_as_markdown}"
    assert response =~ "Suitability: #{x.quality_suitability_as_markdown}"
    assert response =~ "Testability: #{x.quality_testability_as_markdown}"
    assert response =~ "Transferability: #{x.quality_transferability_as_markdown}"
    assert response =~ "Translatability: #{x.quality_translatability_as_markdown}"
    assert response =~ "Warrantability: #{x.quality_warrantability_as_markdown}"

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

    assert response =~ "Uptime Percentage"
    assert response =~ "Actual Value: #{x.uptime_percentage_actual}"
    assert response =~ "Target Value: #{x.uptime_percentage_expect}"
    assert response =~ "Unit: #{x.uptime_percentage_unit}"
    assert response =~ "Description: #{x.uptime_percentage_description}"

    assert response =~ "Burn Rate"

    assert response =~ "Net Cash Per Week"
    assert response =~ "Actual Value: #{x.burn_rate_net_cash_per_week_actual}"
    assert response =~ "Target Value: #{x.burn_rate_net_cash_per_week_expect}"
    assert response =~ "Unit: #{x.burn_rate_net_cash_per_week_unit}"
    assert response =~ "Description: #{x.burn_rate_net_cash_per_week_description}"

    assert response =~ "Net Hours Per Week"
    assert response =~ "Actual Value: #{x.burn_rate_net_hours_per_week_actual}"
    assert response =~ "Target Value: #{x.burn_rate_net_hours_per_week_expect}"
    assert response =~ "Unit: #{x.burn_rate_net_hours_per_week_unit}"
    assert response =~ "Description: #{x.burn_rate_net_hours_per_week_description}"

    assert response =~ "Earned Value Management (EVM)"
    assert response =~ "Planned Value (PV): #{x.earned_value_management_planned_value}"
    assert response =~ "Earned Value (EV): #{x.earned_value_management_earned_value}"
    assert response =~ "Actual Cost (AC): #{x.earned_value_management_actual_cost}"
    assert response =~ "Cost Variance: #{x.earned_value_management_cost_variance}"
    assert response =~ "Cost Variance Ratio: #{x.earned_value_management_cost_variance_ratio}"
    assert response =~ "Cost Performance Index: #{x.earned_value_management_cost_performance_index}"
    assert response =~ "Schedule Variance: #{x.earned_value_management_schedule_variance}"
    assert response =~ "Schedule Variance Ratio: #{x.earned_value_management_schedule_variance_ratio}"
    assert response =~ "Schedule Performance Index: #{x.earned_value_management_schedule_performance_index}"

    assert response =~ "Total Project Control"
    assert response =~ "DIPP: #{x.total_project_control_dipp}"
    assert response =~ "Progress Index (ratio): #{x.total_project_control_dipp_progress_index_ratio}"
    assert response =~ "Progress Index (numerator): #{x.total_project_control_dipp_progress_index_numerator}"
    assert response =~ "Progress Index (denominator): #{x.total_project_control_dipp_progress_index_denominator}"
    assert response =~ "Expected Monetary Value: #{x.total_project_control_expected_monetary_value}"
    assert response =~ "Cost Estimate To Complete: #{x.total_project_control_cost_estimate_to_complete}"

    assert response =~ "Deployment Frequency"
    assert response =~ "Actual Value: #{x.deployment_frequency_actual}"
    assert response =~ "Target Value: #{x.deployment_frequency_expect}"
    assert response =~ "Ratio: #{x.deployment_frequency_ratio}"
    assert response =~ "Unit: #{x.deployment_frequency_unit}"
    assert response =~ "Description: #{x.deployment_frequency_description}"

    assert response =~ "Lead Time For Changes"
    assert response =~ "Actual Value: #{x.lead_time_for_changes_actual}"
    assert response =~ "Target Value: #{x.lead_time_for_changes_expect}"
    assert response =~ "Ratio: #{x.lead_time_for_changes_ratio}"
    assert response =~ "Unit: #{x.lead_time_for_changes_unit}"
    assert response =~ "Description: #{x.lead_time_for_changes_description}"

    assert response =~ "Change Failure Rate"
    assert response =~ "Actual Value: #{x.change_failure_rate_actual}"
    assert response =~ "Target Value: #{x.change_failure_rate_expect}"
    assert response =~ "Ratio: #{x.change_failure_rate_ratio}"
    assert response =~ "Unit: #{x.change_failure_rate_unit}"
    assert response =~ "Description: #{x.change_failure_rate_description}"

    assert response =~ "Mean Time To Recovery"
    assert response =~ "Actual Value: #{x.mean_time_to_recovery_actual}"
    assert response =~ "Target Value: #{x.mean_time_to_recovery_expect}"
    assert response =~ "Ratio: #{x.mean_time_to_recovery_ratio}"
    assert response =~ "Unit: #{x.mean_time_to_recovery_unit}"
    assert response =~ "Description: #{x.mean_time_to_recovery_description}"

    assert response =~ "Maintainability Index"
    assert response =~ "Actual Value: #{x.maintainability_index_actual}"
    assert response =~ "Target Value: #{x.maintainability_index_expect}"
    assert response =~ "Ratio: #{x.maintainability_index_ratio}"
    assert response =~ "Unit: #{x.maintainability_index_unit}"
    assert response =~ "Description: #{x.maintainability_index_description}"

    assert response =~ "Line Count"
    assert response =~ "Actual Value: #{x.line_count_actual}"
    assert response =~ "Target Value: #{x.line_count_expect}"
    assert response =~ "Ratio: #{x.line_count_ratio}"
    assert response =~ "Unit: #{x.line_count_unit}"
    assert response =~ "Description: #{x.line_count_description}"

    assert response =~ "Test Automation Code Coverage"
    assert response =~ "Actual Value: #{x.test_automation_code_coverage_actual}"
    assert response =~ "Target Value: #{x.test_automation_code_coverage_expect}"
    assert response =~ "Ratio: #{x.test_automation_code_coverage_ratio}"
    assert response =~ "Unit: #{x.test_automation_code_coverage_unit}"
    assert response =~ "Description: #{x.test_automation_code_coverage_description}"

    assert response =~ "Halstead Complexity Volume"

    assert response =~ "Volume"
    assert response =~ "Actual Value: #{x.halstead_complexity_volume_actual}"
    assert response =~ "Target Value: #{x.halstead_complexity_volume_expect}"
    assert response =~ "Unit: #{x.halstead_complexity_volume_unit}"
    assert response =~ "Description: #{x.halstead_complexity_volume_description}"

    assert response =~ "Difficulty"
    assert response =~ "Actual Value: #{x.halstead_complexity_difficulty_actual}"
    assert response =~ "Target Value: #{x.halstead_complexity_difficulty_expect}"
    assert response =~ "Ratio: #{x.halstead_complexity_difficulty_ratio}"
    assert response =~ "Unit: #{x.halstead_complexity_difficulty_unit}"
    assert response =~ "Description: #{x.halstead_complexity_difficulty_description}"

    assert response =~ "Effort"
    assert response =~ "Actual Value: #{x.halstead_complexity_effort_actual}"
    assert response =~ "Target Value: #{x.halstead_complexity_effort_expect}"
    assert response =~ "Ratio: #{x.halstead_complexity_effort_ratio}"
    assert response =~ "Unit: #{x.halstead_complexity_effort_unit}"
    assert response =~ "Description: #{x.halstead_complexity_effort_description}"

  end

end
