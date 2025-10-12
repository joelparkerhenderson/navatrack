defmodule Navatrack.Accounts.User do
  use Ash.Resource,
    otp_app: :navatrack,
    domain: Navatrack.Accounts,
    data_layer: AshPostgres.DataLayer,
    authorizers: [Ash.Policy.Authorizer],
    extensions: [AshAuthentication]

  def singular_snake_case(), do: "user"
  def plural_snake_case(), do: "users"
  def singular_title_case(), do: "User"
  def plural_title_case(), do: "Users"

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

  actions do
    read :get_by_subject do
      description "Get a user by the subject claim in a JWT"
      argument :subject, :string, allow_nil?: false
      get? true
      prepare AshAuthentication.Preparations.FilterBySubject
    end

    read :get_by_email do
      description "Looks up a user by their email"
      get? true

      argument :email, :string do
        allow_nil? false
      end

      filter expr(email == ^arg(:email))
    end

    create :sign_in_with_magic_link do
      description "Sign in or register a user with magic link."

      argument :token, :string do
        description "The token from the magic link that was sent to the user"
        allow_nil? false
      end

      upsert? true
      upsert_identity :unique_email
      upsert_fields [:email]

      # Uses the information from the token to create or sign in the user
      change AshAuthentication.Strategy.MagicLink.SignInChange

      metadata :token, :string do
        allow_nil? false
      end
    end

    action :request_magic_link do
      argument :email, :string do
        allow_nil? false
      end

      run AshAuthentication.Strategy.MagicLink.Request
    end

    defaults [:create, :read, :update, :destroy]

    default_accept [
      :created_at,
      :updated_at,
      :deleted_at,
      :locale_code,
      :name,
      :status,
      :tagging,
      :note,
      ### contact
      :web,
      :email,
      :phone,
      :chat,
      :calendar,
      :postal,
      :rdf_type,
      ### social
      :bluesky_as_url,
      :codeberg_as_url,
      :facebook_as_url,
      :github_as_url,
      :instagram_as_url,
      :linkedin_as_url,
      :orcid_as_url,
      :tiktok_as_url,
      :wikipedia_as_url,
      :youtube_as_url,
      ### location
      :location_iso_3166_1_alpha_2,
      :location_iso_3166_2,
      :location_postal_code,
      :location_latitude_as_decimal_degrees,
      :location_longitude_as_decimal_degrees,
      ### workable
      :email_distribution_list,
      :daisyui_timeline_html,
      :org_mode,
      :task_list_as_markdown,
      :ways_of_working_as_markdown,
      :objectives_and_key_results_as_markdown,
      :key_performance_indicators_as_markdown,
      ### images
      :avatar_image_400x400_url,
      :avatar_image_400x400_alt,
      :main_image_1080x1080_url,
      :main_image_1080x1080_alt,
      :main_image_1920x1080_url,
      :main_image_1920x1080_alt,
      :main_image_1080x1920_url,
      :main_image_1080x1920_alt,
      ### ideals
      :purpose_statement,
      :vision_statement,
      :mission_statement,
      :values_statement,
      ## ai
      :ai_agent_instructions_as_url,
      :ai_agent_instructions_as_markdown,
      ### work profile
      :work_profile_resume_as_pdf_url,
      :work_profile_resume_as_markdown,
      :work_profile_curriculum_vitae_as_pdf_url,
      :work_profile_curriculum_vitae_as_markdown,
      ### work role
      :work_role_name,
      :work_role_start_date,
      :work_role_stop_date,
      :work_role_level,
      :work_role_description_as_markdown,
      :work_role_professional_development_plan_as_markdown,
      :work_role_onet_soc_2019_code,
      :work_role_uk_civil_service_grade_abbreviation,
      :work_role_uk_soc_2020_code,
      :work_role_uk_gdad_pcf_url
    ]
  end

  policies do
    bypass AshAuthentication.Checks.AshAuthenticationInteraction do
      authorize_if always()
    end

    # TODO tighten
    policy action(:create) do
      # Allows anyone to create users
      authorize_if always()
    end

    # TODO tighten
    policy action(:read) do
      authorize_if always()
    end

    # TODO tighten
    policy action(:update) do
      authorize_if always()
    end

    # TODO tighten
    policy action(:destroy) do
      authorize_if always()
    end
  end

  attributes do
    uuid_primary_key :id
    attribute :created_at, :utc_datetime_usec
    attribute :updated_at, :utc_datetime_usec
    attribute :deleted_at, :utc_datetime_usec
    attribute :locale_code, :string
    attribute :name, :string
    attribute :status, :string
    attribute :tagging, :string
    attribute :note, :string
    ### contact
    attribute :web, :string
    attribute :email, :string
    attribute :phone, :string
    attribute :chat, :string
    attribute :calendar, :string
    attribute :postal, :string
    attribute :rdf_type, :string
    ### social
    attribute :bluesky_as_url, :string
    attribute :codeberg_as_url, :string
    attribute :facebook_as_url, :string
    attribute :github_as_url, :string
    attribute :instagram_as_url, :string
    attribute :linkedin_as_url, :string
    attribute :orcid_as_url, :string
    attribute :tiktok_as_url, :string
    attribute :wikipedia_as_url, :string
    attribute :youtube_as_url, :string
    ### location
    attribute :location_iso_3166_1_alpha_2, :string
    attribute :location_iso_3166_2, :string
    attribute :location_postal_code, :string
    attribute :location_latitude_as_decimal_degrees, :decimal
    attribute :location_longitude_as_decimal_degrees, :decimal
    ### images
    attribute :avatar_image_400x400_url, :string
    attribute :avatar_image_400x400_alt, :string
    attribute :main_image_1080x1080_url, :string
    attribute :main_image_1080x1080_alt, :string
    attribute :main_image_1920x1080_url, :string
    attribute :main_image_1920x1080_alt, :string
    attribute :main_image_1080x1920_url, :string
    attribute :main_image_1080x1920_alt, :string
    ### ideals
    attribute :purpose_statement, :string
    attribute :vision_statement, :string
    attribute :mission_statement, :string
    attribute :values_statement, :string
    ## ai
    attribute :ai_agent_instructions_as_url, :string
    attribute :ai_agent_instructions_as_markdown, :string
    ### workable
    attribute :email_distribution_list, :string
    attribute :daisyui_timeline_html, :string
    attribute :org_mode, :string
    attribute :task_list_as_markdown, :string
    attribute :ways_of_working_as_markdown, :string
    attribute :objectives_and_key_results_as_markdown, :string
    attribute :key_performance_indicators_as_markdown, :string
    ### work profile
    attribute :work_profile_resume_as_pdf_url, :string
    attribute :work_profile_resume_as_markdown, :string
    attribute :work_profile_curriculum_vitae_as_pdf_url, :string
    attribute :work_profile_curriculum_vitae_as_markdown, :string
    ### work role
    attribute :work_role_name, :string
    attribute :work_role_start_date, :date
    attribute :work_role_stop_date, :date
    attribute :work_role_level, :string
    attribute :work_role_description_as_markdown, :string
    attribute :work_role_professional_development_plan_as_markdown, :string
    attribute :work_role_onet_soc_2019_code, :string
    attribute :work_role_uk_civil_service_grade_abbreviation, :string
    attribute :work_role_uk_soc_2020_code, :string
    attribute :work_role_uk_gdad_pcf_url, :string
  end

  relationships do
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
