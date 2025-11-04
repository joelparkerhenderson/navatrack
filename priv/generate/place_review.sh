#!/bin/sh
set -euf

export App=Navatrack
export app=navatrack
export Dom=Works
export Resource=PlaceReview
export Resources=PlaceReviews
export resources=place_reviews

mix ash.gen.resource \
    $App.Works. \
    --conflicts replace \
    --default-actions create,read,update,destroy \
    --extend postgres \
    --uuid-primary-key id \
    --attribute name:string:required \
    --attribute sign:string \
    --attribute status:string \
    --attribute tagging:string \
    --attribute note:string \
    \
    --relationship belongs_to:by_user_id:$App.$Dom.Place \
    --relationship belongs_to:to_place_id:$App.$Dom.Place \
    \
    --attribute strength:string \
    --attribute start:string \
    --attribute stop:string \
    --attribute continue:string \
    --attribute change:string \
    --attribute advice:string \

mix ash.codegen create_place_reviews
mix ash.migrate

touch priv/repo/migrations/00000000000000_create_$resources.exs

mkdir -p lib/${app}_web/live/$resources
touch lib/${app}_web/live/$resources/form_live.ex
touch lib/${app}_web/live/$resources/index_live.ex
touch lib/${app}_web/live/$resources/show_live.ex

mkdir -p test/${app}_web/live/$resources
touch test/${app}_web/live/$resources/form_test.ex
touch test/${app}_web/live/$resources/index_test.ex
touch test/${app}_web/live/$resources/show_test.ex

cat << EOF
Edit file lib/${app}_web/router.ex to add live routes:
live "$resources", $Resources.IndexLive
live "$resources/new", $Resources.FormLive, :new
live "$resources/:id", $Resources.ShowLive
live "$resources/:id/edit", $Resources.FormLive, :edit
EOF
