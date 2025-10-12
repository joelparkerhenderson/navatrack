defmodule Navatrack.Works do
  use Ash.Domain,
    otp_app: :navatrack

  resources do
    resource Navatrack.Works.Topic
    resource Navatrack.Works.Trait
  end
end
