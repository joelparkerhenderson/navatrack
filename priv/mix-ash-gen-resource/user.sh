#!/bin/sh
set -euf

# This uses many flat fields i.e. not relations, because for this project we
# prefer the simplest maintainability and leanest lookups.
#
# After run, we need to fix two conflicts:
#
# * The argument `:email` on action `:request_magic_link` should have `:type` set to `Ash.Type.String`
#
# * The argument `:email` on action `:get_by_email` should have `:type` set to `Ash.Type.String`
#
# Edit file [`lib/navatrack/accounts/user.ex`](lib/navatrack/accounts/user.ex):
#
# * Find the text `request_magic_link` and change the email type from `ci_string` into `string`.
#
# * Find the text `get_by_email` and change the email type from `ci_string` into `string`.

mix ash.gen.resource \
    Navatrack.Accounts.User \
    --conflicts replace \
    --default-actions create,read,update,destroy \
    --extend postgres \
    --uuid-primary-key id \
    --attribute name:string \
    --attribute status:string \
    --attribute tagging:string \
    --attribute note:string \
    \
    --attribute web:string \
    --attribute email:string \
    --attribute phone:string \
    --attribute chat:string \
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
    --attribute email_distribution_list:string \
    --attribute daisyui_timeline_html:string \
    --attribute org_mode:string \
    --attribute task_list_as_markdown:string \
    --attribute ways_of_working_as_markdown:string \
    --attribute objectives_and_key_results_as_markdown:string \
    --attribute key_performance_indicators_as_markdown:string \
    \
    --attribute avatar_image_400x400_url:string \
    --attribute avatar_image_400x400_alt:string \
    --attribute main_main_image_1080x1080_url:string \
    --attribute main_main_image_1080x1080_alt:string \
    --attribute main_main_image_1920x1080_url:string \
    --attribute main_main_image_1920x1080_alt:string \
    --attribute main_main_image_1080x1920_url:string \
    --attribute main_main_image_1080x1920_alt:string \
    \
    --attribute purpose_statement:string \
    --attribute :vision_statement:string \
    --attribute :mission_statement:string \
    --attribute :values_statement:string \
    \
    --attribute :ai_agent_instructions_as_url:string \
    --attribute :ai_agent_instructions_as_markdown:string \
    \
    --attribute work_profile_resume_as_pdf_url:string \
    --attribute work_profile_resume_as_markdown:string \
    --attribute work_profile_curriculum_vitae_as_pdf_url:string \
    --attribute work_profile_curriculum_vitae_as_markdown:string \
    \
    --attribute work_role_name:string \
    --attribute work_role_start_date:date \
    --attribute work_role_stop_date:date \
    --attribute work_role_level:string \
    --attribute work_role_description_as_markdown:string \
    --attribute work_role_professional_development_plan_as_markdown:string \
    --attribute work_role_onet_soc_2019_code:string \
    --attribute work_role_uk_civil_service_grade_abbreviation:string \
    --attribute work_role_uk_soc_2020_code:string \
    --attribute work_role_uk_gdad_pcf_url:string \

mix ash.codegen create_users
mix ash.migrate

touch priv/repo/migrations/00000000000000_create_users.exs

mkdir -p lib/navatrack_web/live/users
touch lib/navatrack_web/live/users/form_live.ex
touch lib/navatrack_web/live/users/index_live.ex
touch lib/navatrack_web/live/users/show_live.ex

mkdir -p test/navatrack_web/live/users
touch test/navatrack_web/live/users/form_test.ex
touch test/navatrack_web/live/users/index_test.ex
touch test/navatrack_web/live/users/show_test.ex

cat << EOF
Edit file lib/navatrack_web/router.ex to add live routes:
live "/users", Users.IndexLive
live "/users/new", Users.FormLive, :new
live "/users/:id", Users.ShowLive
live "/users/:id/edit", Users.FormLive, :edit
EOF
