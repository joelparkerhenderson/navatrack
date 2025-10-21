#!/bin/sh
set -euf

mix ash.gen.resource \
    Navatrack.Accounts.AccessOperation \
    --conflicts replace \
    --default-actions create,read,update,destroy \
    --extend postgres \
    --uuid-primary-key id \
    --attribute locale_code:string \
    --attribute name:string:required \
    --attribute sign:string \
    --attribute status:string \
    --attribute tagging:string \
    --attribute note:string \
    --attribute key:string \

mix ash.codegen create_access_operations
mix ash.migrate

touch priv/repo/migrations/00000000000000_create_access_operations.exs

mkdir -p lib/navatrack_web/live/access_operations
touch lib/navatrack_web/live/access_operations/form_live.ex
touch lib/navatrack_web/live/access_operations/index_live.ex
touch lib/navatrack_web/live/access_operations/show_live.ex

mkdir -p test/navatrack_web/live/access_operations
touch test/navatrack_web/live/access_operations/form_live.ex
touch test/navatrack_web/live/access_operations/index_live.ex
touch test/navatrack_web/live/access_operations/show_live.ex

cat << EOF
Edit file lib/navatrack_web/router.ex to add live routes:
live "/access_operations", AccessOperations.IndexLive
live "/access_operations/new", AccessOperations.FormLive, :new
live "/access_operations/:id", AccessOperations.ShowLive
live "/access_operations/:id/edit", AccessOperations.FormLive, :edit
EOF
### Extra ###
#
# Edit file lib/navatrack/access/access_operation.ex
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
