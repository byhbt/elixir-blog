defmodule Blog.Repo.Migrations.AddCategoryIdToPostsTable do
  use Ecto.Migration

  def change do
    alter table(:posts) do
      add :category_id, references(:posts, on_delete: :nothing)
    end
  end
end
