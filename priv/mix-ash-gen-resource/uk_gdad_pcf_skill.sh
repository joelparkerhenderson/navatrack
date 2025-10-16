#!/bin/sh
set -euf

mix ash.gen.resource \
    Navatrack.Codes.UkGdadPcfSkill \
    --conflicts replace \
    --default-actions read \
    --extend postgres \
    --uuid-primary-key id \
    --attribute locale_code:string:required:public \
    --attribute name:string:required:public \
    --attribute url:string:required:public \
    --attribute description:string:required:public \
    --attribute level_1_description_as_markdown:markdown:required:public \
    --attribute level_2_description_as_markdown:markdown:required:public \
    --attribute level_3_description_as_markdown:string:required:public \
    --attribute level_4_description_as_markdown:string:required:public \
    --attribute roles_that_require_this_skill_as_markdown:string:required:public \

mix ash.codegen create_uk_gdad_pcf_skills
mix ash.migrate


touch priv/repo/migrations/00000000000000_create_uk_gdad_pcf_skills

mkdir -p lib/navatrack_web/live/uk_gdad_pcf_skills
touch lib/navatrack_web/live/uk_gdad_pcf_skills/index_live.ex
touch lib/navatrack_web/live/uk_gdad_pcf_skills/show_live.ex

mkdir -p test/navatrack_web/live/uk_gdad_pcf_skills
touch test/navatrack_web/live/uk_gdad_pcf_skills/index_live.ex
touch test/navatrack_web/live/uk_gdad_pcf_skills/show_live.ex

cat << EOF
Edit file lib/navatrack_web/router.ex to add live routes:
live "/uk_gdad_pcf_skills", UkGdadPcfSkills.IndexLive
live "/uk_gdad_pcf_skills/:id", UkGdadPcfSkills.ShowLive
EOF