defmodule NavatrackWeb.Events.FormLive do
  use NavatrackWeb, :live_view
  alias Navatrack.Works.Event, as: X

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
       page_title: "Update #{X.title_case_singular()}",
       form: to_form(form),
       x: x
     )}
  end

  def mount(_params, _session, socket) do
    form = AshPhoenix.Form.for_create(X, :create)

    {:ok,
     assign(socket,
       page_title: "Create #{X.title_case_singular()}",
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
            placeholder="https://example.com"
          />
          <.input
            field={form[:email]}
            type="email"
            label="📧 Email"
            placeholder="example@example.com"
          />
          <.input
            field={form[:phone]}
            type="tel"
            label="📱 Phone"
            placeholder="+1-415-555-5555"
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

        <.section id="charts" title="Chart">

          <.input
            field={form[:apache_echart_as_url]}
            type="url"
            label="🔗 URL"
            placeholder="https://example.com"
          />
          <.input
            field={form[:apache_echart_as_typescript]}
            label="TypeScript"
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
            type="textarea"
          />
          <.input
            field={form[:vision_statement]}
            label="Vision Statement"
            type="textarea"
          />
          <.input
            field={form[:mission_statement]}
            label="Mission Statement"
            type="textarea"
          />
          <.input
            field={form[:values_statement]}
            label="Values Statement"
            type="textarea"
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

        <.section id="links" title="Links">
          <.input
            field={form[:home_emoji_url]}
            label="🏠 Home"
            type="url"
            placeholder="https://example.com"
          />
          <.input
            field={form[:bellhop_bell_emoji_url]}
            label="🛎️ Concierge"
            type="url"
            placeholder="https://example.com"
          />
          <.input
            field={form[:target_emoji_url]}
            label="🎯 Target"
            type="url"
            placeholder="https://example.com"
          />
          <.input
            field={form[:gear_emoji_url]}
            label="⚙️ Technical Contact"
            type="url"
            placeholder="https://example.com"
          />
          <.input
            field={form[:spiral_calendar_emoji_url]}
            label="🗓️ Calendar"
            type="url"
            placeholder="https://example.com"
          />
          <.input
            field={form[:sparkles_emoji_url]}
            label="✨ AI"
            type="url"
            placeholder="https://example.com"
          />
          <.input
            field={form[:speech_bubble_emoji_url]}
            label="💬 Chat"
            type="url"
            placeholder="https://example.com"
          />
          <.input
            field={form[:newspaper_emoji_url]}
            label="📰 News"
            type="url"
            placeholder="https://example.com"
          />
          <.input
            field={form[:bar_chart_emoji_url]}
            label="📊 Charts"
            type="url"
            placeholder="https://example.com"
          />
          <.input
            field={form[:movie_camera_emoji_url]}
            label="🎥 Videos"
            type="url"
            placeholder="https://example.com"
          />
          <.input
            field={form[:construction_worker_emoji_url]}
            label="👷 Construction Worker"
            type="url"
            placeholder="https://example.com"
          />
          <.input
            field={form[:crystal_ball_emoji_url]}
            label="🔮 Future"
            type="url"
            placeholder="https://example.com"
          />
          <.input
            field={form[:butterfly_emoji_url]}
            label="🦋 Feature Tracker"
            type="url"
            placeholder="https://example.com"
          />
          <.input
            field={form[:lady_beetle_emoji_url]}
            label="🐞 Bug Tracker"
            type="url"
            placeholder="https://example.com"
          />
        </.section>

        <.section id="deeper_dive" title="Deeper Dive">
          <.input
            field={form[:email_distribution_list]}
            label="Email distribution list"
          />
          <.input
            field={form[:daisyui_timeline_html]}
            label="DaisyUI timeline HTML"
          />
          <.input
            field={form[:org_mode]}
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

        <.section id="business_analysis" title="Business Analysis">

          <h3 class="h3">
            GS1 Codes
          </h3>

          <.input
            field={form[:gs1_digital_link]}
            label="GS1 Digital Link"
          />
          <.input
            field={form[:gs1_country_code]}
            label="GS1 Country Code"
          />
          <.input
            field={form[:gs1_global_location_number]}
            label="GS1 Global Location Number"
          />

          <h3 class="h3">
            International Standard Industrial Classification V4
          </h3>

          <.input
            field={form[:isic_v4_code]}
            label="Code"
          />
          <.input
            field={form[:isic_v4_name]}
            label="Name"
          />

          <h3 class="h3">
            Six-Pager Double-Sider
          </h3>

          <.input
            field={form[:six_pager_double_sider_as_url]}
            type="url"
            label="🔗 URL"
            placeholder="https://example.com"
          />
          <.input
            field={form[:six_pager_double_sider_as_markdown]}
            type="textarea"
            label="Text"
          />

        </.section>

        <.section id="swot" title="SWOT: Strengths Weaknesses Opportunities Threats">

          <.input
            field={form[:swot_as_url]}
            type="url"
            label="🔗 URL"
            placeholder="https://example.com"
          />
          <.input
            field={form[:swot_strengths_as_markdown]}
            type="textarea"
            label="Strengths"
            placeholder=""
          />
          <.input
            field={form[:swot_weaknesses_as_markdown]}
            type="textarea"
            label="Weaknesses"
            placeholder=""
          />
          <.input
            field={form[:swot_opportunities_as_markdown]}
            type="textarea"
            label="Opportunities"
            placeholder=""
          />
          <.input
            field={form[:swot_threats_as_markdown]}
            type="textarea"
            label="Threats"
            placeholder=""
          />
        </.section>

        <.section id="sipoc" title="SIPOC: Suppliers Inputs Processes Outputs Customers">

          <.input
            field={form[:sipoc_as_url]}
            type="url"
            label="🔗 URL"
            placeholder="https://example.com"
          />
          <.input
            field={form[:sipoc_suppliers_as_markdown]}
            type="textarea"
            label="Suppliers"
            placeholder=""
          />
          <.input
            field={form[:sipoc_inputs_as_markdown]}
            type="textarea"
            label="Inputs"
            placeholder=""
          />
          <.input
            field={form[:sipoc_processes_as_markdown]}
            type="textarea"
            label="Processes"
            placeholder=""
          />
          <.input
            field={form[:sipoc_outputs_as_markdown]}
            type="textarea"
            label="Outputs"
            placeholder=""
          />
          <.input
            field={form[:sipoc_customers_as_markdown]}
            type="textarea"
            label="Customers"
            placeholder=""
          />
        </.section>

        <.section id="steeple" title="STEEPLE: Social Technological Economic Environmental Political Legal Ethical">

          <.input
            field={form[:steeple_as_url]}
            type="url"
            label="🔗 URL"
            placeholder="https://example.com"
          />
          <.input
            field={form[:steeple_social_as_markdown]}
            type="textarea"
            label="Socials"
            placeholder="Social considerations, cultural norms, lifestyle trends, health consciousness, age distribution, education levels, changing demographics"
          />
          <.input
            field={form[:steeple_technological_as_markdown]}
            type="textarea"
            label="Technological"
            placeholder="Technological considerations, advancements, innovation, automation, research and development activity, technology incentives, rate of technological change"
          />
          <.input
            field={form[:steeple_economic_as_markdown]}
            type="textarea"
            label="Economic"
            placeholder="Economic considerations, growth, interest rates, exchange rates, inflation rates, unemployment rates, disposable income of consumers and businesses"
          />
          <.input
            field={form[:steeple_environmental_as_markdown]}
            type="textarea"
            label="Environmental"
            placeholder="Environmental considerations, regulations, climate change, weather, ecological aspects, carbon footprint, sustainability events"
          />
          <.input
            field={form[:steeple_political_as_markdown]}
            type="textarea"
            label="Political"
            placeholder="Political considerations, leadership stability, government policies, tax policies, trade restrictions, tariffs, labor laws, environmental regulations"
          />
          <.input
            field={form[:steeple_legal_as_markdown]}
            type="textarea"
            label="Legal"
            placeholder="Legal considerations, employment law, health and safety, antitrust, consumer protection, intellectual property, data protection"
          />
          <.input
            field={form[:steeple_ethical_as_markdown]}
            type="textarea"
            label="Ethical"
            placeholder="Ethical considerations, corporate social responsibility, fair trade practices, labor standards, community engagement"
          />

        </.section>

        <.section id="porters_five_forces" title="Porter's Five Forces">

          <.input
            field={form[:porters_five_forces_as_url]}
            type="url"
            label="🔗 URL"
            placeholder="https://example.com"
          />
          <.input
            field={form[:porters_five_forces_entrants_as_markdown]}
            type="textarea"
            label="Threat Of Entrants"
          />
          <.input
            field={form[:porters_five_forces_substitutes__as_markdown]}
            type="textarea"
            label="Threat Of Substitutes"
          />
          <.input
            field={form[:porters_five_forces_customers_as_markdown]}
            type="textarea"
            label="Bargaining Power Of Customers"
          />
          <.input
            field={form[:porters_five_forces_suppliers_as_markdown]}
            type="textarea"
            label="Bargaining Power Of Suppliers"
          />
          <.input
            field={form[:porters_five_forces_competitors_as_markdown]}
            type="textarea"
            label="Rivalry Of Competitors"
          />
        </.section>

        <.section id="touchpoints" title="Touchpoints">

          <h3 class="h3">
            Glossary
          </h3>

          <.input
            field={form[:glossary_as_url]}
            type="url"
            label="🔗 URL"
            placeholder="https://example.com"
          />
          <.input
            field={form[:glossary_as_markdown]}
            type="textarea"
            label="Text"
          />

          <h3 class="h3">
            Roles and Responsibilities
          </h3>

          <.input
            field={form[:roles_and_responsibilities_as_url]}
            type="url"
            label="🔗 URL"
            placeholder="https://example.com"
          />
          <.input
            field={form[:roles_and_responsibilities_as_markdown]}
            type="textarea"
            label="Text"
          />

          <h3 class="h3">
            Responsibility Assignment Matrix (RAM)
          </h3>

          <.input
            field={form[:responsibility_assignment_matrix_as_url]}
            type="url"
            label="🔗 URL"
            placeholder="https://example.com"
          />
          <.input
            field={form[:responsibility_assignment_matrix_as_markdown]}
            type="textarea"
            label="Text"
          />

        </.section>

        <.section id="policies" title="Policies">

          <h3 class="h3">
            Code of Conduct Policy
          </h3>

          <.input
            field={form[:code_of_conduct_policy_as_url]}
            type="url"
            label="🔗 URL"
            placeholder="https://example.com"
          />
          <.input
            field={form[:code_of_conduct_policy_as_markdown]}
            label="Text"
            type="textarea"
          />

          <h3 class="h3">
            Coordinated Disclosure Policy
          </h3>

          <.input
            field={form[:coordinated_disclosure_policy_as_url]}
            type="url"
            label="🔗 URL"
            placeholder="https://example.com"
          />
          <.input
            field={form[:coordinated_disclosure_policy_as_markdown]}
            label="Text"
            type="textarea"
          />

          <h3 class="h3">
            Copyright Policy
          </h3>

          <.input
            field={form[:copyright_policy_as_url]}
            type="url"
            label="🔗 URL"
            placeholder="https://example.com"
          />
          <.input
            field={form[:copyright_policy_as_markdown]}
            label="Text"
            type="textarea"
          />

          <h3 class="h3">
            Corrections Policy
          </h3>

          <.input
            field={form[:corrections_policy_as_url]}
            type="url"
            label="🔗 URL"
            placeholder="https://example.com"
          />
          <.input
            field={form[:corrections_policy_as_markdown]}
            label="Text"
            type="textarea"
          />

          <h3 class="h3">
            Diversity Policy
          </h3>

          <.input
            field={form[:diversity_policy_as_url]}
            type="url"
            label="🔗 URL"
            placeholder="https://example.com"
          />
          <.input
            field={form[:diversity_policy_as_markdown]}
            label="Text"
            type="textarea"
          />

          <h3 class="h3">
            Equal Opportunity Policy
          </h3>

          <.input
            field={form[:equal_opportunity_policy_as_url]}
            type="url"
            label="🔗 URL"
            placeholder="https://example.com"
          />
          <.input
            field={form[:equal_opportunity_policy_as_markdown]}
            label="Text"
            type="textarea"
          />

          <h3 class="h3">
            Ethics Policy
          </h3>

          <.input
            field={form[:ethics_policy_as_url]}
            type="url"
            label="🔗 URL"
            placeholder="https://example.com"
          />
          <.input
            field={form[:ethics_policy_as_markdown]}
            label="Text"
            type="textarea"
          />

          <h3 class="h3">
            Legal Policy
          </h3>

          <.input
            field={form[:legal_policy_as_url]}
            type="url"
            label="🔗 URL"
            placeholder="https://example.com"
          />
          <.input
            field={form[:legal_policy_as_markdown]}
            label="Text"
            type="textarea"
          />

          <h3 class="h3">
            License Policy
          </h3>

          <.input
            field={form[:license_policy_as_url]}
            type="url"
            label="🔗 URL"
            placeholder="https://example.com"
          />
          <.input
            field={form[:license_policy_as_markdown]}
            label="Text"
            type="textarea"
          />

          <h3 class="h3">
            Privacy Policy
          </h3>

          <.input
            field={form[:privacy_policy_as_url]}
            type="url"
            label="🔗 URL"
            placeholder="https://example.com"
          />
          <.input
            field={form[:privacy_policy_as_markdown]}
            label="Text"
            type="textarea"
          />

          <h3 class="h3">
            Open Source Policy
          </h3>

          <.input
            field={form[:open_source_policy_as_url]}
            type="url"
            label="🔗 URL"
            placeholder="https://example.com"
          />
          <.input
            field={form[:open_source_policy_as_markdown]}
            label="Text"
            type="textarea"
          />

          <h3 class="h3">
            Safety Policy
          </h3>

          <.input
            field={form[:safety_policy_as_url]}
            type="url"
            label="🔗 URL"
            placeholder="https://example.com"
          />
          <.input
            field={form[:safety_policy_as_markdown]}
            label="Text"
            type="textarea"
          />

          <h3 class="h3">
            Security Policy
          </h3>

          <.input
            field={form[:security_policy_as_url]}
            type="url"
            label="🔗 URL"
            placeholder="https://example.com"
          />
          <.input
            field={form[:security_policy_as_markdown]}
            type="textarea"
            label="Text"
          />

          <h3 class="h3">
            Socials Policy
          </h3>

          <.input
            field={form[:socials_policy_as_url]}
            type="url"
            label="🔗 URL"
            placeholder="https://example.com"
          />
          <.input
            field={form[:socials_policy_as_markdown]}
            label="Text"
            type="textarea"
          />

          <h3 class="h3">
            Staff Policy
          </h3>

          <.input
            field={form[:staff_policy_as_url]}
            type="url"
            label="🔗 URL"
            placeholder="https://example.com"
          />
          <.input
            field={form[:staff_policy_as_markdown]}
            label="Text"
            type="textarea"
          />

        </.section>

        <.section id="arc42" title="Arc42">

          <h3 class="h3">
            Arc42 full documentation
          </h3>

          <.input
            field={form[:arc42_as_url]}
            type="url"
            label="🔗 URL"
            placeholder="https://example.com"
          />
          <.input
            field={form[:arc42_01_introduction_and_goals_as_markdown]}
            type="textarea"
            label="Arc42 section 01: Introduction and Goals"
          />
          <.input
            field={form[:arc42_02_constraints_as_markdown]}
            type="textarea"
            label="Arc42 section 02: Constraints"
          />
          <.input
            field={form[:arc42_03_context_and_scope_as_markdown]}
            type="textarea"
            label="Arc42 section 03: Context and Scope"
          />
          <.input
            field={form[:arc42_04_solution_strategy_as_markdown]}
            type="textarea"
            label="Arc42 section 04: Solution Strategy"
          />
          <.input
            field={form[:arc42_05_building_block_view_as_markdown]}
            type="textarea"
            label="Arc42 section 05: Building Block View"
          />
          <.input
            field={form[:arc42_06_runtime_view_as_markdown]}
            type="textarea"
            label="Arc42 section 06: Runtime View"
          />
          <.input
            field={form[:arc42_07_deployment_view_as_markdown]}
            type="textarea"
            label="Arc42 section 07: Deployment View"
          />
          <.input
            field={form[:arc42_08_crosscutting_concepts_as_markdown]}
            type="textarea"
            label="Arc42 section 08: Crosscutting Concepts"
          />
          <.input
            field={form[:arc42_09_architectural_decisions_as_markdown]}
            type="textarea"
            label="Arc42 section 09: Architectural Decisions"
          />
          <.input
            field={form[:arc42_10_quality_requirements_as_markdown]}
            type="textarea"
            label="Arc42 section 10: Quality Requirements"
          />
          <.input
            field={form[:arc42_11_risks_and_technical_debt_as_markdown]}
            type="textarea"
            label="Arc42 section 11: Risks and Technical Debt"
          />
          <.input
            field={form[:arc42_12_glossary_as_markdown]}
            type="textarea"
            label="Arc42 section 12: Glossary"
          />

        </.section>

        <.section id="explain" title="Explain">

          <.input
            field={form[:explain_stakeholders_as_markdown]}
            type="textarea"
            label="Explain Stakeholders"
          />
          <.input
            field={form[:explain_history_as_markdown]}
            type="textarea"
            label="Explain History"
          />
          <.input
            field={form[:explain_authentication_as_markdown]}
            type="textarea"
            label="Explain Authentication"
          />
          <.input
            field={form[:explain_authorization_as_markdown]}
            type="textarea"
            label="Explain Authorization"
          />
          <.input
            field={form[:explain_use_cases_as_markdown]}
            type="textarea"
            label="Explain Use Cases"
          />
          <.input
            field={form[:explain_demographics_as_markdown]}
            type="textarea"
            label="Explain Demographics"
          />
          <.input
            field={form[:explain_ui_as_markdown]}
            type="textarea"
            label="Explain UI"
          />
          <.input
            field={form[:explain_api_as_markdown]}
            type="textarea"
            label="Explain API"
          />
          <.input
            field={form[:explain_data_as_markdown]}
            type="textarea"
            label="Explain Data"
          />
          <.input
            field={form[:explain_mobile_as_markdown]}
            type="textarea"
            label="Explain Mobile"
          />
          <.input
            field={form[:explain_legal_as_markdown]}
            type="textarea"
            label="Explain Legal"
          />
          <.input
            field={form[:explain_financial_as_markdown]}
            type="textarea"
            label="Explain Financial"
          />
          <.input
            field={form[:explain_service_level_agreement_as_markdown]}
            type="textarea"
            label="Explain Service Level Agreement (SLA)"
          />
          <.input
            field={form[:explain_disaster_recovery_as_markdown]}
            type="textarea"
            label="Explain Disaster Recovery (DR)"
          />

        </.section>

        <.section id="system_quality_attributes" title="System Quality Attributes (SQA)">

          <.input
            field={form[:quality_availability_as_markdown]}
            type="textarea"
            label="Availability"
          />
          <.input
            field={form[:quality_certifiability_as_markdown]}
            type="textarea"
            label="Certifiability"
          />
          <.input
            field={form[:quality_compatibility_as_markdown]}
            type="textarea"
            label="Compatibility"
          />
          <.input
            field={form[:quality_efficiency_as_markdown]}
            type="textarea"
            label="Efficiency"
          />
          <.input
            field={form[:quality_governability_as_markdown]}
            type="textarea"
            label="Governability"
          />
          <.input
            field={form[:quality_maintainability_as_markdown]}
            type="textarea"
            label="Maintainability"
          />
          <.input
            field={form[:quality_observability_as_markdown]}
            type="textarea"
            label="Observability"
          />
          <.input
            field={form[:quality_operability_as_markdown]}
            type="textarea"
            label="Operability"
          />
          <.input
            field={form[:quality_recoverability_as_markdown]}
            type="textarea"
            label="Recoverability"
          />
          <.input
            field={form[:quality_scalability_as_markdown]}
            type="textarea"
            label="Scalability"
          />
          <.input
            field={form[:quality_security_as_markdown]}
            type="textarea"
            label="Security"
          />
          <.input
            field={form[:quality_suitability_as_markdown]}
            type="textarea"
            label="Suitability"
          />
          <.input
            field={form[:quality_testability_as_markdown]}
            type="textarea"
            label="Testability"
          />
          <.input
            field={form[:quality_transferability_as_markdown]}
            type="textarea"
            label="Transferability"
          />
          <.input
            field={form[:quality_translatability_as_markdown]}
            type="textarea"
            label="Translatability"
          />
          <.input
            field={form[:quality_warrantability_as_markdown]}
            type="textarea"
            label="Warrantability"
          />
        </.section>

        <.section id="net_promoter_score" title="Net Promoter Score (NPS)">

          <h3 class="h3">
            Customer Perspective
          </h3>

          <.input
            field={form[:net_promoter_score_customer_perspective_actual]}
            label="Actual Value"
          />
          <.input
            field={form[:net_promoter_score_customer_perspective_expect]}
            label="Target Value"
          />
          <.input
            field={form[:net_promoter_score_customer_perspective_unit]}
            label="Unit"
          />
          <.input
            field={form[:net_promoter_score_customer_perspective_description_as_markdown]}
            type="textarea"
            label="Description"
          />

          <h3 class="h3">
            User Perspective
          </h3>

          <.input
            field={form[:net_promoter_score_user_perspective_actual]}
            label="Actual Value"
          />
          <.input
            field={form[:net_promoter_score_user_perspective_expect]}
            label="Target Value"
          />
          <.input
            field={form[:net_promoter_score_user_perspective_unit]}
            label="Unit"
          />
          <.input
            field={form[:net_promoter_score_user_perspective_description_as_markdown]}
            type="textarea"
            label="Description"
          />

          <h3 class="h3">
            Worker Perspective
          </h3>

          <.input
            field={form[:net_promoter_score_worker_perspective_actual]}
            label="Actual Value"
          />
          <.input
            field={form[:net_promoter_score_worker_perspective_expect]}
            label="Target Value"
          />
          <.input
            field={form[:net_promoter_score_worker_perspective_unit]}
            label="Unit"
          />
          <.input
            field={form[:net_promoter_score_worker_perspective_description_as_markdown]}
            type="textarea"
            label="Description"
          />
        </.section>

        <.section id="user_metrics" title="User Metrics">

          <h3 class="h3">
            Active Users
          </h3>

          <.input
            field={form[:active_users_actual]}
            label="Actual Value"
          />
          <.input
            field={form[:active_users_expect]}
            label="Target Value"
          />
          <.input
            field={form[:active_users_unit]}
            label="Unit"
          />
          <.input
            field={form[:active_users_description]}
            type="textarea"
            label="Description"
          />

          <h3 class="h3">
            Uptime Percentage
          </h3>

          <.input
            field={form[:uptime_percentage_actual]}
            label="Actual Value"
          />
          <.input
            field={form[:uptime_percentage_expect]}
            label="Target Value"
          />
          <.input
            field={form[:uptime_percentage_unit]}
            label="Unit"
          />
          <.input
            field={form[:uptime_percentage_description]}
            type="textarea"
            label="Description"
          />
        </.section>

        <.section id="burn_rate" title="Burn Rate">

          <h3 class="h3">
            Net Cash Per Week
          </h3>

          <.input
            field={form[:burn_rate_net_cash_per_week_actual]}
            label="Actual Value"
          />
          <.input
            field={form[:burn_rate_net_cash_per_week_expect]}
            label="Target Value"
          />
          <.input
            field={form[:burn_rate_net_cash_per_week_unit]}
            label="Unit"
          />
          <.input
            field={form[:burn_rate_net_cash_per_week_description]}
            type="textarea"
            label="Description"
          />

          <h3 class="h3">
            Hours Per Week
          </h3>

          <.input
            field={form[:burn_rate_net_hours_per_week_actual]}
            label="Actual Value"
          />
          <.input
            field={form[:burn_rate_net_hours_per_week_expect]}
            label="Target Value"
          />
          <.input
            field={form[:burn_rate_net_hours_per_week_unit]}
            label="Unit"
          />
          <.input
            field={form[:burn_rate_net_hours_per_week_description]}
            type="textarea"
            label="Description"
          />
        </.section>

        <.section id="earned_value_management" title="Earned Value Management (EVM)">
          <.input
            field={form[:earned_value_management_planned_value]}
            label="Planned Value (PV)"
          />
          <.input
            field={form[:earned_value_management_earned_value]}
            label="Earned Value (EV)"
          />
          <.input
            field={form[:earned_value_management_actual_cost]}
            label="Actual Cost (AC)"
          />
        </.section>

        <.section id="total_project_control" title="Total Project Control (TPC)">
          <.input
            field={form[:total_project_control_dipp]}
            label="DIPP"
          />
          <.input
            field={form[:total_project_control_dipp_progress_index_ratio]}
            label="Progress Index (ratio)"
          />
          <.input
            field={form[:total_project_control_dipp_progress_index_numerator]}
            label="Progress Index (numerator)"
          />
          <.input
            field={form[:total_project_control_dipp_progress_index_denominator]}
            label="Progress Index (denominator)"
          />
          <.input
            field={form[:total_project_control_expected_monetary_value]}
            label="Expected Monetary Value"
          />
          <.input
            field={form[:total_project_control_cost_estimate_to_complete]}
            label="Cost Estimate To Complete"
          />
        </.section>

        <.section id="dora_metrics" title="DORA Metrics">

          <h3 class="h3">
            Deployment Frequency
          </h3>

          <.input
            field={form[:deployment_frequency_actual]}
            label="Actual Value"
          />
          <.input
            field={form[:deployment_frequency_expect]}
            label="Target Value"
          />
          <.input
            field={form[:deployment_frequency_unit]}
            label="Unit"
          />
          <.input
            field={form[:deployment_frequency_description]}
            type="textarea"
            label="Description"
          />

          <h3 class="h3">
            Lead Time For Changes
          </h3>

          <.input
            field={form[:lead_time_for_changes_actual]}
            label="Actual Value"
          />
          <.input
            field={form[:lead_time_for_changes_expect]}
            label="Target Value"
          />
          <.input
            field={form[:lead_time_for_changes_unit]}
            label="Unit"
          />
          <.input
            field={form[:lead_time_for_changes_description]}
            type="textarea"
            label="Description"
          />

          <h3 class="h3">
            Change Failure Rate
          </h3>

          <.input
            field={form[:change_failure_rate_actual]}
            label="Actual Value"
          />
          <.input
            field={form[:change_failure_rate_expect]}
            label="Target Value"
          />
          <.input
            field={form[:change_failure_rate_unit]}
            label="Unit"
          />
          <.input
            field={form[:change_failure_rate_description]} type="textarea"
            label="Description"
          />

          <h3 class="h3">
            Mean Time To Recovery
          </h3>

          <.input
            field={form[:mean_time_to_recovery_actual]}
            label="Actual Value"
          />
          <.input
            field={form[:mean_time_to_recovery_expect]}
            label="Target Value"
          />
          <.input
            field={form[:mean_time_to_recovery_unit]}
            label="Unit"
          />
          <.input
            field={form[:mean_time_to_recovery_description]}
            type="textarea"
            label="Description"
          />
        </.section>

        <.section id="code_metrics" title="Code Metrics">
          <h3 class="h3">
            Maintainability Index
          </h3>

          <.input
            field={form[:maintainability_index_actual]}
            label="Actual Value"
          />
          <.input
            field={form[:maintainability_index_expect]}
            label="Target Value"
          />
          <.input
            field={form[:maintainability_index_unit]}
            label="Unit"
          />
          <.input
            field={form[:maintainability_index_description]}
            type="textarea"
            label="Description"
          />

          <h3 class="h3">
            Line Count
          </h3>

          <.input
            field={form[:line_count_actual]}
            label="Actual Value"
          />
          <.input
            field={form[:line_count_expect]}
            label="Target Value"
          />
          <.input
            field={form[:line_count_unit]}
            label="Unit"
          />
          <.input
            field={form[:line_count_description]} type="textarea"
            label="Description"
          />

          <h3 class="h3">
            Test Automation Code Coverage
          </h3>

          <.input
            field={form[:test_automation_code_coverage_actual]}
            label="Actual Value"
          />
          <.input
            field={form[:test_automation_code_coverage_expect]}
            label="Target Value"
          />
          <.input
            field={form[:test_automation_code_coverage_unit]}
            label="Unit"
          />
          <.input
            field={form[:test_automation_code_coverage_description]}
            type="textarea"
            label="Description"
          />

          <h3 class="h3">
            Halstead Complexity Volume
          </h3>

          <.input
            field={form[:halstead_complexity_volume_actual]}
            label="Actual Value"
          />
          <.input
            field={form[:halstead_complexity_volume_expect]}
            label="Target Value"
          />
          <.input
            field={form[:halstead_complexity_volume_unit]}
            label="Unit"
          />
          <.input
            field={form[:halstead_complexity_volume_description]}
            type="textarea"
            label="Description"
          />

          <h3 class="h3">
            Halstead Complexity Difficulty
          </h3>

          <.input
            field={form[:halstead_complexity_difficulty_actual]}
            label="Actual Value"
          />
          <.input
            field={form[:halstead_complexity_difficulty_expect]}
            label="Target Value"
          />
          <.input
            field={form[:halstead_complexity_difficulty_unit]}
            label="Unit"
          />
          <.input
            field={form[:halstead_complexity_difficulty_description]}
            type="textarea"
            label="Description"
          />

          <h3 class="h3">
            Halstead Complexity Effort
          </h3>

          <.input
            field={form[:halstead_complexity_effort_actual]}
            label="Actual Value"
          />
          <.input
            field={form[:halstead_complexity_effort_expect]}
            label="Target Value"
          />
          <.input
            field={form[:halstead_complexity_effort_unit]}
            label="Unit"
          />
          <.input
            field={form[:halstead_complexity_effort_description]}
            type="textarea"
            label="Description"
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
    IO.inspect(form_data, label: "form_data")
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
