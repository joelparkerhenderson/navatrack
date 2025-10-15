defmodule Navatrack.Works do
  use Ash.Domain,
    otp_app: :navatrack

  resources do
    resource Navatrack.Works.Event
    resource Navatrack.Works.Group
    resource Navatrack.Works.Plan
    resource Navatrack.Works.Task
    resource Navatrack.Works.Topic
    resource Navatrack.Works.Trait
  end
end
