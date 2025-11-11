#!/bin/sh
set -euf

export App=Navatrack
export app=navatrack
export Dom=Codes
export Resource=UkGdadPcfRoleLevel
export resource=uk_gdad_pcf_role_level
export Resources=UkGdadPcfRoleLevels
export resources=uk_gdad_pcf_role_levels

mix ash.gen.resource \
    $App.$Dom.$Resource \
    --conflicts replace \
    --default-actions read \
    --extend postgres \
    --uuid-primary-key id \
    --relationship belongs_to:uk_gdad_pcf_role:$App.$Dom.UkGdadPcfRoleLevel \
    --attribute name:string:required:public \
    --attribute description_as_markdown:string:required:public \

mix ash.codegen create_uk_gdad_pcf_role_levels.exs
mix ash.migrate

touch priv/repo/migrations/00000000000000_create_uk_gdad_pcf_role_levels

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
