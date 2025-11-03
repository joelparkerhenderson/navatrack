defmodule Navatrack.Accounts.User.Fab do
  defmacro __using__(_opts) do
    quote do

      def fab!(map \\ %{}) do
        __MODULE__ |> Ash.Changeset.for_create(:create, __MODULE__.fab_map(map)) |> Ash.create!()
      end

      def fab_map(map \\ %{}) do
        Map.merge(
          %{
            ### meta
            locale_code: "en-US",
            parent_id: nil,
            parent_order: nil,
            ### card
            name: "my-name",
            sign: "○",
            status: "my-status",
            tagging: "my-tagging",
            note: "my-note",
            ### contact
            web: "https://my-web",
            email: "#{Ecto.UUID.generate()}@example.com",
            phone: "my-phone",
            chat: "my-chat",
            calendar: "my-calendar",
            postal: "my-postal",
            rdf_type: "my-rdf-type",
            ### social
            bluesky_as_url: "https://bsky.app/profile/my-handle",
            codeberg_as_url: "https://codeberg.org/in/my-handle",
            facebook_as_url: "https://facebook.com/my-handle" ,
            github_as_url: "https://github.com/in/my-handle",
            instagram_as_url: "https://instagram.com/my-handle",
            linkedin_as_url: "https://linkedin.com/in/my-handle",
            mastodon_as_url: "https://mastodon.social/@my-handle",
            orcid_as_url: "https://orcid.org/my-handle",
            tiktok_as_url: "https://tiktok.com/my-handle",
            wikipedia_as_url: "https://wikipedia.org/my-handle",
            youtube_as_url: "https://youtube.com/my-handle",
            ### location
            location_iso_3166_1_alpha_2: "my",
            location_iso_3166_2: "my-location-iso-3166-2",
            location_postal_code: "my-postal-code",
            location_latitude_as_decimal_degrees: "1.2",
            location_longitude_as_decimal_degrees: "3.4",
            ### workable
            email_distribution_list: "my-email-distribution-list",
            daisyui_timeline_html: "my-daisyui-timeline-html",
            org_mode: "my-org-mode",
            task_list_as_markdown: "my-task-list-as-markdown",
            ways_of_working_as_markdown: "my-ways-of-working-as-markdown",
            objectives_and_key_results_as_markdown: "my-objectives-and-key-results-as-markdown",
            key_performance_indicators_as_markdown: "my-key-performance-indicators-as-markdown",
            ### images
            avatar_image_400x400_url: "https://my-avatar-image-400x400-url",
            avatar_image_400x400_alt: "my-avatar-image-400x400-alt",
            main_image_1080x1080_url: "https://my-main-image-1080x1080-url",
            main_image_1080x1080_alt: "my-main-image-1080x1080-alt",
            main_image_1920x1080_url: "https://my-main-image-1920x1080-url",
            main_image_1920x1080_alt: "my-main-image-1920x1080-alt",
            main_image_1080x1920_url: "https://my-main-image-1080x1920-url",
            main_image_1080x1920_alt: "my-main-image-1080x1920-alt",
            ### ideals
            purpose_statement: "my-purpose-statement",
            vision_statement: "my-vision-statement",
            mission_statement: "my-mission-statement",
            values_statement: "my-values-statement",
            ### ai
            ai_agent_instructions_as_url: "https://my-agent-instructions-as-url",
            ai_agent_instructions_as_markdown: "my-agent-instructions-as-markdown",
            ### work profile
            work_profile_resume_as_pdf_url: "https://my-work-profile-resume-as-pdf-url",
            work_profile_resume_as_markdown: "my-work-profile-resume-as-markdown",
            work_profile_curriculum_vitae_as_pdf_url: "https://my-work-profile-curriculum-vitae-as-pdf-url",
            work_profile_curriculum_vitae_as_markdown: "my-work-profile-curriculum-vitae-as-markdown",
            ### work role
            work_role_name: "my-work-role-name",
            work_role_start_date:  Date.from_iso8601!("1970-01-01"),
            work_role_stop_date: Date.from_iso8601!("1970-01-01"),
            work_role_level: "my-work-role-level",
            work_role_description_as_markdown: "my-work-role-description-as-markdown",
            work_role_professional_development_plan_as_markdown: "my-work-role-professional-development-aim-as-markdown",
            work_role_onet_soc_2019_code: "my-work-role-onet-soc-2019-code",
            work_role_uk_civil_service_grade_abbreviation: "my-work-role-uk-civil-service-grade-abbreviation",
            work_role_uk_soc_2020_code: "my-work-role-uk-soc-2020-code",
            work_role_uk_gdad_pcf_url: "https://my-work-role-uk-gdad-pcf-url",
          },
          map
        )
      end

    end
  end
end
