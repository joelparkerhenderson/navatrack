# User-Topic many-to-many

## Generate the Join Resource

First, create the join table resource:

```sh
mix ash.gen.resource Accounts UserTopic \
  --primary-key user_id,topic_id \
  --attributes user_id:uuid:required \
  --attributes topic_id:uuid:required \
```

## Define the Join Resource

Create `lib/your_app/accounts/user_topic.ex`:

```elixir
defmodule App.Accounts.UserTopic do
  use Ash.Resource,
    domain: App.Accounts,
    data_layer: AshPostgres.DataLayer

  postgres do
    table "user_topics"
    repo App.Repo
  end

  attributes do
    uuid_primary_key :user_id, writable?: true
    uuid_primary_key :topic_id, writable?: true
  end

  relationships do
    belongs_to :user, App.Accounts.User do
      primary_key? true
      allow_nil? false
    end

    belongs_to :group, App.Works.Topic do
      primary_key? true
      allow_nil? false
    end
  end

  actions do
    defaults [:create, :read, :destroy]
  end

  identities do
    identity :unique_user_topic, [:user_id, :topic_id]
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

    many_to_many :topics, App.Works.Topic do
      through App.Accounts.UserTopic
      source_attribute_on_join_resource :user_id
      destination_attribute_on_join_resource :topic_id
    end
  end
end
```

## Update Topic Resource

Add the corresponding relationship to your Topic resource:

```elixir
defmodule App.Works.Topic do
  use Ash.Resource, ...

  relationships do
    # Other relationships...

    many_to_many :users, App.Accounts.User do
      through App.Accounts.UserTopic
      source_attribute_on_join_resource :topic_id
      destination_attribute_on_join_resource :user_id
    end
  end
end
```

## Generate Migration

Create the database migration:

```sh
mix ash_postgres.generate_migrations --name create_user_topics_join_table
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
|> Ash.Query.load(:topics)
|> Ash.read_one!()

# Add a user to an group
App.Accounts.UserTopic
|> Ash.Changeset.for_create(:create, %{
  user_id: user_id,
  topic_id: topic_id
})
|> Ash.create!()

# Or use manage_relationship on the User
user
|> Ash.Changeset.for_update(:update)
|> Ash.Changeset.manage_relationship(:topics, [topic], type: :append)
|> Ash.update!()
```

This setup creates a proper many-to-many relationship with a join table that can store additional attributes if needed (like role, permissions, joined_at, etc.).
