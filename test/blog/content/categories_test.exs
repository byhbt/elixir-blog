defmodule Blog.Content.CategoriesTest do
  use Blog.DataCase

  alias Blog.Content.Categories
  alias Blog.Content.Schemas.Category

  import Blog.Factory

  describe "categories" do
    test "list_categories/0 returns all categories" do
      category = insert(:category)
      assert Categories.list_categories() == [category]
    end

    test "get_category!/1 returns the category with given id" do
      category = insert(:category)
      assert Categories.get_category!(category.id) == category
    end

    test "create_category/1 with valid data creates a category" do
      category = insert(:category, %{name: "some name"})
      assert category.name == "some name"
    end

    test "create_category/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Categories.create_category(%{name: nil})
    end

    test "update_category/2 with valid data updates the category" do
      category = insert(:category, %{name: "some name"})

      {:ok, %Blog.Content.Schemas.Category{} = category} =
        Categories.update_category(category, %{name: "some updated name"})

      assert category.name == "some updated name"
    end

    test "update_category/2 with invalid data returns error changeset" do
      category = insert(:category)
      assert {:error, %Ecto.Changeset{}} = Categories.update_category(category, %{name: nil})
      assert category == Categories.get_category!(category.id)
    end

    test "delete_category/1 deletes the category" do
      category = insert(:category)
      assert {:ok, %Category{}} = Categories.delete_category(category)
      assert_raise Ecto.NoResultsError, fn -> Categories.get_category!(category.id) end
    end

    test "change_category/1 returns a category changeset" do
      category = insert(:category)
      assert %Ecto.Changeset{} = Categories.change_category(category)
    end
  end
end
