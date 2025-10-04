defmodule Navatrack.Accounts do
  use Ash.Domain,
    otp_app: :navatrack

  resources do
    resource Navatrack.Accounts.Token
    resource Navatrack.Accounts.User
    resource Navatrack.Accounts.Group
  end
end
