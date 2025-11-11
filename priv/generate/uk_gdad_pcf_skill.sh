#!/bin/sh
set -euf

export App=Navatrack
export app=navatrack
export Dom=Codes
export Resource=UkGdadPcfSkill
export resource=uk_gdad_pcf_skill
export Resources=UkGdadPcfSkills
export resources=uk_gdad_pcf_skills

mix ash.gen.resource \
    $App.$Dom.$Resource \
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

touch priv/repo/migrations/00000000000000_create_$resources.exs

mkdir -p lib/${app}_web/live/$resources
touch lib/${app}_web/live/$resources/index_live.ex
touch lib/${app}_web/live/$resources/show_live.ex

mkdir -p test/${app}_web/live/$resources
touch test/${app}_web/live/$resources/index_test.ex
touch test/${app}_web/live/$resources/show_test.ex

cat << EOF
Edit file lib/${app}_web/router.ex to add live routes:
live "$resources", $Resources.IndexLive
live "$resources/:id", $Resources.ShowLive
EOF