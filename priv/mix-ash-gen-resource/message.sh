#!/bin/sh
set -euf

mix ash.gen.resource \
    Navatrack.Works.Message \
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

mix ash.codegen create_messages
mix ash.migrate

touch priv/repo/migrations/00000000000000_create_messages.exs

mkdir -p lib/navatrack_web/live/messages
touch lib/navatrack_web/live/messages/form_live.ex
touch lib/navatrack_web/live/messages/index_live.ex
touch lib/navatrack_web/live/messages/show_live.ex

mkdir -p test/navatrack_web/live/messages
touch test/navatrack_web/live/messages/form_test.ex
touch test/navatrack_web/live/messages/index_test.ex
touch test/navatrack_web/live/messages/show_test.ex

cat << EOF
Edit file lib/navatrack_web/router.ex to add live routes:
live "/messages", Messages.IndexLive
live "/messages/new", Messages.FormLive, :new
live "/messages/:id", Messages.ShowLive
live "/messages/:id/edit", Messages.FormLive, :edit
EOF
