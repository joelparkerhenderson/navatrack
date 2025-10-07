defmodule NavatrackWeb.UserIloIsco2008Links.FormLive do
  use NavatrackWeb, :live_view
  alias Navatrack.Works.UserIloIsco2008Link, as: X

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

        <.input field={form[:name]} label="📛 Name" autofocus />
        <.input field={form[:status]} label="🚦 Status" />
        <.input field={form[:tagging]} label="🏷️ Tags" />

        <.section id="contact" title="Contacts">
          <.input field={form[:url]} type="url" label="🔗 URL" placeholder="https://example.com" />
          <.input
            field={form[:email]}
            type="email"
            label="📧 Email"
            placeholder="example@example.com"
          />
          <.input field={form[:phone]} type="tel" label=" 📱 Phone" placeholder="+1-415-555-5555" />
          <.input
            field={form[:messaging]}
            label="💬 Messaging"
            placeholder="https://bsky.app/profile/example"
          />
          <.input
            field={form[:postal]}
            label="📫 Postal"
            placeholder="123 Main St, San Francisco, CA, US, 94100, US"
          />
          <.input field={form[:orcid_pid]} label="🌺 ORCID PID" placeholder="0009-0000-4681-282X" />
          <.input field={form[:rdf_type]} label="🖇️ RDF Type" />
        </.section>

        <.section id="socials" title="Socials">
          <.input
            field={form[:linkedin_url]}
            label="LinkedIn URL"
            placeholder="https://linkedin.com/in/example"
          />
          <.input
            field={form[:github_url]}
            label="GitHub URL"
            placeholder="https://github.com/in/example"
          />
          <.input
            field={form[:codeberg_url]}
            label="Codeberg URL"
            placeholder="https://codeberg.com/example"
          />
        </.section>

        <.section id="location" title="Locations">
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
          <.input field={form[:location_postal_code]} label="Postal code" placeholder="94100" />
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

        <.section id="agents" title="AGENTS.md">
          <.input
            field={form[:agents_as_url]}
            type="url"
            label="🔗 URL"
            placeholder="https://example.com"
          />
          <.input field={form[:agents_as_markdown]} type="textarea" label="Text" />
        </.section>

        <.section id="images" title="Images">
          <h3 class="h3">Avatar 400x400</h3>

          <.input
            field={form[:avatar_image_400x400_url]}
            label="🔗 URL"
            placeholder="https://example.com"
          />
          <.input field={form[:avatar_image_400x400_alt]} label="Alt" />

          <h3 class="h3">Splash 1080x1080 square</h3>

          <.input
            field={form[:main_image_1080x1080_url]}
            label="🔗 URL"
            placeholder="https://example.com"
          />
          <.input field={form[:main_image_1080x1080_alt]} label="Alt" />

          <h3 class="h3">Splash 1920x1080 landscape</h3>

          <.input
            field={form[:main_image_1920x1080_url]}
            label="🔗 URL"
            placeholder="https://example.com"
          />
          <.input field={form[:main_image_1920x1080_alt]} label="Alt" />

          <h3 class="h3">Splash 1920x1080 portrait</h3>

          <.input
            field={form[:main_image_1080x1920_url]}
            label="🔗 URL"
            placeholder="https://example.com"
          />
          <.input field={form[:main_image_1080x1920_alt]} label="Alt" />
        </.section>

        <.section id="deeper_dive" title="Deeper Dive">
          <.input field={form[:note]} label="Note" />
          <.input field={form[:email_distribution_list]} label="Email distribution list" />
          <.input field={form[:daisyui_timeline_html]} label="DaisyUI timeline HTML" />
          <.input field={form[:org_mode]} label="Org Mode" />
          <.input field={form[:task_list_as_markdown]} type="textarea" label="Task list as markdown" />
          <.input field={form[:ways_of_working_as_markdown]} type="textarea" label="Ways Of Working" />
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

        <.section id="gs1" title="GS1 codes">
          <.input field={form[:gs1_digital_link]} label="GS1 Digital Link" />
          <.input field={form[:gs1_country_code]} label="GS1 Country Code" />
          <.input field={form[:gs1_global_location_number]} label="GS1 Global Location Number" />
        </.section>

        <.section id="isic_v4" title="International Standard Industrial Classification V4">
          <.input field={form[:isic_v4_code]} label="Code" />
          <.input field={form[:isic_v4_name]} label="Name" />
        </.section>

        <.section id="net_promoter_score" title="Net Promoter Score">
          <h3 class="h3">Net Promoter Score (NPS) Customer Perspective</h3>

          <.input
            field={form[:net_promoter_score_customer_perspective_actual_value]}
            label="Actual Value"
          />
          <.input
            field={form[:net_promoter_score_customer_perspective_target_value]}
            label="Target Value"
          />
          <.input field={form[:net_promoter_score_customer_perspective_unit]} label="Unit" />
          <.input
            field={form[:net_promoter_score_customer_perspective_description_as_markdown]}
            type="textarea"
            label="Description"
          />

          <h3 class="h3">Net Promoter Score (NPS) User Perspective</h3>

          <.input
            field={form[:net_promoter_score_user_perspective_actual_value]}
            label="Actual Value"
          />
          <.input
            field={form[:net_promoter_score_user_perspective_target_value]}
            label="Target Value"
          />
          <.input field={form[:net_promoter_score_user_perspective_unit]} label="Unit" />
          <.input
            field={form[:net_promoter_score_user_perspective_description_as_markdown]}
            type="textarea"
            label="Description"
          />

          <h3 class="h3">Net Promoter Score (NPS) Worker Perspective</h3>

          <.input
            field={form[:net_promoter_score_worker_perspective_actual_value]}
            label="Actual Value"
          />
          <.input
            field={form[:net_promoter_score_worker_perspective_target_value]}
            label="Target Value"
          />
          <.input field={form[:net_promoter_score_worker_perspective_unit]} label="Unit" />
          <.input
            field={form[:net_promoter_score_worker_perspective_description_as_markdown]}
            type="textarea"
            label="Description"
          />
        </.section>

        <.section id="policies" title="Policies">
          <h3 class="h3">Ethics Policy</h3>

          <.input field={form[:ethics_policy_as_url]} type="url" label="Code" />
          <.input field={form[:ethics_policy_as_markdown]} label="Name" />

          <h3 class="h3">Copyright Policy</h3>

          <.input field={form[:copyright_policy_as_url]} type="url" label="🔗 URL" />
          <.input field={form[:copyright_policy_as_markdown]} label="Text" />

          <h3 class="h3">Corrections Policy</h3>

          <.input field={form[:corrections_policy_as_url]} type="url" label="🔗 URL" />
          <.input field={form[:corrections_policy_as_markdown]} label="Text" />

          <h3 class="h3">Legal Policy</h3>

          <.input field={form[:legal_policy_as_url]} type="url" label="🔗 URL" />
          <.input field={form[:legal_policy_as_markdown]} label="Text" />

          <h3 class="h3">Privacy Policy</h3>

          <.input field={form[:privacy_policy_as_url]} type="url" label="🔗 URL" />
          <.input field={form[:privacy_policy_as_markdown]} label="Text" />

          <h3 class="h3">Security Policy</h3>

          <.input field={form[:security_policy_as_url]} type="url" label="🔗 URL" />
          <.input field={form[:security_policy_as_markdown]} label="Text" />

          <h3 class="h3">Coordinated Disclosure Policy</h3>

          <.input field={form[:coordinated_disclosure_policy_as_url]} type="url" label="🔗 URL" />
          <.input field={form[:coordinated_disclosure_policy_as_markdown]} label="Text" />

          <h3 class="h3">Open Source Policy</h3>

          <.input field={form[:open_source_policy_as_url]} type="url" label="🔗 URL" />
          <.input field={form[:open_source_policy_as_markdown]} label="Text" />

          <h3 class="h3">Code of Conduct Policy</h3>

          <.input field={form[:code_of_conduct_policy_as_url]} type="url" label="🔗 URL" />
          <.input field={form[:code_of_conduct_policy_as_markdown]} label="Text" />

          <h3 class="h3">Equal Opportunity Policy</h3>

          <.input field={form[:equal_opportunity_policy_as_url]} type="url" label="🔗 URL" />
          <.input field={form[:equal_opportunity_policy_as_markdown]} label="Text" />

          <h3 class="h3">Social Network Policy</h3>

          <.input field={form[:social_network_policy_as_url]} type="url" label="🔗 URL" />
          <.input field={form[:social_network_policy_as_markdown]} type="url" label="Text" />

          <h3 class="h3">Health &amp; Safety Policy</h3>

          <.input field={form[:health_and_safety_policy_as_url]} type="url" label="🔗 URL" />
          <.input field={form[:health_and_safety_policy_as_markdown]} label="Text" />

          <h3 class="h3">Employee Handbook Policy</h3>

          <.input field={form[:employee_handbook_policy_as_url]} type="url" label="🔗 URL" />
          <.input field={form[:employee_handbook_policy_as_markdown]} label="Text" />

          <h3 class="h3">Human Resources Policy</h3>

          <.input field={form[:human_resources_policy_as_url]} type="url" label="🔗 URL" />
          <.input field={form[:human_resources_policy_as_markdown]} label="Text" />
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
