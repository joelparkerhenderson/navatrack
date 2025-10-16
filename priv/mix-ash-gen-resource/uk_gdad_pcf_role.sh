#!/bin/sh
set -euf

mix ash.gen.resource \
    Navatrack.Codes.UkGdadPcfRole \
    --conflicts replace \
    --default-actions read \
    --extend postgres \
    --uuid-primary-key id \
    --attribute locale_code:string:required:public \
    --attribute family:string:required:public \
    --attribute name:string:required:public \
    --attribute url:string:required:public \
    --attribute description_as_markdown:string:required:public \
    --attribute level_name:string:required:public \
    --attribute level_description_as_markdown:string:required:public \
    --attribute senior_civil_service_flag:boolean:required:public \

mix ash.codegen create_uk_gdad_pcf_roles
mix ash.migrate

touch priv/repo/migrations/00000000000000_create_uk_gdad_pcf_roles

mkdir -p lib/navatrack_web/live/uk_gdad_pcf_roles
touch lib/navatrack_web/live/uk_gdad_pcf_roles/index_live.ex
touch lib/navatrack_web/live/uk_gdad_pcf_roles/show_live.ex

mkdir -p test/navatrack_web/live/uk_gdad_pcf_roles
touch test/navatrack_web/live/uk_gdad_pcf_roles/index_live.ex
touch test/navatrack_web/live/uk_gdad_pcf_roles/show_live.ex

cat << EOF
Edit file lib/navatrack_web/router.ex to add live routes:
live "/uk_gdad_pcf_roles", UkGdadPcfRoles.IndexLive
live "/uk_gdad_pcf_roles/:id", UkGdadPcfRoles.ShowLive
EOF