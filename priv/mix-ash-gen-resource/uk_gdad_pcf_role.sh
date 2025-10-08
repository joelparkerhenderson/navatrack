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

mix ash.codegen create_uk_gdad_pcf_role
mix ash.migrate
