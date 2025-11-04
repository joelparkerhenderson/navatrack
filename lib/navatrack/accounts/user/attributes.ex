defmodule Navatrack.Accounts.User.Attributes do
  use Spark.Dsl.Fragment, of: Ash.Resource

  attributes do

    ### meta

    uuid_primary_key :id

    attribute :created_at, :utc_datetime_usec do
      description "Created at UTC datetime in microseconds"
    end

    attribute :updated_at, :utc_datetime_usec do
      description "Updated at UTC datetime in microseconds"
    end

    attribute :retired_at, :utc_datetime_usec do
      description "Updated at UTC datetime in microseconds"
    end

    attribute :locale_code, :string do
      description "Locale code"
    end

    attribute :parent_id, :uuid do
      description "Parent id"
    end

    attribute :parent_order, :integer do
      description "Parent order"
    end

    ### card

    attribute :name, :string do
      description "Name"
    end

    attribute :sign, :string do
      description "Sign emoji character"
    end

    attribute :status, :string do
      description "Status text"
    end

    attribute :tagging, :string do
      description "Tagging text with hashtags such as #alfa #bravo #charlie"
    end

    attribute :note, :string do
      description "Note text"
    end

    ### contact

    attribute :web, :string do
      description "Web URL"
    end

    attribute :email, :string do
      description "Email address"
    end

    attribute :phone, :string do
      description "Phone number"
    end

    attribute :chat, :string do
      description "Chat URL suitable for instant messaging"
    end

    attribute :calendar, :string do
      description "Calendar URL suitable for scheduling"
    end

    attribute :postal, :string do
      description "Postal address suitable for mail"
    end

    attribute :rdf_type, :string do
      description "RDF type suitable for categorization"
    end

    ### social

    attribute :bluesky_as_url, :string do
      description "Bluesky URL"
    end

    attribute :codeberg_as_url, :string do
      description "Codeberg URL"
    end

    attribute :facebook_as_url, :string do
      description "Bluesky URL"
    end

    attribute :github_as_url, :string do
      description "GitHub URL"
    end

    attribute :instagram_as_url, :string do
      description "Instagram URL"
    end

    attribute :linkedin_as_url, :string do
      description "Instagram URL"
    end

    attribute :mastodon_as_url, :string do
      description "Mastodon URL"
    end

    attribute :orcid_as_url, :string do
      description "ORCID URL"
    end

    attribute :tiktok_as_url, :string do
      description "Tiktok URL"
    end

    attribute :wikipedia_as_url, :string do
      description "Wikipedia URL"
    end

    attribute :youtube_as_url, :string do
      description "Youtube URL"
    end

    ### location

    attribute :location_iso_3166_1_alpha_2, :string do
      description "Location ISO 3166-1 alpha-2 code"
    end

    attribute :location_iso_3166_2, :string do
      description "Location ISO 3166-2 code"
    end

    attribute :location_postal_code, :string do
      description "Location postal code"
    end

    attribute :location_latitude_as_decimal_degrees, :decimal do
      description "Location latitude as decimal degrees"
    end

    attribute :location_longitude_as_decimal_degrees, :decimal do
      description "Location longitude as decimal degrees"
    end

    ### images

    attribute :avatar_image_400x400_url, :string do
      description "Avatar image 400x400 URL"
    end

    attribute :avatar_image_400x400_alt, :string do
      description "Avatar image 400x400 alt text"
    end

    attribute :main_image_1080x1080_url, :string do
      description "Main image 1080x1080 URL"
    end

    attribute :main_image_1080x1080_alt, :string do
      description "Main image 1080x1080 alt text"
    end

    attribute :main_image_1920x1080_url, :string do
      description "Main image 1920x1080 URL"
    end

    attribute :main_image_1920x1080_alt, :string do
      description "Main image 1920x1080 alt text"
    end

    attribute :main_image_1080x1920_url, :string do
      description "Main image 1080x1920 URL"
    end

    attribute :main_image_1080x1920_alt, :string do
      description "Main image 1080x1920 alt text"
    end

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

end
