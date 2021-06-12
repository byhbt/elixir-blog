defmodule Blog.Content.PostsTest do
  use Blog.DataCase, async: true

  alias Blog.Content.Posts
  alias Blog.Content.Schemas.Post

  import Blog.Factory

  describe "posts" do
    test "list_posts/0 returns all posts" do
      post = insert(:post)
      assert Posts.list_posts() == [post]
    end

    test "get_post!/1 returns the post with given id" do
      post = insert(:post)
      assert Posts.get_post!(post.id) == post
    end

    test "create_post/1 with valid data creates a post" do
      post = insert(:post, %{body: "some body", title: "some title"})
      assert post.body == "some body"
      assert post.title == "some title"
    end

    test "create_post/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Posts.create_post(%{body: nil, title: nil})
    end

    test "update_post/2 with valid data updates the post" do
      post = insert(:post)

      {:ok, %Post{} = post} =
        Posts.update_post(post, %{body: "some updated body", title: "some updated title"})

      assert post.body == "some updated body"
      assert post.title == "some updated title"
    end

    test "update_post/2 with invalid data returns error changeset" do
      post = insert(:post)
      assert {:error, %Ecto.Changeset{}} = Posts.update_post(post, %{body: nil, title: nil})
      assert post == Posts.get_post!(post.id)
    end

    test "delete_post/1 deletes the post" do
      post = insert(:post)
      assert {:ok, %Post{}} = Posts.delete_post(post)
      assert_raise Ecto.NoResultsError, fn -> Posts.get_post!(post.id) end
    end

    test "change_post/1 returns a post changeset" do
      post = insert(:post)
      assert %Ecto.Changeset{} = Posts.change_post(post)
    end
  end
end
