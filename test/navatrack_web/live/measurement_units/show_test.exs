defmodule NavatrackWeb.MeasurementUnits.ShowTest do
  # import Phoenix.LiveViewTest
  use NavatrackWeb.ConnCase
  use NavatrackWeb.AuthCase
  alias Navatrack.Codes.MeasurementUnit, as: X

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
    x = X.one()
    conn = get(conn, ~p"/measurement_units/#{x.id}")
    response = html_response(conn, 200)

    assert response =~ "Id: #{x.id}"
    assert response =~ "Locale code: #{x.locale_code}"
    assert response =~ "Name: #{x.name}"
    assert response =~ "Name phonetic: #{x.name_phonetic}"
    assert response =~ "Category: #{x.category}"
    assert response =~ "Synonyms: #{x.synonyms}"
    assert response =~ "LOINC property: #{x.loinc_property}"
    assert response =~ "Guidance: #{x.guidance}"
    assert response =~ "Measurement system id: #{x.measurement_system_id}"
  end

end
