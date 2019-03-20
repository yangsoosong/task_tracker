defmodule TaskTracker.Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset


  schema "tasks" do
    field :complete, :boolean, default: false
    field :desc, :string
    field :name, :string
    belongs_to :user, TaskTracker.Users.User
    has_many :timeblocks, TaskTracker.Timeblocks.Timeblock

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:name, :desc, :time, :complete, :user_id])
    |> validate_required([:name, :desc])
  end
end
