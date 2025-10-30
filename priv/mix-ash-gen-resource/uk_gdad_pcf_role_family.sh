#!/bin/sh
set -euf

mix ash.gen.resource \
    Navatrack.Codes.UkGdadPcfRoleFamily \
    --conflicts replace \
    --default-actions read \
    --extend postgres \
    --uuid-primary-key id \
    --attribute locale_code:string:required:public \
    --attribute name:string:required:public \

mix ash.codegen create_uk_gdad_pcf_role_families.exs
mix ash.migrate

touch priv/repo/migrations/00000000000000_create_uk_gdad_pcf_role_families

mkdir -p lib/navatrack_web/live/uk_gdad_pcf_role_families
touch lib/navatrack_web/live/uk_gdad_pcf_role_families/index_live.ex
touch lib/navatrack_web/live/uk_gdad_pcf_role_families/show_live.ex

mkdir -p test/navatrack_web/live/uk_gdad_pcf_role_families
touch test/navatrack_web/live/uk_gdad_pcf_role_families/index_test.ex
touch test/navatrack_web/live/uk_gdad_pcf_role_families/show_test.ex

cat << EOF
Edit file lib/navatrack_web/router.ex to add live routes:
live "/uk_gdad_pcf_role_families", UkGdadPcfRoleFamilies.IndexLive
live "/uk_gdad_pcf_role_families/:id", UkGdadPcfRoleFamilies.ShowLive
EOF