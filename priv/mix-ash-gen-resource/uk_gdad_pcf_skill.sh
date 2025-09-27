#!/bin/sh
set -euf

mix ash.gen.resource \
    Navatrack.Codes.UkGdadPcfSkill \
    --conflicts replace \
    --default-actions read \
    --extend postgres \
    --uuid-primary-key id \
    --attribute locale_code:string:required:public \
    --attribute name:string:required:public \
    --attribute url:string:required:public \
    --attribute description:string:required:public \
    --attribute level_1_description_as_markdown:markdown:required:public \
    --attribute level_1_description_as_html:string:required:public \
    --attribute level_2_description_as_markdown:markdown:required:public \
    --attribute level_2_description_as_html:string:required:public \
    --attribute level_3_description_as_markdown:string:required:public \
    --attribute level_3_description_as_html:string:required:public \
    --attribute level_4_description_as_markdown:string:required:public \
    --attribute level_4_description_as_html:string:required:public \
    --attribute roles_that_require_this_skill_as_markdown:string:required:public \
    --attribute roles_that_require_this_skill_as_html:string:required:public \

mix ash.codegen create_uk_gdad_pcf_skill
mix ash.migrate
