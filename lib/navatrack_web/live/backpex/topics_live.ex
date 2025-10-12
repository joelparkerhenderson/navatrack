defmodule NavatrackWeb.Backpex.TopicsLive do
  use AshBackpex.LiveResource

  backpex do
    resource Navatrack.Works.Topic
    layout(&NavatrackWeb.Layouts.backpex/1)

    fields do
      field :name
    end
  end
end
