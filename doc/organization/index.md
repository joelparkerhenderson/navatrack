# Organization

<https://github.com/contactopensource/contactopensource/tree/master/api/organization>

We create a typical organization resource.

This is uses many flat fields i.e. not relations, because for this project we
prefer the simplest maintainability and leanest lookups.

Run:

```sh
mix ash.gen.domain Navatrack.Accounts
mix ash.gen.resource Navatrack.Accounts.Organization \
  --conflicts replace \
  --default-actions create,read,update,destroy \
  --extend postgres \
  --uuid-primary-key id \
  --attribute parent:id \
  --attribute name:string \
  --attribute status:string \
  --attribute tags:string:array \
  \
  --attribute url:string \
  --attribute email:string \
  --attribute phone:string \
  --attribute messaging:string \
  --attribute postal:string \
  --attribute orcid_pid:string \
  --attribute rdf_type:string \
  --attribute linkedin_url:string \
  --attribute github_url:string \
  --attribute codeberg_url:string \
  \
  --attribute location_iso_3166_1_alpha_2:string \
  --attribute location_iso_3166_2:string \
  --attribute location_postal_code:string \
  --attribute location_latitude_as_decimal_degrees:decimal \
  --attribute location_longitude_as_decimal_degrees:decimal \
  \
  --attribute note:string \
  --attribute daisyui_timeline_html:string \
  --attribute org_mode:string \
  --attribute task_list_as_markdown:string \
  --attribute ways_of_working_as_markdown:string \
  --attribute objectives_and_key_results_as_markdown:string \
  --attribute key_performance_indicators_as_markdown:string \
  --attribute agents_as_markdown:string \
  \
  --attribute avatar_image_400x400_url:string \
  --attribute avatar_image_400x400_alt:string \
  \
  --attribute main_main_image_1080x1080_url:string \
  --attribute main_main_image_1080x1080_alt:string \
  \
  --attribute main_main_image_1920x1080_url:string \
  --attribute main_main_image_1920x1080_alt:string \
  \
  --attribute main_main_image_1080x1920_url:string \
  --attribute main_main_image_1080x1920_alt:string \
  \
  --attribute gs1_digital_link:string \
  --attribute gs1_country_code:string \
  --attribute gs1_global_location_number:string \
  \
  --attribute isic_v4_code:string \
  --attribute isic_v4_name:string \
  \
  --attribute copyright_policy_as_url:string \
  --attribute copyright_policy_as_markdown:string \
  \
  --attribute corrections_policy_as_url:string \
  --attribute corrections_policy_as_markdown:string \
  \
  --attribute legal_policy_as_url:string \
  --attribute legal_policy_as_markdown:string \
  \
  --attribute ethics_policy_as_url:string \
  --attribute ethics_policy_as_markdown:string \
  \
  --attribute privacy_policy_as_url:string \
  --attribute privacy_policy_as_markdown:string \
  \
  --attribute security_policy_as_url:string \
  --attribute security_policy_as_markdown:string \
  \
  --attribute coordinated_disclosure_policy_as_url:string \
  --attribute coordinated_disclosure_policy_as_markdown:string \
  \
  --attribute open_source_policy_as_url:string \
  --attribute open_source_policy_as_markdown:string \
  \
  --attribute code_of_conduct_policy_as_url:string \
  --attribute code_of_conduct_policy_as_markdown:string \
  \
  --attribute equal_opportunity_policy_as_url:string \
  --attribute equal_opportunity_policy_as_markdown:string \
  \
  --attribute social_network_policy_as_url:string \
  --attribute social_network_policy_as_markdown:string \
  \
  --attribute health_and_safety_policy_as_url:string \
  --attribute health_and_safety_policy_as_markdown:string \
  \
  --attribute employee_handbook_policy_as_url:string \
  --attribute employee_handbook_policy_as_markdown:string \
  \
  --attribute human_resources_policy_as_url:string \
  --attribute human_resources_policy_as_markdown:string \
```

Run:

```sh
mix ash.codegen create_organizations
mix ash.migrate
```
