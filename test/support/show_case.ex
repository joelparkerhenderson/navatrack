defmodule NavatrackWeb.ShowCase do
  @moduledoc """
  This module provides test helpers for our conventions in "show_test.exs".
  """

  use ExUnit.CaseTemplate

  using do
    quote do

      def assert_meta(response, x) do
        assert response =~ "Id: #{x.id}"
        # assert response =~ "Created at: #{x.created_at}"
        # assert response =~ "Updated at: #{x.updated_at}"
        # assert response =~ "Deleted at: #{x.deleted_at}"
        assert response =~ "Locale code: #{x.locale_code}"
      end

      def assert_lede(response, x) do
        assert response =~ "📛 Name: #{x.name}"
        assert response =~ "🚦 Sign: #{x.sign}"
        assert response =~ "📍 Status: #{x.status}"
        assert response =~ "🏷️ Tags: #{x.tagging}"
        assert response =~ "🗒️ Note: #{x.note}"
      end

      def assert_contacts(response, x) do
        assert response =~ "Contacts"
        assert response =~ "🌐 Web: #{x.web}"
        assert response =~ "📧 Email: #{x.email}"
        assert response =~ "📱 Phone: #{x.phone}"
        assert response =~ "💬 Chat: #{x.chat}"
        assert response =~ "🗓️ Calendar: #{x.calendar}"
        assert response =~ "📫 Postal: #{x.postal}"
        assert response =~ "🖇️ RDF Type: #{x.rdf_type}"
      end

      def assert_socials(response, x) do
        assert response =~ "Socials"
        assert response =~ "Bluesky URL: <a href=\"#{x.bluesky_as_url}\">#{x.bluesky_as_url}</a>"
        assert response =~ "Codeberg URL: <a href=\"#{x.codeberg_as_url}\">#{x.codeberg_as_url}</a>"
        assert response =~ "GitHub URL: <a href=\"#{x.github_as_url}\">#{x.github_as_url}</a>"
        assert response =~ "Facebook URL: <a href=\"#{x.facebook_as_url}\">#{x.facebook_as_url}</a>"
        assert response =~ "Instagram URL: <a href=\"#{x.instagram_as_url}\">#{x.instagram_as_url}</a>"
        assert response =~ "LinkedIn URL: <a href=\"#{x.linkedin_as_url}\">#{x.linkedin_as_url}</a>"
        assert response =~ "Mastodon URL: <a href=\"#{x.mastodon_as_url}\">#{x.mastodon_as_url}</a>"
        assert response =~ "ORCID URL: <a href=\"#{x.orcid_as_url}\">#{x.orcid_as_url}</a>"
        assert response =~ "TikTok URL: <a href=\"#{x.tiktok_as_url}\">#{x.tiktok_as_url}</a>"
        assert response =~ "Wikipedia URL: <a href=\"#{x.wikipedia_as_url}\">#{x.wikipedia_as_url}</a>"
        assert response =~ "YouTube URL: <a href=\"#{x.youtube_as_url}\">#{x.youtube_as_url}</a>"
      end

      def assert_images(response, x) do
        assert response =~ "Images"
        assert response =~ "Avatar image 400x400"
        assert response =~ "URL: <a href=\"#{x.avatar_image_400x400_url}\">#{x.avatar_image_400x400_url}</a>"
        assert response =~ "Alt: #{x.avatar_image_400x400_alt}"
        assert response =~ "Main image 1080x1080 square"
        assert response =~ "URL: <a href=\"#{x.main_image_1080x1080_url}\">#{x.main_image_1080x1080_url}</a>"
        assert response =~ "Alt: #{x.main_image_1080x1080_alt}"
        assert response =~ "Main image 1920x1080 landscape"
        assert response =~ "URL: <a href=\"#{x.main_image_1920x1080_url}\">#{x.main_image_1920x1080_url}</a>"
        assert response =~ "Alt: #{x.main_image_1920x1080_alt}"
        assert response =~ "Main image 1080x1920 portrait"
        assert response =~ "URL: <a href=\"#{x.main_image_1080x1920_url}\">#{x.main_image_1080x1920_url}</a>"
        assert response =~ "Alt: #{x.main_image_1080x1920_alt}"
      end

    end
  end

end
