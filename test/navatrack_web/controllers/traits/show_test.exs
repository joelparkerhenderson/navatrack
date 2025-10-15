defmodule NavatrackWeb.Traits.ShowTest do
  # import Phoenix.LiveViewTest
  use NavatrackWeb.ConnCase
  use NavatrackWeb.AuthCase
  alias Navatrack.Works.Trait, as: X

  defp x! do
    X
      |> Ash.Changeset.for_create(:create, %{
        locale_code: "en-US",
        name: "my-name",
        sign: "○",
        status: "my-status",
        tagging: "my-tagging",
        note: "my-note",
        summary_as_markdown: "summary-as-markdown",
        description_as_markdown: "description-as-markdown",
        avatar_image_400x400_url: "https://my-avatar-image-400x400-url",
        avatar_image_400x400_alt: "my-avatar-image-400x400-alt",
        main_image_1080x1080_url: "https://my-main-image-1080x1080-url",
        main_image_1080x1080_alt: "my-main-image-1080x1080-alt",
        main_image_1920x1080_url: "https://my-main-image-1920x1080-url",
        main_image_1920x1080_alt: "my-main-image-1920x1080-alt",
        main_image_1080x1920_url: "https://my-main-image-1080x1920-url",
        main_image_1080x1920_alt: "my-main-image-1080x1920-alt",
      })
    |> Ash.create!()
  end

  setup %{conn: conn} do
    {:ok, user} = my_user()
    {:ok, user} = my_sign_in(user)
    conn =
      conn
      |> Phoenix.ConnTest.init_test_session(%{})
      |> AshAuthentication.Plug.Helpers.store_in_session(user)

    {:ok, conn: conn}
  end

  test "show", %{conn: conn} do
    x = x!()
    conn = get(conn, ~p"/traits/#{x.id}")
    response = html_response(conn, 200)

    assert response =~ "Traits"

    assert response =~ "Id: #{x.id}"
    # assert response =~ "Created at: #{x.created_at}"
    # assert response =~ "Updated at: #{x.updated_at}"
    # assert response =~ "Deleted at: #{x.deleted_at}"
    assert response =~ "Locale code: #{x.locale_code}"
    assert response =~ "📛 Name: #{x.name}"
    assert response =~ "🚦 Sign: #{x.sign}"
    assert response =~ "📍 Status: #{x.status}"
    assert response =~ "🏷️ Tags: #{x.tagging}"

    assert response =~ "About"

    assert response =~ "Summary: #{x.summary_as_markdown}"
    assert response =~ "Description: #{x.description_as_markdown}"

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
