# User-Organization many-to-many

## Generate the Join Resource

First, create the join table resource:

```sh
mix ash.gen.resource Accounts UserOrganization \
  --primary-key user_id,organization_id \
  --attributes user_id:uuid:required \
  --attributes organization_id:uuid:required \
```

## Define the Join Resource

Create `lib/your_app/accounts/user_organization.ex`:

```elixir
defmodule MyApp.Accounts.UserOrganization do
  use Ash.Resource,
    domain: MyApp.Accounts,
    data_layer: AshPostgres.DataLayer

  postgres do
    table "user_organizations"
    repo MyApp.Repo
  end

  attributes do
    uuid_primary_key :user_id, writable?: true
    uuid_primary_key :organization_id, writable?: true
  end

  relationships do
    belongs_to :user, MyApp.Accounts.User do
      primary_key? true
      allow_nil? false
    end

    belongs_to :organization, MyApp.Accounts.Organization do
      primary_key? true
      allow_nil? false
    end
  end

  actions do
    defaults [:create, :read, :destroy]
  end

  identities do
    identity :unique_user_organization, [:user_id, :organization_id]
  end
end
```

## Update User Resource

Add the many-to-many relationship to your User resource:

```elixir
defmodule MyApp.Accounts.User do
  use Ash.Resource, ...

  relationships do
    # Other relationships...
    
    many_to_many :organizations, MyApp.Accounts.Organization do
      through MyApp.Accounts.UserOrganization
      source_attribute_on_join_resource :user_id
      destination_attribute_on_join_resource :organization_id
    end
  end
end
```

## Update Organization Resource

Add the corresponding relationship to your Organization resource:

```elixir
defmodule MyApp.Accounts.Organization do
  use Ash.Resource, ...

  relationships do
    # Other relationships...
    
    many_to_many :users, MyApp.Accounts.User do
      through MyApp.Accounts.UserOrganization
      source_attribute_on_join_resource :organization_id
      destination_attribute_on_join_resource :user_id
    end
  end
end
```

## Generate Migration

Create the database migration:

```sh
mix ash_postgres.generate_migrations --name create_user_organizations_join_table
```

Then run the migration:

```sh
mix ash.migrate
```

## Usage Examples

Now you can work with the many-to-many relationship:

```elixir
# Load a user with their organizations
user = MyApp.Accounts.User
|> Ash.Query.load(:organizations)
|> Ash.read_one!()

# Add a user to an organization
MyApp.Accounts.UserOrganization
|> Ash.Changeset.for_create(:create, %{
  user_id: user_id,
  organization_id: organization_id
})
|> Ash.create!()

# Or use manage_relationship on the User
user
|> Ash.Changeset.for_update(:update)
|> Ash.Changeset.manage_relationship(:organizations, [organization], type: :append)
|> Ash.update!()
```

This setup creates a proper many-to-many relationship with a join table that can store additional attributes if needed (like role, permissions, joined_at, etc.).
