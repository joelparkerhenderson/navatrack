defmodule Navatrack.Accounts.User.Actions do
  use Spark.Dsl.Fragment, of: Ash.Resource

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
      ### meta
      :created_at,
      :updated_at,
      :retired_at,
      :locale_code,
      :parent_id,
      :parent_order,
      ### card
      :name,
      :sign,
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
      :mastodon_as_url,
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

end
