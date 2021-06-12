defmodule Blog.Schemas.Comment do
  @moduledoc """
  This module defines Schema for the Comment.
  """

  alias Blog.Schemas.Post

  import Ecto.Changeset

  use Ecto.Schema

  schema "comments" do
    field :content, :string
    field :name, :string

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
