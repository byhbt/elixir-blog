defmodule Blog.Content.Schemas.Post do
  @moduledoc """
  This module defines Schema for the Post.
  """

  use Ecto.Schema

  import Ecto.Changeset

  alias Blog.Content.Schemas.Comment

  schema "posts" do
    field :body, :string
    field :title, :string

    belongs_to(:category, Category)
    has_many :comments, Comment

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :body])
    |> validate_required([:title, :body])
  end
end
