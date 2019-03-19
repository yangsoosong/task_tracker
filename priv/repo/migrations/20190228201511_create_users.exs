defmodule TaskTracker.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :manager_id, references(:users, on_delete: :delete_all)

      timestamps()
    end

  end
end
