defmodule Blog.Factory do
  # with Ecto
  use ExMachina.Ecto, repo: Blog.Repo

  def post_factory do
    title = sequence(:title, &"Use ExMachina! (Part #{&1})")
    # derived attribute
    %Blog.Schemas.Post{
      title: title,
      body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
    }
  end

  def comment_factory do
    %Blog.Schemas.Comment{
      content: "It's great!",
      name: "Peter",
      post: build(:post)
    }
  end
end