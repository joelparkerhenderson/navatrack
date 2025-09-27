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

mix ash.codegen create_ilo_isco_2008
mix ash.migrate
