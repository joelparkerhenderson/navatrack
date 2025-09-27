defmodule NavatrackWeb.Backpex.InitiativesLive do
    use AshBackpex.LiveResource

    backpex do
      resource(Navatrack.Works.Initiative)
      layout({NavatrackWeb.Layouts, :backpex})

      fields do
        field :name
        field :note
      end
    end
end
