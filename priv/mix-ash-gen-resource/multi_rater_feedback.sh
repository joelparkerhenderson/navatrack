#!/bin/sh
set -euf

#    - strength: What is the person's key strength?
#    - start: What should the person start doing in order to be effective?
#    - stop: What should the person stop doing in order to be effective?
#    - continue: What should the person continue doing in order to be effective?
#    - change: What should the person change doing in order to be effective?
#    - advice: What other advice can you suggest help them toward their potential?

mix ash.gen.resource \
    Navatrack.Works.MultiRaterFeedbackMessage \
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
    --relationship belongs_to:writer_as_user_id:Navatrack.Accounts.User \
    --relationship belongs_to:reader_as_user_id:Navatrack.Accounts.User \
    \
    --attribute strength:string \
    --attribute start:string \
    --attribute stop:string \
    --attribute continue:string \
    --attribute change:string \
    --attribute advice:string \

mix ash.codegen create_multi_rater_feedback_messages
mix ash.migrate

touch priv/repo/migrations/00000000000000_create_multi_rater_feedback_messages.exs

mkdir -p lib/navatrack_web/live/multi_rater_feedback_messages
touch lib/navatrack_web/live/multi_rater_feedback_messages/form_live.ex
touch lib/navatrack_web/live/multi_rater_feedback_messages/index_live.ex
touch lib/navatrack_web/live/multi_rater_feedback_messages/show_live.ex

mkdir -p test/navatrack_web/live/multi_rater_feedback_messages
touch test/navatrack_web/live/multi_rater_feedback_messages/form_test.ex
touch test/navatrack_web/live/multi_rater_feedback_messages/index_test.ex
touch test/navatrack_web/live/multi_rater_feedback_messages/show_test.ex

cat << EOF
Edit file lib/navatrack_web/router.ex to add live routes:
live "/multi_rater_feedback_messages", MultiRaterFeedbackMessages.IndexLive
live "/multi_rater_feedback_messages/new", MultiRaterFeedbackMessages.FormLive, :new
live "/multi_rater_feedback_messages/:id", MultiRaterFeedbackMessages.ShowLive
live "/multi_rater_feedback_messages/:id/edit", MultiRaterFeedbackMessages.FormLive, :edit
EOF
