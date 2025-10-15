defmodule NavatrackWeb.Users.FormLive do
  use NavatrackWeb, :live_view
  alias Navatrack.Accounts.User, as: X

  require Logger

  @doc """
  Mount the LiveView:
  - Update an item via an item id.
  - Create a new item.
  """

  def mount(%{"id" => id}, _session, socket) do
    form = AshPhoenix.Form.for_create(X, :edit)
    x = Ash.get!(X, id)

    {:ok,
     assign(socket,
       page_title: "Update #{X.singular_title_case()}",
       form: to_form(form),
       x: x
     )}
  end

  def mount(_params, _session, socket) do
    form = AshPhoenix.Form.for_create(X, :create)

    {:ok,
     assign(socket,
       page_title: "Create #{X.singular_title_case()}",
       form: to_form(form)
     )}
  end

  @doc """
  Render.
  """
  def render(assigns) do
    ~H"""
    <Layouts.app {assigns}>
      <.header>
        {@page_title}
      </.header>

      <.form
        :let={form}
        id="x_form"
        for={@form}
        as={:form}
        phx-change="validate"
        phx-submit="save"
      >
        <h2 class="h2">Introduction</h2>

        <.input
          field={form[:name]}
          label="📛 Name"
          autofocus
        />
        <.input
          field={form[:sign]}
          label="🚦 Sign"
        />
        <.input
          field={form[:status]}
          label="📍 Status"
        />
        <.input
          field={form[:tagging]}
          label="🏷️ Tags"
        />
        <.input
          field={form[:note]}
          label="🗒️ Note"
        />

        <.section id="contact" title="Contact">
          <.input
            field={form[:web]}
            type="url"
            label="🌐 Web"
            placeholder="https://example.com" />
          <.input
            field={form[:email]}
            type="email"
            label="📧 Email"
            placeholder="example@example.com"
          />
          <.input field={form[:phone]}
            type="tel"
            label=" 📱 Phone" placeholder="+1-415-555-5555"
          />
          <.input
            field={form[:chat]}
            label="💬 Chat"
            placeholder=""
          />
          <.input
            field={form[:calendar]}
            label="🗓️ Calendar"
            placeholder=""
          />
          <.input
            field={form[:postal]}
            label="📫 Postal"
            placeholder="123 Main St, San Francisco, CA, US, 94100, US"
          />
          <.input
            field={form[:rdf_type]}
            label="🖇️ RDF Type"
          />
        </.section>

        <.section id="Socials" title="Socials">
          <.input
            field={form[:bluesky_as_url]}
            label="Bluesky URL"
            type="url"
            placeholder="https://bsky.app/profile/example"
          />
          <.input
            field={form[:codeberg_as_url]}
            label="Codeberg URL"
            type="url"
            placeholder="https://codeberg.com/example"
          />
          <.input
            field={form[:facebook_as_url]}
            label="Facebook URL"
            type="url"
            placeholder="https://facebook.com/example"
          />
          <.input
            field={form[:github_as_url]}
            label="GitHub URL"
            type="url"
            placeholder="https://github.com/in/example"
          />
          <.input
            field={form[:instagram_as_url]}
            label="Instagram URL"
            type="url"
            placeholder="https://instagram.com/example"
          />
          <.input
            field={form[:linkedin_as_url]}
            label="LinkedIn URL"
            type="url"
            placeholder="https://linkedin.com/in/example"
          />
          <.input
            field={form[:orcid_as_url]}
            label="ORCID URL"
            type="url"
            placeholder="https://orcid.org/example"
          />
          <.input
            field={form[:tiktok_as_url]}
            label="TikTok URL"
            type="url"
            placeholder="https://tiktok.com/example"
          />
          <.input
            field={form[:wikipedia_as_url]}
            label="Wikipedia URL"
            type="url"
            placeholder="https://wikipedia.org/example"
          />
          <.input
            field={form[:youtube_as_url]}
            label="YouTube URL"
            type="url"
            placeholder="https://youtube.com/example"
          />
        </.section>

        <.section id="location" title="Location">
          <.input
            field={form[:location_iso_3166_1_alpha_2]}
            label="Country code (ISO 3166-1 Alpha 2)"
            placeholder="US"
          />
          <.input
            field={form[:location_iso_3166_2]}
            label="Subcountry code (ISO 3166-2)"
            placeholder="CA"
          />
          <.input
            field={form[:location_postal_code]}
            label="Postal code" placeholder="94100"
          />
          <.input
            field={form[:location_latitude_as_decimal_degrees]}
            label="Latitude"
            placeholder="37.7954"
          />
          <.input
            field={form[:location_longitude_as_decimal_degrees]}
            label="Longitude"
            placeholder="122.3936"
          />
        </.section>

        <.section id="images" title="Images">

          <h3 class="h3">
            Avatar image 400x400
          </h3>

          <.input
            field={form[:avatar_image_400x400_url]}
            label="🔗 URL"
            placeholder="https://example.com"
          />
          <.input
            field={form[:avatar_image_400x400_alt]}
            label="Alt"
          />

          <h3 class="h3">
            Main image 1080x1080 square
          </h3>

          <.input
            field={form[:main_image_1080x1080_url]}
            label="🔗 URL"
            placeholder="https://example.com"
          />
          <.input
            field={form[:main_image_1080x1080_alt]}
            label="Alt"
          />

          <h3 class="h3">
            Main image 1920x1080 landscape
          </h3>

          <.input
            field={form[:main_image_1920x1080_url]}
            label="🔗 URL"
            placeholder="https://example.com"
          />
          <.input
            field={form[:main_image_1920x1080_alt]}
            label="Alt"
          />

          <h3 class="h3">
            Main image 1080x1920 portrait
          </h3>

          <.input
            field={form[:main_image_1080x1920_url]}
            label="🔗 URL"
            placeholder="https://example.com"
          />
          <.input
            field={form[:main_image_1080x1920_alt]}
            label="Alt"
          />
        </.section>

        <.section id="ideals" title="Ideals">
          <.input
            field={form[:purpose_statement]}
            label="Purpose Statement"
          />
          <.input
            field={form[:vision_statement]}
            label="Vision Statement"
          />
          <.input
            field={form[:mission_statement]}
            label="Mission Statement"
          />
          <.input
            field={form[:values_statement]}
            label="Values Statement"
          />
        </.section>

        <.section id="ai" title="AI Agent Instructions">
          <.input
            field={form[:ai_agent_instructions_as_url]}
            label="URL"
            type="url"
            placeholder="https://example.com"
          />
          <.input
            field={form[:ai_agent_instructions_as_markdown]}
            label="Markdown"
            type="textarea"
          />
        </.section>

        <.section id="deeper_dive" title="Deeper Dive">
          <.input field={form[:email_distribution_list]}
            label="Email distribution list"
          />
          <.input field={form[:daisyui_timeline_html]}
            label="DaisyUI timeline HTML"
          />
          <.input field={form[:org_mode]}
            label="Org Mode"
          />
          <.input
            field={form[:task_list_as_markdown]}
            type="textarea"
            label="Task list as markdown"
          />
          <.input
            field={form[:ways_of_working_as_markdown]}
            type="textarea"
            label="Ways Of Working"
          />
          <.input
            field={form[:objectives_and_key_results_as_markdown]}
            type="textarea"
            label="Objectives and Key Results (OKRs)"
          />
          <.input
            field={form[:key_performance_indicators_as_markdown]}
            type="textarea"
            label="Key Performance Indicators (KPIs)"
          />
        </.section>

        <.section id="work_profile" title="Work Profile">
          <h3 class="h3">
            Résumé
          </h3>

          <.input
            field={form[:work_profile_resume_as_pdf_url]}
            label="PDF URL"
            placeholder="https://example.com/resume.pdf"
          />
          <.input
            field={form[:work_profile_resume_as_markdown]}
            type="textarea"
            label="Text"
          />

          <h3 class="h3">
            Curriculum Vitae
          </h3>

          <.input
            field={form[:work_profile_curriculum_vitae_as_pdf_url]}
            label="PDF URL"
            placeholder="https://example.com/resume.pdf"
          />
          <.input
            field={form[:work_profile_curriculum_vitae_as_markdown]}
            type="textarea"
            label="Text"
          />
        </.section>

        <.section id="work_role" title="Work Role">
          <h3 class="h3">
            Summary
          </h3>

          <.input
            field={form[:work_role_name]}
            label="Role Name/Title/etc."
            placeholder="My Work Role Name"
          />
          <.input
            field={form[:work_role_level]}
            label="Role Level/Grade/etc."
            placeholder="My Work Role Level"
          />
          <.input
            field={form[:work_role_description_as_markdown]}
            type="textarea"
            label="Description"
          />
          <.input
            field={form[:work_role_professional_development_plan_as_markdown]}
            type="textarea"
            label="Professional Development Plan"
          />

          <h3 class="h3">
            Dates
          </h3>

          <.input field={form[:work_role_start_date]}
            type="date"
            label="Start Date"
          />
          <.input field={form[:work_role_stop_date]}
            type="date"
            label="Stop Date"
          />
        </.section>

        <.section id="work_codes" title="Work Codes">
          <.input
            field={form[:work_role_onet_soc_2019_code]}
            label="O*NET SOC 2019"
          />
          <.input
            field={form[:work_role_uk_civil_service_grade_abbreviation]}
            label="United Kingdom (UK) Civil Service Grade Abbreviation"
          />
          <.input
            field={form[:work_role_uk_soc_2020_code]}
            label="United Kingdom (UK) Standard Occupational Classification (SOC) 2020 Code Service Grade Abbreviation"
          />
          <.input
            field={form[:work_role_uk_gdad_pcf_url]}
            label="United Kingdom (UK) Government Digital and Data (GDAD) Profession Capability Framework (PCF) URL"
            placeholder="https://example.com"
          />
        </.section>

        <.button type="primary">Save</.button>
      </.form>
    </Layouts.app>
    """
  end

  @doc """
  Handle event:
    - update now to try to work around DaisyUI collapse bug
    - validate form data
    - save form data to the database
  """

  def handle_event("updater", _params, socket) do
    IO.inspect("handle_event updater")
    {:noreply, socket}
  end

  def handle_event("validate", %{"form" => form_data}, socket) do
    # form_data = convert_tags_param(form_data)
    {:noreply,
     update(
       socket,
       :form,
       fn form -> AshPhoenix.Form.validate(form, form_data) end
     )}
  end

  def handle_event("save", %{"form" => form_data}, socket) do
    # form_data = convert_tags_param(form_data)
    case AshPhoenix.Form.submit(socket.assigns.form, params: form_data) do
      {:ok, _x} ->
        {:noreply,
         socket
         |> put_flash(:info, "Saved.")
         |> push_navigate(to: path_index(X))}

      {:error, form} ->
        # Print all errors
        IO.inspect(form.errors, label: "Form errors")

        # Print Ash built-in error formatting
        IO.inspect(AshPhoenix.Form.errors(form), label: "Changeset errors")

        # Print the full form for debugging
        IO.inspect(form, label: "Full form")

        IO.inspect(form.source.params, label: "form.source.params (before processing)")
        IO.inspect(form.params, label: "form.params (after processing)")

        {:noreply,
         socket
         |> put_flash(:error, "Save failed.")
         |> assign(:form, form)}
    end
  end
end
