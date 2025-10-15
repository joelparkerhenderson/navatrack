# User-Event many-to-many

## Generate the Join Resource

First, create the join table resource:

```sh
mix ash.gen.resource Accounts UserEvent \
  --primary-key user_id,event_id \
  --attributes user_id:uuid:required \
  --attributes event_id:uuid:required \
```

## Define the Join Resource

Create `lib/your_app/accounts/user_event.ex`:

```elixir
defmodule App.Accounts.UserEvent do
  use Ash.Resource,
    domain: App.Accounts,
    data_layer: AshPostgres.DataLayer

  postgres do
    table "user_events"
    repo App.Repo
  end

  attributes do
    uuid_primary_key :user_id, writable?: true
    uuid_primary_key :event_id, writable?: true
  end

  relationships do
    belongs_to :user, App.Accounts.User do
      primary_key? true
      allow_nil? false
    end

    belongs_to :group, App.Works.Event do
      primary_key? true
      allow_nil? false
    end
  end

  actions do
    defaults [:create, :read, :destroy]
  end

  identities do
    identity :unique_user_event, [:user_id, :event_id]
  end
end
```

## Update User Resource

Add the many-to-many relationship to your User resource:

```elixir
defmodule App.Accounts.User do
  use Ash.Resource, ...

  relationships do
    # Other relationships...

    many_to_many :events, App.Works.Event do
      through App.Accounts.UserEvent
      source_attribute_on_join_resource :user_id
      destination_attribute_on_join_resource :event_id
    end
  end
end
```

## Update Event Resource

Add the corresponding relationship to your Event resource:

```elixir
defmodule App.Works.Event do
  use Ash.Resource, ...

  relationships do
    # Other relationships...

    many_to_many :users, App.Accounts.User do
      through App.Accounts.UserEvent
      source_attribute_on_join_resource :event_id
      destination_attribute_on_join_resource :user_id
    end
  end
end
```

## Generate Migration

Create the database migration:

```sh
mix ash_postgres.generate_migrations --name create_user_events_join_table
```

Then run the migration:

```sh
mix ash.migrate
```

## Usage Examples

Now you can work with the many-to-many relationship:

```elixir
# Load a user with their groups
user = App.Accounts.User
|> Ash.Query.load(:events)
|> Ash.read_one!()

# Add a user to an group
App.Accounts.UserEvent
|> Ash.Changeset.for_create(:create, %{
  user_id: user_id,
  event_id: event_id
})
|> Ash.create!()

# Or use manage_relationship on the User
user
|> Ash.Changeset.for_update(:update)
|> Ash.Changeset.manage_relationship(:events, [event], type: :append)
|> Ash.update!()
```

This setup creates a proper many-to-many relationship with a join table that can store additional attributes if needed (like role, permissions, joined_at, etc.).
