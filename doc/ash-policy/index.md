# Ash policy

Ash policies for a typical resource for the typical general public:

```elixir
  policies do
    # Allow anyone to create a new user account (public registration)
    policy action(:create) do
      description "Anyone can register a new account"
      authorize_if always()
    end

    # Protect read actions - users can read their own data
    policy action(:read) do
      authorize_if actor_present()
    end

    # Protect update/destroy - only the user themselves
    policy action([:update, :destroy]) do
      authorize_if actor_present()
      authorize_if relates_to_actor_via(:id)
    end
  end
```
