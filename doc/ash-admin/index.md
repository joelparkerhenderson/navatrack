# AshAdmin

<https://hexdocs.pm/ash_admin/getting-started-with-ash-admin.html>

Edit each domain file that you want to work with admin, and add this:

```elixir
use Ash.Domain,
  extensions: [AshAdmin.Domain]
```

And this:

```elixir
# AshAdmin    
admin do
  show? true
end
```

In your resource that acts as an actor (e.g. User) add this:

```elixir
use Ash.Resource,
  domain: YourDomain,
  extensions: [AshAdmin.Resource]

admin do
  actor? true
end
```
