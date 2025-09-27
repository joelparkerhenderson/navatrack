#!/bin/sh
set -euf

mix ash.gen.resource \
    Navatrack.Codes.IloIsco2008 \
    --conflicts replace \
    --default-actions read \
    --extend postgres \
    --uuid-primary-key id \
    --attribute locale_code:string:required:public \
    --attribute code:string:required:public \
    --attribute name:string:required:public \
    --attribute definition:string:required:public \

mix ash.codegen create_ilo_isco_2008
mix ash.migrate
