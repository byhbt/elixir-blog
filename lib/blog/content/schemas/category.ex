defmodule Blog.Content.Schemas.Category do
  @moduledoc """
  This module defines Schema for the Category.
  """

  import Ecto.Changeset

  use Ecto.Schema

  schema "categories" do
    field :name, :string

    has_many :posts, Post

    timestamps()
  end

  @doc false
  def changeset(category, attrs) do
    category
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
