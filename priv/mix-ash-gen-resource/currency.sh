#!/bin/sh
set -euf

mix ash.gen.resource \
    MyApp.Codes.Currency \
    --conflicts replace \
    --default-actions create,read,update,destroy \
    --extend postgres \
    --uuid-primary-key id \
    --attribute lock_version:integer \
    --attribute created_at:timestamp_utc_usec \
    --attribute created_by:text \
    --attribute updated_at:timestamp_utc_usec \
    --attribute updated_by:text \
    --attribute retired_at:timestamp_utc_usec \
    --attribute retired_by:text \
    --attribute locale_code:string \
    --attribute tagging:string \
    --attribute name:text \
    --attribute code:text \
    --attribute symbol:text \

mix ash.codegen create_currencies
mix ash.migrate

touch priv/repo/migrations/00000000000000_create_currencies.exs
touch test/my_app/my_domain/currency.exs

mkdir -p lib/my_app_web/live/currencies
touch lib/my_app_web/live/currencies/form_live.ex
touch lib/my_app_web/live/currencies/index_live.ex
touch lib/my_app_web/live/currencies/show_live.ex

mkdir -p test/my_app_web/live/currencies
touch test/my_app_web/live/currencies/form_test.exs
touch test/my_app_web/live/currencies/index_test.exs
touch test/my_app_web/live/currencies/show_test.exs

cat << EOF
Edit file lib/my_app_web/router.ex to add live routes:

live "/currencies", CurrencyTypes.IndexLive
live "/currencies/new", CurrencyTypes.FormLive, :new
live "/currencies/:id", CurrencyTypes.ShowLive
live "/currencies/:id/edit", CurrencyTypes.FormLive, :edit

If there is a parent, then edit file lib/my_app/currency.ex to add:

relationships do
  belongs_to :parent, __MODULE__, allow_nil?: true
end
EOF
### Extra ###
#
# Edit file lib/my_app/my_domain/currency.ex
#
# Find this section:
#
#   postgres do
#     table …
#     repo …
#
# Add this:
#
#     index[:created_at] \
#     index[:created_by] \
#     index[:updated_at] \
#     index[:updated_by] \
#     index[:retired_at] \
#     index[:retired_by] \
#     index[:locale_code] \
#     index[:tagging] \
#     index[:name] \
#     index[:code] \
#     index[:symbol] \
#
#
# Change the attributes created_at and updated_at to:
#
#   create_timestamp :created_at
#   update_timestamp :updated_at
