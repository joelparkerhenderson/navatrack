#!/bin/sh
set -euf

export App=Navatrack
export app=navatrack
export Dom=Works
export Resource=Message
export Resources=Messages
export resources=messages

mix ash.gen.resource \
    $App.$Dom.$Resource \
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
    --relationship belongs_to:from_user_id:$App.$Dom.User \
    --relationship belongs_to:to_user_id:$App.$Dom.User \

mix ash.codegen create_messages
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
