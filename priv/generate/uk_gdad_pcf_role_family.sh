#!/bin/sh
set -euf

export App=Navatrack
export app=navatrack
export Dom=Codes
export Resource=UkGdadPcfRoleFamily
export Resources=UkGdadPcfRoleFamilies
export resources=uk_gdad_pcf_role_families

mix ash.gen.resource \
    $App.$Dom.$Resource \
    --conflicts replace \
    --default-actions read \
    --extend postgres \
    --uuid-primary-key id \
    --attribute locale_code:string:required:public \
    --attribute name:string:required:public \

mix ash.codegen create_uk_gdad_pcf_role_families.exs
mix ash.migrate

touch priv/repo/migrations/00000000000000_create_uk_gdad_pcf_role_families

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