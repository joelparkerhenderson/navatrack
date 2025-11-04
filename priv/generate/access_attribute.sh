#!/bin/sh
set -euf

export App=Navatrack
export app=navatrack
export Dom=Works
export Resource=AccessAttribute
export Resources=AccessAttributes
export resources=access_attributes

mix ash.gen.resource \
    MyApp.Access.AccessAttribute \
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

mix ash.codegen create_access_attributes
mix ash.migrate

touch priv/repo/migrations/00000000000000_create_$resources.exs

mkdir -p lib/my_{app}_web/live/$resources
touch lib/my_{app}_web/live/$resources/form_live.ex
touch lib/my_{app}_web/live/$resources/index_live.ex
touch lib/my_{app}_web/live/$resources/show_live.ex

mkdir -p test/my_{app}_web/live/$resources
touch test/my_{app}_web/live/$resources/form_live.ex
touch test/my_{app}_web/live/$resources/index_live.ex
touch test/my_{app}_web/live/$resources/show_live.ex

cat << EOF
Edit file lib/my_{app}_web/router.ex to add live routes:
live "$resources", $Resources.IndexLive
live "$resources/new", $Resources.FormLive, :new
live "$resources/:id", $Resources.ShowLive
live "$resources/:id/edit", .FormLive, :edit
EOF
### Extra ###
#
# Edit file lib/my_app/access/access_attribute.ex
#
# Find this section:
#
#   postgres do
#     table …
#     repo …
#
# Add this:
#
#     index[:{attribute.id}]#     index[:{attribute.id}]#     index[:{attribute.id}]#     index[:{attribute.id}]#     index[:{attribute.id}]#     index[:{attribute.id}]#     index[:{attribute.id}]#     index[:{attribute.id}]#     index[:{attribute.id}]#     index[:{attribute.id}]#     index[:{attribute.id}]#     index[:{attribute.id}]#     index[:{attribute.id}]#
#
# Change the attributes created_at and updated_at to:
#
#   create_timestamp :created_at
#   update_timestamp :updated_at
