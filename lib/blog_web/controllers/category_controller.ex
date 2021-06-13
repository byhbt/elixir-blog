defmodule BlogWeb.CategoryController do
  use BlogWeb, :controller

  alias Blog.Content.Categories
  alias Blog.Content.Posts
  alias Blog.Content.Schemas.Post
  alias Blog.Repo

  def show(conn, params) do
    category = Categories.get_category!(params["id"])
    posts = Posts.get_by_category(category)

    render(conn, "show.html", category: category, posts: posts)
  end
end
