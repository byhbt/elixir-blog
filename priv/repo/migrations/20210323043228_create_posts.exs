defmodule Blog.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string
      add :body, :text
      add :post_id, references(:categories, on_delete: :nothing)

      timestamps()
    end
  end
end
