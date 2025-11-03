defmodule Navatrack.Works.Task do
  use Ash.Resource,
    otp_app: :navatrack,
    domain: Navatrack.Works,
    data_layer: AshPostgres.DataLayer,
    fragments: [
      Navatrack.Works.Task.Actions,
      Navatrack.Works.Task.Attributes,
    ]
  use Navatrack.Works.Task.Fab

  def snake_case_singular(), do: "task"
  def snake_case_plural(), do: "tasks"
  def title_case_singular(), do: "Task"
  def title_case_plural(), do: "Tasks"

  postgres do
    table "tasks"
    repo Navatrack.Repo
  end

  relationships do

    belongs_to :parent, __MODULE__, allow_nil?: true

    many_to_many :users, Navatrack.Accounts.User do
      through Navatrack.Accounts.UserTaskLink
      source_attribute_on_join_resource :task_id
      destination_attribute_on_join_resource :user_id
    end

  end

end
