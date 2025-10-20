#!/bin/sh
set -euf

mix ash.gen.resource \
    Navatrack.Works.Group \
    --conflicts replace \
    --default-actions create,read,update,destroy \
    --extend postgres \
    --uuid-primary-key id \
    --attribute name:string:required \
    --attribute sign:string \
    --attribute status:string \
    --attribute tagging:string \
    --attribute note:string \
    \
    --attribute parent_id:id \
    --attribute parent_order:integer \
    \
    --attribute web:string \
    --attribute email:string \
    --attribute phone:string \
    --attribute chat:string \
    --attribute calendar:string \
    --attribute postal:string \
    --attribute rdf_type:string \
    \
    --attribute bluesky_as_url:string \
    --attribute codeberg_as_url:string \
    --attribute facebook_as_url:string \
    --attribute github_as_url:string \
    --attribute instagram_as_url:string \
    --attribute linkedin_as_url:string \
    --attribute orcid_as_url:string \
    --attribute tiktok_as_url:string \
    --attribute wikipedia_as_url:string \
    --attribute youtube_as_url:string \
    \
    --attribute location_iso_3166_1_alpha_2:string \
    --attribute location_iso_3166_2:string \
    --attribute location_postal_code:string \
    --attribute location_latitude_as_decimal_degrees:decimal \
    --attribute location_longitude_as_decimal_degrees:decimal \
    \
    --attribute avatar_image_400x400_url:string \
    --attribute avatar_image_400x400_alt:string \
    --attribute main_image_1080x1080_url:string \
    --attribute main_image_1080x1080_alt:string \
    --attribute main_image_1920x1080_url:string \
    --attribute main_image_1920x1080_alt:string \
    --attribute main_image_1080x1920_url:string \
    --attribute main_image_1080x1920_alt:string \
    \
    --attribute purpose_statement:string \
    --attribute :vision_statement:string \
    --attribute :mission_statement:string \
    --attribute :values_statement:string \
    \
    --attribute :ai_agent_instructions_as_url:string \
    --attribute :ai_agent_instructions_as_markdown:string \
    \
    --attribute home_emoji_url:string \
    --attribute bellhop_bell_emoji_url:string \
    --attribute target_emoji_url:string \
    --attribute gear_emoji_url:string \
    --attribute spiral_calendar_emoji_url:string \
    --attribute sparkles_emoji_url:string \
    --attribute speech_bubble_emoji_url:string \
    --attribute newspaper_emoji_url:string \
    --attribute bar_chart_emoji_url:string \
    --attribute movie_camera_emoji_url:string \
    --attribute construction_worker_emoji_url:string \
    --attribute crystal_ball_emoji_url:string \
    --attribute butterfly_emoji_url:string \
    --attribute lady_beetle_emoji_url:string \
    \
    --attribute email_distribution_list:string \
    --attribute daisyui_timeline_html:string \
    --attribute org_mode:string \
    --attribute task_list_as_markdown:string \
    --attribute ways_of_working_as_markdown:string \
    --attribute objectives_and_key_results_as_markdown:string \
    --attribute key_performance_indicators_as_markdown:string \
    --attribute glossary_as_url:string \
    --attribute glossary_as_markdown:string \
    --attribute roles_and_responsibilities_as_url:string \
    --attribute roles_and_responsibilities_as_markdown:string \
    --attribute responsibility_assignment_matrix_as_url:string \
    --attribute responsibility_assignment_matrix_as_markdown:string \
    \
    --attribute gs1_digital_link:string \
    --attribute gs1_country_code:string \
    --attribute gs1_global_location_number:string \
    --attribute isic_v4_code:string \
    --attribute isic_v4_name:string \
    --attribute six_pager_double_sider_as_url:string \
    --attribute six_pager_double_sider_as_markdown:string \
    \
    --attribute swot_as_url:string \
    --attribute swot_strengths_as_markdown:string \
    --attribute swot_weaknesses_as_markdown:string \
    --attribute swot_opportunities_as_markdown:string \
    --attribute swot_threats_as_markdown:string \
    \
    --attribute sipoc_as_url:string \
    --attribute sipoc_suppliers_as_markdown:string \
    --attribute sipoc_inputs_as_markdown:string \
    --attribute sipoc_processes_as_markdown:string \
    --attribute sipoc_outputs_as_markdown:string \
    --attribute sipoc_customers_as_markdown:string \
    \
    --attribute steeple_as_url:string \
    --attribute steeple_social_as_markdown:string \
    --attribute steeple_technological_as_markdown:string \
    --attribute steeple_economic_as_markdown:string \
    --attribute steeple_environmental_as_markdown:string \
    --attribute steeple_political__as_markdown:string \
    --attribute steeple_legal_as_markdown:string \
    --attribute steeple_ethical_as_markdown:string \
    \
    --attribute porters_five_forces_as_url:string \
    --attribute porters_five_forces_entrants_as_markdown:string \
    --attribute porters_five_forces_substitutes_as_markdown:string \
    --attribute porters_five_forces_customers_as_markdown:string \
    --attribute porters_five_forces_suppliers_as_markdown:string \
    --attribute porters_five_forces_competitors_as_markdown:string \
    \
    --attribute code_of_conduct_policy_as_url:string \
    --attribute code_of_conduct_policy_as_markdown:string \
    --attribute coordinated_disclosure_policy_as_url:string \
    --attribute coordinated_disclosure_policy_as_markdown:string \
    --attribute code_of_conduct_policy_as_url:string \
    --attribute code_of_conduct_policy_as_markdown:string \
    --attribute copyright_policy_as_url:string \
    --attribute copyright_policy_as_markdown:string \
    --attribute corrections_policy_as_url:string \
    --attribute corrections_policy_as_markdown:string \
    --attribute diversity_policy_as_url:string \
    --attribute diversity_policy_as_markdown:string \
    --attribute equal_opportunity_policy_as_url:string \
    --attribute equal_opportunity_policy_as_markdown:string \
    --attribute ethics_policy_as_url:string \
    --attribute ethics_policy_as_markdown:string \
    --attribute legal_policy_as_url:string \
    --attribute legal_policy_as_markdown:string \
    --attribute license_policy_as_url:string \
    --attribute license_policy_as_markdown:string \
    --attribute open_source_policy_as_url:string \
    --attribute open_source_policy_as_markdown:string \
    --attribute privacy_policy_as_url:string \
    --attribute privacy_policy_as_markdown:string \
    --attribute safety_policy_as_url:string \
    --attribute safety_policy_as_markdown:string \
    --attribute security_policy_as_url:string \
    --attribute security_policy_as_markdown:string \
    --attribute socials_policy_as_url:string \
    --attribute socials_policy_as_markdown:string \
    --attribute staff_policy_as_url:string \
    --attribute staff_policy_as_markdown:string \
    \
    --attribute explain_stakeholders_as_markdown:string \
    --attribute explain_history_as_markdown:string \
    --attribute explain_authentication_as_markdown:string \
    --attribute explain_authorization_as_markdown:string \
    --attribute explain_use_cases_as_markdown:string \
    --attribute explain_demographics_as_markdown:string \
    --attribute explain_ui_as_markdown:string \
    --attribute explain_api_as_markdown:string \
    --attribute explain_data_as_markdown:string \
    --attribute explain_mobile_as_markdown:string \
    --attribute explain_legal_as_markdown:string \
    --attribute explain_financial_as_markdown:string \
    --attribute explain_service_level_agreement_as_markdown:string \
    --attribute explain_disaster_recovery_as_markdown:string \
    \
    --attribute apache_echart_as_url:string \
    --attribute apache_echart_as_typescript:string \
    \
    --attribute net_promoter_score_customer_perspective_actual:decimal \
    --attribute net_promoter_score_customer_perspective_expect:decimal \
    --attribute net_promoter_score_customer_perspective_ratio:decimal \
    --attribute net_promoter_score_customer_perspective_unit:string \
    --attribute net_promoter_score_customer_perspective_description_as_markdown:string \
    \
    --attribute net_promoter_score_user_perspective_actual:decimal \
    --attribute net_promoter_score_user_perspective_expect:decimal \
    --attribute net_promoter_score_user_perspective_ratio:decimal \
    --attribute net_promoter_score_user_perspective_unit:string \
    --attribute net_promoter_score_user_perspective_description_as_markdown:string \
    \
    --attribute net_promoter_score_worker_perspective_actual:decimal \
    --attribute net_promoter_score_worker_perspective_expect:decimal \
    --attribute net_promoter_score_worker_perspective_ratio:decimal \
    --attribute net_promoter_score_worker_perspective_unit:string \
    --attribute net_promoter_score_worker_perspective_description_as_markdown:string \
    \
    --attribute active_users_actual:decimal \
    --attribute active_users_expect:decimal \
    --attribute active_users_ratio:decimal \
    --attribute active_users_unit:string \
    --attribute active_users_description_as_markdown:string \

mix ash.codegen create_groups
mix ash.migrate

touch priv/repo/migrations/00000000000000_create_groups.exs

mkdir -p lib/navatrack_web/live/groups
touch lib/navatrack_web/live/groups/form_live.ex
touch lib/navatrack_web/live/groups/index_live.ex
touch lib/navatrack_web/live/groups/show_live.ex

mkdir -p test/navatrack_web/live/groups
touch test/navatrack_web/live/groups/form_test.ex
touch test/navatrack_web/live/groups/index_test.ex
touch test/navatrack_web/live/groups/show_test.ex

cat << EOF
Edit file lib/navatrack_web/router.ex to add live routes:
live "/groups", Groups.IndexLive
live "/groups/new", Groups.FormLive, :new
live "/groups/:id", Groups.ShowLive
live "/groups/:id/edit", Groups.FormLive, :edit
EOF
