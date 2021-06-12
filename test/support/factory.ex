defmodule Blog.Factory do
  @moduledoc """
  This module defines the factories use in tests.
  """

  # with Ecto
  use ExMachina.Ecto, repo: Blog.Repo

  def category_factory do
    %Blog.Content.Schemas.Category{
      name: "Animals World"
    }
  end

  def post_factory do
    title = sequence(:title, &"Use ExMachina! (Part #{&1})")
    # derived attribute
    %Blog.Content.Schemas.Post{
      title: title,
      body:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
    }
  end

  def comment_factory do
    %Blog.Content.Schemas.Comment{
      content: "It's great!",
      name: "Peter",
      post: build(:post)
    }
  end
end
