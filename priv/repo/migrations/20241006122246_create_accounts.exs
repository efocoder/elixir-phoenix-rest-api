defmodule RealDealApi.Repo.Migrations.CreateAccounts do
  use Ecto.Migration

  def change do
    create table(:accounts, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :email, :string, null: false
      add :hash_password, :string, null: false

      timestamps(type: :utc_datetime)
    end

    create unique_index(:accounts, [:email])
  end
end
