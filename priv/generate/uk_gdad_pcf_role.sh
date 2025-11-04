#!/bin/sh
set -euf

export App=Navatrack
export app=navatrack
export Dom=Codes
export Resource=UkGdadPcfRole
export Resources=UkGdadPcfRoles
export resources=uk_gdad_pcf_roles

mix ash.gen.resource \
    $App.$Dom.$Resource \
    --conflicts replace \
    --default-actions read \
    --extend postgres \
    --uuid-primary-key id \
    --attribute locale_code:string:required:public \
    --relationship belongs_to:uk_gdad_pcf_role_family:$App.Codes.UkGdadPcfRoleFamily \
    --attribute name:string:required:public \
    --attribute url:string:required:public \
    --attribute description_as_markdown:string:required:public \
    --attribute senior_civil_service_flag:boolean:required:public \

mix ash.codegen create_uk_gdad_pcf_roles.exs
mix ash.migrate

touch priv/repo/migrations/00000000000000_create_uk_gdad_pcf_roles

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
