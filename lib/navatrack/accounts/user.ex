defmodule Navatrack.Accounts.User do
  use Ash.Resource,
    otp_app: :navatrack,
    domain: Navatrack.Accounts,
    data_layer: AshPostgres.DataLayer,
    authorizers: [Ash.Policy.Authorizer],
    fragments: [
      Navatrack.Accounts.User.Actions,
      Navatrack.Accounts.User.Attributes,
    ],
    extensions: [
      AshAuthentication,
      AshAdmin.Resource
    ]
  use Navatrack.Accounts.User.Fab

  admin do
    actor? true
  end

  def snake_case_singular(), do: "user"
  def snake_case_plural(), do: "users"
  def title_case_singular(), do: "User"
  def title_case_plural(), do: "Users"

  authentication do
    add_ons do
      log_out_everywhere do
        apply_on_password_change? true
      end
    end

    tokens do
      enabled? true
      token_resource Navatrack.Accounts.Token
      signing_secret Navatrack.Secrets
      store_all_tokens? true
      require_token_presence_for_authentication? true
    end

    strategies do
      magic_link do
        identity_field :email
        registration_enabled? true
        require_interaction? true

        sender Navatrack.Accounts.User.Senders.SendMagicLinkEmail
      end
    end
  end

  postgres do
    table "users"
    repo Navatrack.Repo
  end

  policies do

    bypass AshAuthentication.Checks.AshAuthenticationInteraction do
      authorize_if always()
    end

    # Allow anyone to create a new user account (public registration)
    policy action(:create) do
      description "Anyone can register a new account"
      authorize_if always()
    end

    # Protect read actions - users can read their own data
    policy action(:read) do
      authorize_if actor_present()
    end

    # Protect update/destroy actions - only the user can update/destroy their own data
    policy action([:update, :destroy]) do
      authorize_if actor_present()
      authorize_if relates_to_actor_via(:id)
    end

  end

  relationships do

    belongs_to :parent, __MODULE__, allow_nil?: true

    many_to_many :topics, Navatrack.Works.Topic do
      through Navatrack.Accounts.UserTopicLink
      source_attribute_on_join_resource :user_id
      destination_attribute_on_join_resource :topic_id
    end

    many_to_many :traits, Navatrack.Works.Trait do
      through Navatrack.Accounts.UserTraitLink
      source_attribute_on_join_resource :user_id
      destination_attribute_on_join_resource :trait_id
    end

    many_to_many :ilo_isco_2008s, Navatrack.Codes.IloIsco2008 do
      through Navatrack.Accounts.UserIloIsco2008Link
      source_attribute_on_join_resource :user_id
      destination_attribute_on_join_resource :ilo_isco_2008_id
    end

    many_to_many :lumina_foundation_skill_levels, Navatrack.Codes.LuminaFoundationSkillLevel do
      through Navatrack.Accounts.UserLuminaFoundationSkillLevelLink
      source_attribute_on_join_resource :user_id
      destination_attribute_on_join_resource :lumina_foundation_skill_level_id
    end

    many_to_many :uk_gdad_pcf_roles, Navatrack.Codes.UkGdadPcfRole do
      through Navatrack.Accounts.UserUkGdadPcfRoleLink
      source_attribute_on_join_resource :user_id
      destination_attribute_on_join_resource :uk_gdad_pcf_role_id
    end

    many_to_many :uk_gdad_pcf_skills, Navatrack.Codes.UkGdadPcfSkill do
      through Navatrack.Accounts.UserUkGdadPcfSkillLink
      source_attribute_on_join_resource :user_id
      destination_attribute_on_join_resource :uk_gdad_pcf_skill_id
    end
  end

  identities do
    identity :unique_email, [:email]
  end

end
