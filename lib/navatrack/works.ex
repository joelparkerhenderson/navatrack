defmodule Navatrack.Works do
  use Ash.Domain,
    otp_app: :navatrack,
    extensions: [AshAdmin.Domain]

  # AshAdmin
  admin do
    show? true
  end

  resources do
    resource Navatrack.Works.Event
    resource Navatrack.Works.Group
    resource Navatrack.Works.Aim
    resource Navatrack.Works.Task
    resource Navatrack.Works.Topic
    resource Navatrack.Works.Trait
    resource Navatrack.Works.Message
    resource Navatrack.Works.MultiRaterFeedbackMessage
    resource Navatrack.Works.Place
  end
end
