# Initiative

Create a domain:

```sh
mix ash.gen.domain Navatrack.Works
```

You may need to edit file [`config/config.exs`](config/config.exs) to add:

```elixir
ash_domains: [Navatrack.Accounts, Navatrack.Works]
```

Create a initiative:

```sh
### Works.Initiative

```sh
mix ash.gen.domain Navatrack.Works
mix ash.gen.resource Navatrack.Works.Initiative \
  --conflicts replace \
  --default-actions create,read,update,destroy \
  --extend postgres \
  --uuid-primary-key id \
  --attribute parent:id \
  --attribute name:string:required \
  --attribute status:string \
  --attribute tags:string:array \
  \
  --attribute url:string \
  --attribute email:string \
  --attribute phone:string \
  --attribute messaging:string \
  --attribute postal:string \
  --attribute orcid_pid:string \
  --attribute rdf_type:string \
  \
  --attribute agents_as_url:string \
  --attribute agents_as_markdown:string \
  \
  --attribute avatar_image_400x400_url:string \
  --attribute avatar_image_400x400_alt:string \
  \
  --attribute main_image_1080x1080_url:string \
  --attribute main_image_1080x1080_alt:string \
  \
  --attribute main_image_1920x1080_url:string \
  --attribute main_image_1920x1080_alt:string \
  \
  --attribute main_image_1080x1920_url:string \
  --attribute main_image_1080x1920_alt:string \
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
  --attribute note:string \
  --attribute email_distribution_list:string \
  --attribute daisyui_timeline_html:string \
  --attribute org_mode:string \
  --attribute task_list_as_markdown:string \
  --attribute ways_of_working_as_markdown:string \
  --attribute objectives_and_key_results_as_markdown:string \
  --attribute key_performance_indicators_as_markdown:string \
  \
  --attribute glossary_as_url:string \
  --attribute glossary_as_markdown:string \
  \
  --attribute six_pager_double_sider_as_url:string \
  --attribute six_pager_double_sider_as_markdown:string \
  \
  --attribute swot_as_url:string \
  --attribute swot_as_markdown:string \
  \
  --attribute pestle_as_url:string \
  --attribute pestle_as_markdown:string \
  \
  --attribute pestle_as_url:string \
  --attribute pestle_as_markdown:string \
  \
  --attribute porters_five_forces_as_url:string \
  --attribute porters_five_forces_as_markdown:string \
  \
  --attribute pestle_as_url:string \
  --attribute pestle_as_markdown:string \
  \
  --attribute roles_and_responsibilities_as_url:string \
  --attribute roles_and_responsibilities_as_markdown:string \
  \
  --attribute responsibility_assignment_matrix_as_url:string \
  --attribute responsibility_assignment_matrix_as_markdown:string \
  \
  --attribute code_of_conduct_url:string \
  --attribute code_of_conduct_as_markdown:string \
  \
  --attribute license_url:string \
  --attribute license_as_markdown:string \
  \
  --attribute arc42_as_url:string \
  --attribute arc42_as_markdown:string \
  \
  --attribute arc42_01_introduction_and_goals_as_markdown:string \
  --attribute arc42_02_constraints_as_markdown:string \
  --attribute arc42_03_context_and_scope_as_markdown:string \
  --attribute arc42_04_solution_strategy_as_markdown:string \
  --attribute arc42_05_building_block_view_as_markdown:string \
  --attribute arc42_06_runtime_view_as_markdown:string \
  --attribute arc42_07_deployment_view_as_markdown:string \
  --attribute arc42_08_crosscutting_concepts_as_markdown:string \
  --attribute arc42_09_architectural_decisions_as_markdown:string \
  --attribute arc42_10_quality_requirements_as_markdown:string \
  --attribute arc42_11_risks_and_technical_debt_as_markdown:string \
  --attribute arc42_12_glossary_as_markdown:string \
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
  --attribute quality_availability_as_markdown:string \
  --attribute quality_certifiability_as_markdown:string \
  --attribute quality_compatibility_as_markdown:string \
  --attribute quality_efficiency_as_markdown:string \
  --attribute quality_governability_as_markdown:string \
  --attribute quality_maintainability_as_markdown:string \
  --attribute quality_observability_as_markdown:string \
  --attribute quality_operability_as_markdown:string \
  --attribute quality_recoverability_as_markdown:string \
  --attribute quality_scalability_as_markdown:string \
  --attribute quality_security_as_markdown:string \
  --attribute quality_suitability_as_markdown:string \
  --attribute quality_testability_as_markdown:string \
  --attribute quality_transferability_as_markdown:string \
  --attribute quality_translatability_as_markdown:string \
  --attribute quality_warrantability_as_markdown:string \
  \
  --attribute apache_echart_as_url:string \
  --attribute apache_echart_as_typescript:string \
  \
  --attribute net_promoter_score_actual_value:decimal \
  --attribute net_promoter_score_target_value:decimal \
  --attribute net_promoter_score_unit:string \
  --attribute net_promoter_score_description_as_markdown:string \
  \
  --attribute active_users_actual_value:integer \
  --attribute active_users_target_value:integer \
  --attribute active_users_unit:string \
  --attribute active_users_description_as_markdown:string \
  \
  --attribute uptime_percentage_actual_value:decimal \
  --attribute uptime_percentage_target_value:decimal \
  --attribute uptime_percentage_unit:string \
  --attribute uptime_percentage_description_as_markdown:string \
  \
  --attribute burn_rate_net_cash_per_week_actual_value:integer \
  --attribute burn_rate_net_cash_per_week_target_value:integer \
  --attribute burn_rate_net_cash_per_week_unit:string \
  --attribute burn_rate_net_cash_per_week_description_as_markdown:string \
  \
  --attribute burn_rate_hours_per_week_actual_value:integer \
  --attribute burn_rate_hours_per_week_target_value:integer \
  --attribute burn_rate_hours_per_week_unit:string \
  --attribute burn_rate_hours_per_week_description_as_markdown:string \
  \
  --attribute total_project_control_dipp:decimal \
  --attribute total_project_control_dipp_progress_index_ratio:decimal \
  --attribute total_project_control_dipp_progress_index_numerator:decimal \
  --attribute total_project_control_dipp_progress_index_denominator:decimal \
  --attribute total_project_control_expected_monetary_value:decimal \
  --attribute total_project_control_cost_estimate_to_complete:decimal \
  \
  --attribute deployment_frequency_actual_value:decimal \
  --attribute deployment_frequency_target_value:decimal \
  --attribute deployment_frequency_unit:string \
  --attribute deployment_frequency_description_as_markdown:string \
  \
  --attribute lead_time_for_changes_actual_value:decimal \
  --attribute lead_time_for_changes_target_value:decimal \
  --attribute lead_time_for_changes_unit:string \
  --attribute lead_time_for_changes_description_as_markdown:string \
  \
  --attribute change_failure_rate_actual_value:decimal \
  --attribute change_failure_rate_target_value:decimal \
  --attribute change_failure_rate_unit:string \
  --attribute change_failure_rate_description_as_markdown:string \
  \
  --attribute mean_time_to_recovery_actual_value:decimal \
  --attribute mean_time_to_recovery_target_value:decimal \
  --attribute mean_time_to_recovery_unit:string \
  --attribute mean_time_to_recovery_description_as_markdown:string\
  \
  --attribute maintainability_index_actual_value:decimal \
  --attribute maintainability_index_target_value:decimal \
  --attribute maintainability_index_unit:string \
  --attribute maintainability_index_description_as_markdown:string \
  \
  --attribute line_count_actual_value:decimal \
  --attribute line_count_target_value:decimal \
  --attribute line_count_unit:string \
  --attribute line_count_description_as_markdown:string \
  \
  --attribute test_automation_code_coverage_actual_value:decimal \
  --attribute test_automation_code_coverage_target_value:decimal \
  --attribute test_automation_code_coverage_unit:string \
  --attribute test_automation_code_coverage_description_as_markdown:string \
  \
  --attribute halstead_complexity_volume_actual_value:decimal \
  --attribute halstead_complexity_volume_target_value:decimal \
  --attribute halstead_complexity_volume_unit:string \
  --attribute halstead_complexity_volume_description_as_markdown:string \
  \
  --attribute halstead_complexity_difficulty_actual_value:decimal \
  --attribute halstead_complexity_difficulty_target_value:decimal \
  --attribute halstead_complexity_difficulty_unit:string \
  --attribute halstead_complexity_difficulty_description_as_markdown:string \
  \
  --attribute halstead_complexity_effort_actual_value:decimal \
  --attribute halstead_complexity_effort_target_value:decimal \
  --attribute halstead_complexity_effort_unit:string \
  --attribute halstead_complexity_effort_description_as_markdown:string \

