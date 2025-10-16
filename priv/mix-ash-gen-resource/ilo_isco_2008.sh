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

mix ash.codegen create_ilo_isco_2008s
mix ash.migrate

touch priv/repo/migrations/00000000000000_create_ilo_isco_2008s

mkdir -p lib/navatrack_web/live/ilo_isco_2008s
touch lib/navatrack_web/live/ilo_isco_2008s/index_live.ex
touch lib/navatrack_web/live/ilo_isco_2008s/show_live.ex

mkdir -p test/navatrack_web/live/ilo_isco_2008s
touch test/navatrack_web/live/ilo_isco_2008s/index_live.ex
touch test/navatrack_web/live/ilo_isco_2008s/show_live.ex

cat << EOF
Edit file lib/navatrack_web/router.ex to add live routes:
live "/ilo_isco_2008s", IloIsco2008s.IndexLive
live "/ilo_isco_2008s/:id", IloIsco2008s.ShowLive
EOF
