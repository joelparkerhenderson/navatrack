#!/bin/sh
set -euf

mix ash.gen.resource \
    Navatrack.Codes.UkGdadPcfRoleLevel \
    --conflicts replace \
    --default-actions read \
    --extend postgres \
    --uuid-primary-key id \
    --relationship belongs_to:uk_gdad_pcf_role:Navatrack.Codes.UkGdadPcfRoleLevel \
    --attribute name:string:required:public \
    --attribute description_as_markdown:string:required:public \

mix ash.codegen create_uk_gdad_pcf_role_levels.exs
mix ash.migrate

touch priv/repo/migrations/00000000000000_create_uk_gdad_pcf_role_levels

mkdir -p lib/navatrack_web/live/uk_gdad_pcf_role_levels
touch lib/navatrack_web/live/uk_gdad_pcf_role_levels/index_live.ex
touch lib/navatrack_web/live/uk_gdad_pcf_role_levels/show_live.ex

mkdir -p test/navatrack_web/live/uk_gdad_pcf_role_levels
touch test/navatrack_web/live/uk_gdad_pcf_role_levels/index_test.ex
touch test/navatrack_web/live/uk_gdad_pcf_role_levels/show_test.ex

cat << EOF
Edit file lib/navatrack_web/router.ex to add live routes:
live "/uk_gdad_pcf_role_levels", UkGdadPcfRoleLevels.IndexLive
live "/uk_gdad_pcf_role_levels/:id", UkGdadPcfRoleLevels.ShowLive
EOF
