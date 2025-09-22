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

  attributes do
    uuid_primary_key :id
    attribute :created_at, :utc_datetime_usec
    attribute :updated_at, :utc_datetime_usec
    attribute :deleted_at, :utc_datetime_usec
    attribute :sign, :string
    attribute :title, :string
    attribute :status, :string
    attribute :tags, {:array, :string}
    attribute :url, :string
    attribute :email, :string
    attribute :phone, :string
    attribute :messaging, :string
    attribute :postal, :string
    attribute :orcid_pid, :string
    attribute :rdf_type, :string
    attribute :linkedin_url, :string
    attribute :github_url, :string
    attribute :codeberg_url, :string
    attribute :location_iso_3166_1_alpha_2, :string
    attribute :location_iso_3166_2, :string
    attribute :location_postal_code, :string
    attribute :location_latitude_as_decimal_degrees, :decimal
    attribute :location_longitude_as_decimal_degrees, :decimal
    attribute :note, :string
    attribute :daisyui_timeline_html, :string
    attribute :org_mode, :string
    attribute :task_list_as_markdown, :string
    attribute :ways_of_working_as_markdown, :string
    attribute :objectives_and_key_results_as_markdown, :string
    attribute :key_performance_indicators_as_markdown, :string
    attribute :agents_as_markdown, :string
    attribute :avatar_image_400x400_url, :string
    attribute :avatar_image_400x400_alt, :string
    attribute :main_image_1080x1080_url, :string
    attribute :main_image_1080x1080_alt, :string
    attribute :main_image_1920x1080_url, :string
    attribute :main_image_1920x1080_alt, :string
    attribute :main_image_1080x1920_url, :string
    attribute :main_image_1080x1920_alt, :string
    attribute :work_profile_resume_as_pdf_url, :string
    attribute :work_profile_resume_as_markdown, :string
    attribute :work_profile_curriculum_vitae_as_pdf_url, :string
    attribute :work_profile_curriculum_vitae_as_markdown, :string
    attribute :work_role_title, :string
    attribute :work_role_start_date, :date
    attribute :work_role_stop_date, :date
    attribute :work_role_level, :string
    attribute :work_role_description_as_markdown, :string
    attribute :work_role_professional_development_plan_markdown, :string
    attribute :work_role_onet_soc_2019_code, :string
    attribute :work_role_united_kingdom_civil_service_grade_abbreviation, :string
    attribute :work_role_united_kingdom_standard_occupational_classification_2020_code, :string
    attribute :work_role_united_kingdom_government_digital_and_data_profession_capability_framework_url, :string
  end

  identities do
    identity :unique_email, [:email]
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
      :sign,
      :title,
      :status,
      :tags,
      :url,
      :email,
      :phone,
      :messaging,
      :postal,
      :orcid_pid,
      :rdf_type,
      :linkedin_url,
      :github_url,
      :codeberg_url,
      :location_iso_3166_1_alpha_2,
      :location_iso_3166_2,
      :location_postal_code,
      :location_latitude_as_decimal_degrees,
      :location_longitude_as_decimal_degrees,
      :note,
      :daisyui_timeline_html,
      :org_mode,
      :task_list_as_markdown,
      :ways_of_working_as_markdown,
      :objectives_and_key_results_as_markdown,
      :key_performance_indicators_as_markdown,
      :agents_as_markdown,
      :avatar_image_400x400_url,
      :avatar_image_400x400_alt,
      :main_image_1080x1080_url,
      :main_image_1080x1080_alt,
      :main_image_1920x1080_url,
      :main_image_1920x1080_alt,
      :main_image_1080x1920_url,
      :main_image_1080x1920_alt,
      :work_profile_resume_as_pdf_url,
      :work_profile_resume_as_markdown,
      :work_profile_curriculum_vitae_as_pdf_url,
      :work_profile_curriculum_vitae_as_markdown,
      :work_role_title,
      :work_role_start_date,
      :work_role_stop_date,
      :work_role_level,
      :work_role_description_as_markdown,
      :work_role_professional_development_plan_markdown,
      :work_role_onet_soc_2019_code,
      :work_role_united_kingdom_civil_service_grade_abbreviation,
      :work_role_united_kingdom_standard_occupational_classification_2020_code,
      :work_role_united_kingdom_government_digital_and_data_profession_capability_framework_url
    ]
  end

  policies do
    bypass AshAuthentication.Checks.AshAuthenticationInteraction do
      authorize_if always()
    end

    # Allow anyone to read users (if that's what you want)
    policy action(:read) do
      authorize_if always()
    end
  end

end
