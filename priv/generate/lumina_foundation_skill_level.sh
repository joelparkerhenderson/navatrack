#!/bin/sh
set -euf

export App=Navatrack
export app=navatrack
export Dom=Codes
export Resource=LuminaFoundationSkillLevel
export resource=lumina_foundation_skill_level
export Resources=LuminaFoundationSkillLevels
export resources=lumina_foundation_skill_levels

mix ash.gen.resource \
    $App.$Dom.$Resource \
    --conflicts replace \
    --default-actions read \
    --extend postgres \
    --uuid-primary-key id \
    --attribute locale_code:string:required:public \
    --attribute number:integer:required:public \
    --attribute name:string:required:public \
    --attribute description:string:required:public \

mix ash.codegen create_lumina_foundation_skill_level
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
