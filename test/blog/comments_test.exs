defmodule Blog.CommentsTest do
  use Blog.DataCase, async: true

  alias Blog.Comments
  alias Blog.Schemas.Comment

  import Blog.Factory

  describe "comments" do
    # @valid_attrs %{content: "some content", name: "some name"}
    @update_attrs %{content: "some updated content", name: "some updated name"}
    @invalid_attrs %{content: nil, name: nil}

    test "list_comments/0 returns all comments" do
      %{id: comment_id} = insert(:comment)
      assert [%Comment{id: ^comment_id}] = Comments.list_comments()
    end

    test "get_comment!/1 returns the comment with given id" do
      %{id: comment_id} = comment = insert(:comment)
      assert %Comment{id: ^comment_id} = Comments.get_comment!(comment.id)
    end

    # test "create_comment/1 with valid data creates a comment" do
    #   post = insert(:post)
    #   # comment_params = build(:comment, post: post)

    #   comment_params = %Comment{
    #     content: "some content", 
    #     name: "some name",
    #     post_id: post.id,
    #   }

    #   comment = Comments.create_comment(comment_params)
    #   # assert {:ok, %Comment{} = comment} = Comments.create_comment(comment_params)
    #   assert comment.content == "some content"
    #   assert comment.name == "some name"
    # end

    test "create_comment/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Comments.create_comment(@invalid_attrs)
    end

    test "update_comment/2 with valid data updates the comment" do
      comment = insert(:comment)
      assert {:ok, %Comment{} = comment} = Comments.update_comment(comment, @update_attrs)
      assert comment.content == "some updated content"
      assert comment.name == "some updated name"
    end

    test "update_comment/2 with invalid data returns error changeset" do
      comment = %{id: comment_id} = insert(:comment)
      assert {:error, %Ecto.Changeset{}} = Comments.update_comment(comment, @invalid_attrs)
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