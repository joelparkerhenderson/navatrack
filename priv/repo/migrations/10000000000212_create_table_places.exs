defmodule Navatrack.Repo.Migrations.CreateTablePlaces do
  @moduledoc """
  Create table aims.
  """

  use Ecto.Migration

  def up do
    execute """
    CREATE TABLE places (
      --- meta
      id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
      created_at TIMESTAMP(6) WITH TIME ZONE DEFAULT (now() AT TIME ZONE 'utc'),
      updated_at TIMESTAMP(6) WITH TIME ZONE DEFAULT (now() AT TIME ZONE 'utc'),
      deleted_at TIMESTAMP(6) WITH TIME ZONE,
      locale_code text,
      parent_id uuid CONSTRAINT places_parent_id_fk REFERENCES places (id),
      parent_order int CONSTRAINT places_parent_order_check CHECK (parent_order >= 0),
      --- card
      name text,
      sign text CONSTRAINT places_sign_check CHECK (LENGTH(sign) = 1),
      status text,
      tagging text,
      note text,
      -- ai
      ai_agent_instructions_as_url text CONSTRAINT places_ai_agent_instructions_as_url CHECK (ai_agent_instructions_as_url ~* '^https://'),
      ai_agent_instructions_as_markdown text,
      --- contact
      web text CONSTRAINT places_web_check CHECK (web ~* '^https://'),
      email text CONSTRAINT places_email_check CHECK (email ~*  '.@.'),
      phone text,
      chat text,
      calendar text,
      postal text,
      rdf_type text,
      --- social
      bluesky_as_url text CONSTRAINT places_bluesky_as_url_check CHECK (bluesky_as_url ~* '^https://bsky\.app/'),
      codeberg_as_url text CONSTRAINT places_codeberg_as_url_check CHECK (codeberg_as_url ~* '^https://codeberg\.org/'),
      facebook_as_url text CONSTRAINT places_facebook_as_url_check CHECK (facebook_as_url ~* '^https://facebook\.com/'),
      github_as_url text CONSTRAINT places_github_as_url_check CHECK (github_as_url ~* '^https://github\.com/'),
      instagram_as_url text CONSTRAINT places_instagram_as_url_check CHECK (instagram_as_url ~* '^https://instagram\.com/'),
      linkedin_as_url text CONSTRAINT places_linkedin_as_url_check CHECK (linkedin_as_url ~* '^https://linkedin\.com/'),
      mastodon_as_url text CONSTRAINT places_mastodon_as_url_check CHECK (mastodon_as_url ~* '^https://'),
      orcid_as_url text CONSTRAINT places_orcid_as_url_check CHECK (orcid_as_url ~* '^https://orcid\.org/'),
      tiktok_as_url text CONSTRAINT places_tiktok_as_url_check CHECK (tiktok_as_url ~* '^https://tiktok\.com/'),
      wikipedia_as_url text CONSTRAINT places_wikipedia_uri_check CHECK (wikipedia_as_url ~* '^https://wikipedia\.org/'),
      youtube_as_url text CONSTRAINT places_youtube_as_url_check CHECK (youtube_as_url ~* '^https://youtube\.com/'),
      --- location
      location_iso_3166_1_alpha_2 char(2) CONSTRAINT places_location_iso_3166_1_alpha_2_check CHECK (location_iso_3166_1_alpha_2 ~* '^[a-z][a-z]$'),
      location_iso_3166_2 text,
      location_postal_code text,
      location_latitude_as_decimal_degrees numeric(9, 7) CONSTRAINT places_location_latitude_as_decimal_degrees_check CHECK (location_latitude_as_decimal_degrees BETWEEN -90.0 AND 90.0),
      location_longitude_as_decimal_degrees numeric(10, 7) CONSTRAINT places_location_longitude_as_decimal_degrees_check CHECK (location_longitude_as_decimal_degrees BETWEEN -180.0 AND 180.0),
      location_altitude_agl_as_meters numeric(5,0),
      location_altitude_msl_as_meters numeric(5,0),
      location_elevation_agl_as_meters numeric(5,0),
      location_elevation_msl_as_meters numeric(5,0),
      location_what3words text,
      location_whatfreewords text,
      --- images
      avatar_image_400x400_url text CONSTRAINT places_avatar_image_400x400_url_check CHECK (avatar_image_400x400_url ~* '^https://'),
      avatar_image_400x400_alt text,
      main_image_1080x1080_url text CONSTRAINT places_main_image_1080x1080_url_check CHECK (main_image_1080x1080_url ~* '^https://'),
      main_image_1080x1080_alt text,
      main_image_1920x1080_url text CONSTRAINT places_main_image_1920x1080_url_check CHECK (main_image_1920x1080_url ~* '^https://'),
      main_image_1920x1080_alt text,
      main_image_1080x1920_url text CONSTRAINT places_main_image_1080x1920_url_check CHECK (main_image_1080x1920_url ~* '^https://'),
      main_image_1080x1920_alt text
    );
    """

    execute """
    CREATE TRIGGER trigger_places_updated_at
      BEFORE UPDATE ON places
      FOR EACH ROW EXECUTE FUNCTION
      trigger_updated_at();
    """

    execute """
    CREATE INDEX places_index_gto
      ON places USING GIN ((
        sign
          || ' ' || name
          || ' ' || status
          || ' ' || tagging
          || ' ' || note
          || ' ' || ai_agent_instructions_as_markdown
          || ' ' || web
          || ' ' || email
          || ' ' || phone
          || ' ' || chat
          || ' ' || calendar
          || ' ' || postal
          || ' ' || rdf_type
          || ' ' || bluesky_as_url
          || ' ' || codeberg_as_url
          || ' ' || github_as_url
          || ' ' || instagram_as_url
          || ' ' || linkedin_as_url
          || ' ' || mastodon_as_url
          || ' ' || orcid_as_url
          || ' ' || tiktok_as_url
          || ' ' || wikipedia_as_url
          || ' ' || youtube_as_url
    ) gin_trgm_ops);
    """
    execute "CREATE INDEX places_created_at_index ON places (created_at);"
    execute "CREATE INDEX places_updated_at_index ON places (updated_at);"
    execute "CREATE INDEX places_deleted_at_index ON places (deleted_at);"
    execute "CREATE INDEX places_locale_code_index ON places (locale_code);"
    execute "CREATE INDEX places_name_index ON places (name);"
    execute "CREATE INDEX places_name_index_tpo ON places (name text_pattern_ops);"
    execute "CREATE INDEX places_tagging_index ON places (tagging);"
    execute "CREATE INDEX places_tagging_index_tpo ON places (tagging text_pattern_ops);"
    execute "CREATE INDEX places_location_iso_3166_1_alpha_2_index on places (location_iso_3166_1_alpha_2 );"
    execute "CREATE INDEX places_location_iso_3166_2_index on places (location_iso_3166_2);"
    execute "CREATE INDEX places_location_postal_code_index on places (location_postal_code);"
    execute "CREATE INDEX places_location_latitude_as_decimal_degrees_index on places (location_latitude_as_decimal_degrees);"
    execute "CREATE INDEX places_location_longitude_as_decimal_degrees_index on places (location_longitude_as_decimal_degrees);"
    execute "CREATE INDEX places_location_altitude_agl_as_meters_index on places (location_altitude_agl_as_meters);"
    execute "CREATE INDEX places_location_altitude_msl_as_meters_index on places (location_altitude_msl_as_meters);"
    execute "CREATE INDEX places_location_elevation_agl_as_meters_index on places (location_elevation_agl_as_meters);"
    execute "CREATE INDEX places_location_elevation_msl_as_meters_index on places (location_elevation_msl_as_meters);"
  end

  def down do
    execute "DROP CONSTRAINT IF EXISTS places_parent_id_fk;"
    execute "DROP CONSTRAINT IF EXISTS places_parent_order_check;"
    execute "DROP CONSTRAINT IF EXISTS places_sign_check;"
    execute "DROP CONSTRAINT IF EXISTS places_ai_agent_instructions_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS places_web_check;"
    execute "DROP CONSTRAINT IF EXISTS places_email_check;"
    execute "DROP CONSTRAINT IF EXISTS places_bluesky_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS places_codeberg_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS places_facebook_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS places_github_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS places_instagram_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS places_linkedin_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS places_mastodon_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS places_orcid_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS places_tiktok_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS places_wikipedia_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS places_youtube_as_url_check;"
    execute "DROP CONSTRAINT IF EXISTS places_avatar_image_400x400_url_check;"
    execute "DROP CONSTRAINT IF EXISTS places_main_image_1080x1080_url_check;"
    execute "DROP CONSTRAINT IF EXISTS places_main_image_1920x1080_url_check;"
    execute "DROP CONSTRAINT IF EXISTS places_main_image_1080x1920_url_check;"
    execute "DROP TABLE IF EXISTS places;"
  end
end
