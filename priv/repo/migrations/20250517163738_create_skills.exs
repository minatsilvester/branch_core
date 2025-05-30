defmodule BranchCore.Repo.Migrations.CreateSkills do
  use Ecto.Migration

  def change do
    create table(:skills) do
      add :name, :string
      add :type, :string
      add :color, :string

      timestamps(type: :utc_datetime)
    end

    create unique_index(:skills, [:name])
  end
end
