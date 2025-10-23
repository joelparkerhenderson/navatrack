#!/bin/sh
set -euf

mix ash.gen.resource \
    Navatrack.Works.Place \
    --conflicts replace \
    --default-actions create,read,update,destroy \
    --extend postgres \
    --uuid-primary-key id \
    --attribute name:string \
    --attribute sign:string \
    --attribute status:string \
    --attribute tagging:string \
    --attribute note:string \
    \
    --attribute parent_id:uuid \
    --attribute parent_order:integer \
    \
    --attribute web:string \
    --attribute email:string \
    --attribute phone:string \
    --attribute chat:string \
    --attribute calendar:string \
    --attribute postal:string \
    --attribute rdf_type:string \
    \
    --attribute bluesky_as_url:string \
    --attribute codeberg_as_url:string \
    --attribute facebook_as_url:string \
    --attribute github_as_url:string \
    --attribute instagram_as_url:string \
    --attribute linkedin_as_url:string \
    --attribute orcid_as_url:string \
    --attribute tiktok_as_url:string \
    --attribute wikipedia_as_url:string \
    --attribute youtube_as_url:string \
    \
    --attribute location_iso_3166_1_alpha_2:string \
    --attribute location_iso_3166_2:string \
    --attribute location_postal_code:string \
    --attribute location_latitude_as_decimal_degrees:decimal \
    --attribute location_longitude_as_decimal_degrees:decimal \
    --attribute location_altitude_agl_as_meters:decimal \
    --attribute location_altitude_msl_as_meters:decimal \
    --attribute location_elevation_agl_as_meters:decimal \
    --attribute location_elevation_msl_as_meters:decimal \
    --attribute location_what3words:string \
    --attribute location_whatfreewords:string \
    \
    --attribute avatar_image_400x400_url:string \
    --attribute avatar_image_400x400_alt:string \
    --attribute main_image_1080x1080_url:string \
    --attribute main_image_1080x1080_alt:string \
    --attribute main_image_1920x1080_url:string \
    --attribute main_image_1920x1080_alt:string \
    --attribute main_image_1080x1920_url:string \
    --attribute main_image_1080x1920_alt:string \

mix ash.codegen create_places
mix ash.migrate

touch priv/repo/migrations/00000000000000_create_places.exs
touch lib/navatrack/works/place.ex

mkdir -p lib/navatrack_web/live/places
touch lib/navatrack_web/live/places/form_live.ex
touch lib/navatrack_web/live/places/index_live.ex
touch lib/navatrack_web/live/places/show_live.ex

mkdir -p test/navatrack_web/live/places
touch test/navatrack_web/live/places/form_test.ex
touch test/navatrack_web/live/places/index_test.ex
touch test/navatrack_web/live/places/show_test.ex

cat << EOF
Edit file lib/navatrack_web/router.ex to add live routes:
live "/places", Places.IndexLive
live "/places/new", Places.FormLive, :new
live "/places/:id", Places.ShowLive
live "/places/:id/edit", Places.FormLive, :edit
EOF
### Extra ###
#
# Edit file lib/navatrack/basics/place.ex
#
# Find this section:
#
#   postgres do
#     table …
#     repo …
#
# Add this:
#
#     index[:{attribute.id}]
#
# Change the attributes created_at and updated_at to:
#
#   create_timestamp :created_at
#   update_timestamp :updated_at
