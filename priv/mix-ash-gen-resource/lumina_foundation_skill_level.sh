#!/bin/sh
set -euf

mix ash.gen.resource \
    Navatrack.Codes.LuminaFoundationSkillLevel \
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

touch priv/repo/migrations/00000000000000_create_lumina_foundation_skill_levels.exs

mkdir -p lib/navatrack_web/live/lumina_foundation_skill_level
touch lib/navatrack_web/live/lumina_foundation_skill_level/index_live.ex
touch lib/navatrack_web/live/lumina_foundation_skill_level/show_live.ex

mkdir -p test/navatrack_web/live/lumina_foundation_skill_level
touch test/navatrack_web/live/lumina_foundation_skill_level/index_test.ex
touch test/navatrack_web/live/lumina_foundation_skill_level/show_test.ex

cat << EOF
Edit file lib/navatrack_web/router.ex to add live routes:
live "/lumina_foundation_skill_level", LuminaFoundationSkillLevels.IndexLive
live "/lumina_foundation_skill_level/:id", LuminaFoundationSkillLevels.ShowLive
EOF