```

Unused:

```sh
  --attribute location_iso_3166_1_alpha_2:string \
  --attribute location_iso_3166_2:string \
  --attribute location_latitude_as_decimal_degrees:decimal \
  --attribute location_longitude_as_decimal_degrees:decimal \
```

Migrate:

```sh
mix ash.codegen create_initiatives
mix ash.migrate
```

Edit file [`lib/navatrack_web/router.ex`](lib/navatrack/router.ex) to add these live routes:

```elixir
scope "/", AppWeb do
    pipe_through :browser

    get "/", PageController, :home

    live "/initiatives", Initiatives.IndexLive
    live "/initiatives/new", Initiatives.FormLive, :new
    live "/initiatives/:id", Initiatives.ShowLive
    live "/initiatives/:id/edit", Initiatives.FormLive, :edit
end
```

Create a initiatives directory for views:

```sh
mkdir -p ~/git/sixarm/navatrack/lib/navatrack_web/live/initiatives
```

## Debug

Edit file [`config/dev.exs`](config/dev.exs) to configure Ash debugging:

```elixir
# Enable Ash framework debug messages
config :ash,
  debug?: true
```

In the file, also edit the logger line to make sure the level is debug:

```elixir
# Do not include metadata nor timestamps in development logs
config :logger,
  :default_formatter,
  format: "[$level] $message\n",
  level: :debug,
  truncate: :infinity
```
