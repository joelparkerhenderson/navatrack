# User-Aim many-to-many

## Generate the Join Resource

First, create the join table resource:

```sh
mix ash.gen.resource Accounts UserAim \
  --primary-key user_id,aim_id \
  --attributes user_id:uuid:required \
  --attributes aim_id:uuid:required \
```

## Define the Join Resource

Create `lib/your_app/accounts/user_aim.ex`:

```elixir
defmodule App.Accounts.UserAim do
  use Ash.Resource,
    domain: App.Accounts,
    data_layer: AshPostgres.DataLayer

  postgres do
    table "user_aims"
    repo App.Repo
  end

  attributes do
    uuid_primary_key :user_id, writable?: true
    uuid_primary_key :aim_id, writable?: true
  end

  relationships do
    belongs_to :user, App.Accounts.User do
      primary_key? true
      allow_nil? false
    end

    belongs_to :group, App.Works.Aim do
      primary_key? true
      allow_nil? false
    end
  end

  actions do
    defaults [:create, :read, :destroy]
  end

  identities do
    identity :unique_user_aim, [:user_id, :aim_id]
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

    many_to_many :aims, App.Works.Aim do
      through App.Accounts.UserAim
      source_attribute_on_join_resource :user_id
      destination_attribute_on_join_resource :aim_id
    end
  end
end
```

## Update Aim Resource

Add the corresponding relationship to your Aim resource:

```elixir
defmodule App.Works.Aim do
  use Ash.Resource, ...

  relationships do
    # Other relationships...

    many_to_many :users, App.Accounts.User do
      through App.Accounts.UserAim
      source_attribute_on_join_resource :aim_id
      destination_attribute_on_join_resource :user_id
    end
  end
end
```

## Generate Migration

Create the database migration:

```sh
mix ash_postgres.generate_migrations --name create_user_aims_join_table
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
|> Ash.Query.load(:aims)
|> Ash.read_one!()

# Add a user to an group
App.Accounts.UserAim
|> Ash.Changeset.for_create(:create, %{
  user_id: user_id,
  aim_id: aim_id
})
|> Ash.create!()

# Or use manage_relationship on the User
user
|> Ash.Changeset.for_update(:update)
|> Ash.Changeset.manage_relationship(:aims, [aim], type: :append)
|> Ash.update!()
```

This setup creates a proper many-to-many relationship with a join table that can store additional attributes if needed (like role, permissions, joined_at, etc.).
