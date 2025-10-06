defmodule NavatrackWeb.Backpex.InitiativesLive do
  use AshBackpex.LiveResource

  backpex do
    resource Navatrack.Accounts.User
    layout(&NavatrackWeb.Layouts.backpex/1)

    fields do
      field :name
    end
  end
end
