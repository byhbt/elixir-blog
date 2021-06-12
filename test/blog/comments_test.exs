defmodule Blog.CommentsTest do
  use Blog.DataCase, async: true

  alias Blog.Comments
  alias Blog.Schemas.Comment

  import Blog.Factory

  describe "comments" do
    test "list_comments/0 returns all comments" do
      %{id: comment_id} = insert(:comment)
      assert [%Comment{id: ^comment_id}] = Comments.list_comments()
    end

    test "get_comment!/1 returns the comment with given id" do
      %{id: comment_id} = comment = insert(:comment)
      assert %Comment{id: ^comment_id} = Comments.get_comment!(comment.id)
    end

    test "create_comment/1 with valid data creates a comment" do
      post = insert(:post)
      comment_params = params_with_assocs(:comment, post: post)

      {:ok, %Comment{} = comment} = Comments.create_comment(comment_params)
      assert comment.content == comment_params.content
      assert comment.name == comment_params.name
    end

    test "create_comment/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Comments.create_comment(%{content: nil, name: nil})
    end

    test "update_comment/2 with valid data updates the comment" do
      comment = insert(:comment)

      assert {:ok, %Comment{} = comment} =
               Comments.update_comment(comment, %{
                 content: "some updated content",
                 name: "some updated name"
               })

      assert comment.content == "some updated content"
      assert comment.name == "some updated name"
    end

    test "update_comment/2 with invalid data returns error changeset" do
      comment = %{id: comment_id} = insert(:comment)

      assert {:error, %Ecto.Changeset{}} =
               Comments.update_comment(comment, %{content: nil, name: nil})

      assert %{id: _comment_id} = Comments.get_comment!(comment_id)
    end

    test "delete_comment/1 deletes the comment" do
      comment = insert(:comment)
      assert {:ok, %Comment{}} = Comments.delete_comment(comment)
      assert_raise Ecto.NoResultsError, fn -> Comments.get_comment!(comment.id) end
    end

    test "change_comment/1 returns a comment changeset" do
      comment = insert(:comment)
      assert %Ecto.Changeset{} = Comments.change_comment(comment)
    end
  end
end
