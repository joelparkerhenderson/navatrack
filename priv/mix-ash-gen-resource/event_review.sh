#!/bin/sh
set -euf

#    - strength: What is the person's key strength?
#    - start: What should the person start doing in order to be effective?
#    - stop: What should the person stop doing in order to be effective?
#    - continue: What should the person continue doing in order to be effective?
#    - change: What should the person change doing in order to be effective?
#    - advice: What other advice can you suggest help them toward their potential?

mix ash.gen.resource \
    Navatrack.Works.EventReview \
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
    --relationship belongs_to:by_user_id:Navatrack.Accounts.Event \
    --relationship belongs_to:to_event_id:Navatrack.Accounts.Event \
    \
    --attribute strength:string \
    --attribute start:string \
    --attribute stop:string \
    --attribute continue:string \
    --attribute change:string \
    --attribute advice:string \

mix ash.codegen create_event_reviews
mix ash.migrate

touch priv/repo/migrations/00000000000000_create_event_reviews.exs

mkdir -p lib/navatrack_web/live/event_reviews
touch lib/navatrack_web/live/event_reviews/form_live.ex
touch lib/navatrack_web/live/event_reviews/index_live.ex
touch lib/navatrack_web/live/event_reviews/show_live.ex

mkdir -p test/navatrack_web/live/event_reviews
touch test/navatrack_web/live/event_reviews/form_test.ex
touch test/navatrack_web/live/event_reviews/index_test.ex
touch test/navatrack_web/live/event_reviews/show_test.ex

cat << EOF
Edit file lib/navatrack_web/router.ex to add live routes:
live "/event_reviews", EventReviews.IndexLive
live "/event_reviews/new", EventReviews.FormLive, :new
live "/event_reviews/:id", EventReviews.ShowLive
live "/event_reviews/:id/edit", EventReviews.FormLive, :edit
EOF
