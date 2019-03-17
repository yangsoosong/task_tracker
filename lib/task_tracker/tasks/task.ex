defmodule TaskTracker.Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset


  schema "tasks" do
    field :complete, :boolean, default: false
    field :desc, :string
    field :name, :string
    field :time, :decimal
    belongs_to :user, TaskTracker.Users.User

    timestamps()
  end

#  def validate_posTime(changeset, field, _options) do
#    validate_change(changeset, field, fn_, time ->
#      cond do
#        time >= 0 ->
#          return 0
#        true ->
#          return [{field, "Must Be Positive"}]
#      end
#    end)
#  end
  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:name, :desc, :time, :complete, :user_id])
    |> validate_required([:name, :desc])
#    |> validate_posTime(:time)
  end
end
