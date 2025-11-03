defmodule Navatrack.Works.Place do
  use Ash.Resource,
    otp_app: :navatrack,
    domain: Navatrack.Works,
    data_layer: AshPostgres.DataLayer,
    fragments: [
      Navatrack.Works.Place.Actions,
      Navatrack.Works.Place.Attributes,
    ]
  use Navatrack.Works.Place.Fab

  def snake_case_singular(), do: "place"
  def snake_case_plural(), do: "places"
  def title_case_singular(), do: "Place"
  def title_case_plural(), do: "Places"

  postgres do
    table "places"
    repo Navatrack.Repo
  end

  relationships do
    belongs_to :parent, __MODULE__, allow_nil?: true
  end

end
