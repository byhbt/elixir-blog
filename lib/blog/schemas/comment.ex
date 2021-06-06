defmodule Blog.Schemas.Comment do
  use Ecto.Schema

  alias Blog.Schemas.Post

  import Ecto.Changeset

  schema "comments" do
    field :content, :string
    field :name, :string

    # field :post_id, :id
    belongs_to(:post, Post)

    timestamps()
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:name, :content, :post_id])
    |> validate_required([:name, :content, :post_id])
  end
end
