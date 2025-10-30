defmodule NavatrackWeb.Router do
  use NavatrackWeb, :router

  use AshAuthentication.Phoenix.Router

  import AshAuthentication.Plug.Helpers
  import Backpex.Router

  pipeline :graphql do
    plug :load_from_bearer
    plug :set_actor, :user
    plug AshGraphql.Plug
  end

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {NavatrackWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :load_from_session
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug :load_from_bearer
    plug :set_actor, :user
  end

  scope "/", NavatrackWeb do
    pipe_through :browser
    get "/", PageController, :home
    backpex_routes()

    auth_routes AuthController, Navatrack.Accounts.User, path: "/auth"
    sign_out_route AuthController

    # Remove these if you'd like to use your own authentication views
    sign_in_route register_path: "/register",
                  reset_path: "/reset",
                  auth_routes_prefix: "/auth",
                  on_mount: [{NavatrackWeb.LiveUserAuth, :live_no_user}],
                  overrides: [
                    NavatrackWeb.AuthOverrides,
                    AshAuthentication.Phoenix.Overrides.Default
                  ]

    # Remove this if you do not want to use the reset password feature
    reset_route auth_routes_prefix: "/auth",
                overrides: [
                  NavatrackWeb.AuthOverrides,
                  AshAuthentication.Phoenix.Overrides.Default
                ]

    # Remove this if you do not use the confirmation strategy
    confirm_route Navatrack.Accounts.User, :confirm_new_user,
      auth_routes_prefix: "/auth",
      overrides: [NavatrackWeb.AuthOverrides, AshAuthentication.Phoenix.Overrides.Default]

    # Remove this if you do not use the magic link strategy.
    magic_sign_in_route(Navatrack.Accounts.User, :magic_link,
      auth_routes_prefix: "/auth",
      overrides: [NavatrackWeb.AuthOverrides, AshAuthentication.Phoenix.Overrides.Default]
    )

    # In each LiveView, add one of the following at the top of the module:
    #
    # If an authenticated user must be present:
    # on_mount {NavatrackWeb.LiveUserAuth, :live_user_required}
    #
    # If an authenticated user *may* be present:
    # on_mount {NavatrackWeb.LiveUserAuth, :live_user_optional}
    #
    # If an authenticated user must *not* be present:
    # on_mount {NavatrackWeb.LiveUserAuth, :live_no_user}

    ash_authentication_live_session :authentication_optional,
      on_mount: {NavatrackWeb.LiveUserAuth, :live_user_optional} do
      end

    ash_authentication_live_session :authentication_required,
      on_mount: {NavatrackWeb.LiveUserAuth, :live_user_required} do

        ### Access

        live "/access_assignments", AccessAssignments.IndexLive
        live "/access_assignments/new", AccessAssignments.FormLive, :new
        live "/access_assignments/:id", AccessAssignments.ShowLive
        live "/access_assignments/:id/edit", AccessAssignments.FormLive, :edit

        live "/access_attributes", AccessAttributes.IndexLive
        live "/access_attributes/new", AccessAttributes.FormLive, :new
        live "/access_attributes/:id", AccessAttributes.ShowLive
        live "/access_attributes/:id/edit", AccessAttributes.FormLive, :edit

        live "/access_permissions", AccessPermissions.IndexLive
        live "/access_permissions/new", AccessPermissions.FormLive, :new
        live "/access_permissions/:id", AccessPermissions.ShowLive
        live "/access_permissions/:id/edit", AccessPermissions.FormLive, :edit

        live "/access_operations", AccessOperations.IndexLive
        live "/access_operations/new", AccessOperations.FormLive, :new
        live "/access_operations/:id", AccessOperations.ShowLive
        live "/access_operations/:id/edit", AccessOperations.FormLive, :edit

        ### Core Resources

        live "/aims", Aims.IndexLive
        live "/aims/new", Aims.FormLive, :new
        live "/aims/:id", Aims.ShowLive
        live "/aims/:id/edit", Aims.FormLive, :update

        live "/events", Events.IndexLive
        live "/events/new", Events.FormLive, :new
        live "/events/:id", Events.ShowLive
        live "/events/:id/edit", Events.FormLive, :update

        live "/event_reviews", EventReviews.IndexLive
        live "/event_reviews/new", EventReviews.FormLive, :new
        live "/event_reviews/:id", EventReviews.ShowLive
        live "/event_reviews/:id/edit", EventReviews.FormLive, :update

        live "/groups", Groups.IndexLive
        live "/groups/new", Groups.FormLive, :new
        live "/groups/:id", Groups.ShowLive
        live "/groups/:id/edit", Groups.FormLive, :update

        live "/messages", Messages.IndexLive
        live "/messages/new", Messages.FormLive, :new
        live "/messages/:id", Messages.ShowLive
        live "/messages/:id/edit", Messages.FormLive, :update

        live "/places", Places.IndexLive
        live "/places/new", Places.FormLive, :new
        live "/places/:id", Places.ShowLive
        live "/places/:id/edit", Places.FormLive, :update

        live "/place_reviews", PlaceReviews.IndexLive
        live "/place_reviews/new", PlaceReviews.FormLive, :new
        live "/place_reviews/:id", PlaceReviews.ShowLive
        live "/place_reviews/:id/edit", PlaceReviews.FormLive, :update

        live "/tasks", Tasks.IndexLive
        live "/tasks/new", Tasks.FormLive, :new
        live "/tasks/:id", Tasks.ShowLive
        live "/tasks/:id/edit", Tasks.FormLive, :update

        live "/topics", Topics.IndexLive
        live "/topics/new", Topics.FormLive, :new
        live "/topics/:id", Topics.ShowLive
        live "/topics/:id/edit", Topics.FormLive, :update

        live "/traits", Traits.IndexLive
        live "/traits/new", Traits.FormLive, :new
        live "/traits/:id", Traits.ShowLive
        live "/traits/:id/edit", Traits.FormLive, :update

        live "/users", Users.IndexLive
        live "/users/new", Users.FormLive, :new
        live "/users/:id", Users.ShowLive
        live "/users/:id/edit", Users.FormLive, :update

        live "/user_reviews", UserReviews.IndexLive
        live "/user_reviews/new", UserReviews.FormLive, :new
        live "/user_reviews/:id", UserReviews.ShowLive
        live "/user_reviews/:id/edit", UserReviews.FormLive, :update

        ### Read-Only Codes

        live "/ilo_isco_2008s", IloIsco2008s.IndexLive
        live "/ilo_isco_2008s/:id", IloIsco2008s.ShowLive

        live "/lumina_foundation_skill_levels", LuminaFoundationSkillLevels.IndexLive
        live "/lumina_foundation_skill_levels/:id", LuminaFoundationSkillLevels.ShowLive

        live "/uk_gdad_pcf_role_families", UkGdadPcfRoleFamilies.IndexLive
        live "/uk_gdad_pcf_role_families/:id", UkGdadPcfRoleFamilies.ShowLive

        live "/uk_gdad_pcf_roles", UkGdadPcfRoles.IndexLive
        live "/uk_gdad_pcf_roles/:id", UkGdadPcfRoles.ShowLive

        live "/uk_gdad_pcf_role_levels", UkGdadPcfRoleLevels.IndexLive
        live "/uk_gdad_pcf_role_levels/:id", UkGdadPcfRoleLevels.ShowLive

        live "/uk_gdad_pcf_skills", UkGdadPcfSkills.IndexLive
        live "/uk_gdad_pcf_skills/:id", UkGdadPcfSkills.ShowLive

        ### Links

        live "/user_group_links", UserGroupLinks.IndexLive
        live "/user_group_links/new", UserGroupLinks.FormLive, :new
        live "/user_group_links/:id", UserGroupLinks.ShowLive
        live "/user_group_links/:id/edit", UserGroupLinks.FormLive, :update

        live "/user_aim_links", UserAimLinks.IndexLive
        live "/user_aim_links/new", UserAimLinks.FormLive, :new
        live "/user_aim_links/:id", UserAimLinks.ShowLive
        live "/user_aim_links/:id/edit", UserAimLinks.FormLive, :update

        live "/user_topic_links", UserTopicLinks.IndexLive
        live "/user_topic_links/new", UserTopicLinks.FormLive, :new
        live "/user_topic_links/:id", UserTopicLinks.ShowLive
        live "/user_topic_links/:id/edit", UserTopicLinks.FormLive, :update

        live "/user_trait_links", UserTraitLinks.IndexLive
        live "/user_trait_links/new", UserTraitLinks.FormLive, :new
        live "/user_trait_links/:id", UserTraitLinks.ShowLive
        live "/user_trait_links/:id/edit", UserTraitLinks.FormLive, :update

        live "/user_ilo_isco_2008_links", UserIloIsco2008Links.IndexLive
        live "/user_ilo_isco_2008_links/new", UserIloIsco2008Links.FormLive, :new
        live "/user_ilo_isco_2008_links/:id", UserIloIsco2008Links.ShowLive
        live "/user_ilo_isco_2008_links/:id/edit", UserIloIsco2008Links.FormLive, :update

        live "/user_lumina_foundation_skill_level_links", UserLuminaFoundationSkillLevelLinks.IndexLive
        live "/user_lumina_foundation_skill_level_links/new", UserLuminaFoundationSkillLevelLinks.FormLive, :new
        live "/user_lumina_foundation_skill_level_links/:id", UserLuminaFoundationSkillLevelLinks.ShowLive
        live "/user_lumina_foundation_skill_level_links/:id/edit", UserLuminaFoundationSkillLevelLinks.FormLive, :update

        live "/user_uk_gdad_pcf_role_links", UserUkGdadPcfRoleLinks.IndexLive
        live "/user_uk_gdad_pcf_role_links/new", UserUkGdadPcfRoleLinks.FormLive, :new
        live "/user_uk_gdad_pcf_role_links/:id", UserUkGdadPcfRoleLinks.ShowLive
        live "/user_uk_gdad_pcf_role_links/:id/edit", UserUkGdadPcfRoleLinks.FormLive, :update

        live "/user_uk_gdad_pcf_skill_links", UserUkGdadPcfSkillLinks.IndexLive
        live "/user_uk_gdad_pcf_skill_links/new", UserUkGdadPcfSkillLinks.FormLive, :new
        live "/user_uk_gdad_pcf_skill_links/:id", UserUkGdadPcfSkillLinks.ShowLive
        live "/user_uk_gdad_pcf_skill_links/:id/edit", UserUkGdadPcfSkillLinks.FormLive, :update

      end

    ash_authentication_live_session :ash_authentication_live_session_routes do
      live_resources "/manage/topics", Backpex.TopicsLive
    end

  end

  scope "/api/json" do
    pipe_through [:api]

    forward "/swaggerui", OpenApiSpex.Plug.SwaggerUI,
      path: "/api/json/open_api",
      default_model_expand_depth: 4

    forward "/", NavatrackWeb.AshJsonApiRouter
  end

  scope "/gql" do
    pipe_through [:graphql]

    forward "/playground", Absinthe.Plug.GraphiQL,
      schema: Module.concat(["NavatrackWeb.GraphqlSchema"]),
      socket: Module.concat(["NavatrackWeb.GraphqlSocket"]),
      interface: :simple

    forward "/", Absinthe.Plug, schema: Module.concat(["NavatrackWeb.GraphqlSchema"])
  end

  # Other scopes may use custom stacks.
  # scope "/api", NavatrackWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:navatrack, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: NavatrackWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end

  if Application.compile_env(:navatrack, :dev_routes) do
    import AshAdmin.Router

    scope "/admin" do
      pipe_through :browser

      ash_admin "/"
    end
  end
end
