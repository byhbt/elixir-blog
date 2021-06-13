defmodule Blog.Content.Posts do
  @moduledoc """
  The Posts context.
  """

  import Ecto.Query, warn: false

  alias Blog.Content.Comments
  alias Blog.Content.Posts
  alias Blog.Content.Schemas.Post
  alias Blog.Repo

  def list_posts do
    Repo.all(Post)
  end

  def get_post!(id), do: Repo.get!(Post, id)

  def get_by_category(category) do
    query =
      from(p in Post,
        where: p.category_id == ^category.id
      )

    Repo.all(query)
  end

  def create_post(attrs \\ %{}) do
    %Post{}
    |> Post.changeset(attrs)
    |> Repo.insert()
  end

  def update_post(%Post{} = post, attrs) do
    post
    |> Post.changeset(attrs)
    |> Repo.update()
  end

  def delete_post(%Post{} = post) do
    Repo.delete(post)
  end

  def change_post(%Post{} = post, attrs \\ %{}) do
    Post.changeset(post, attrs)
  end

  def add_comment(post_id, comment_params) do
    comment_params
    |> Map.put("post_id", post_id)
    |> Comments.create_comment()
  end

  def get_number_of_comments(post_id) do
    post =
      Posts.get_post!(post_id)
      |> Repo.preload([:comments])

    Enum.count(post.comments)
  end
end
