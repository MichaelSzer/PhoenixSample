defmodule PhoenixSample.ManagerTest do
  use PhoenixSample.DataCase

  alias PhoenixSample.Manager

  describe "profiles" do
    alias PhoenixSample.Manager.Profile

    import PhoenixSample.ManagerFixtures

    @invalid_attrs %{handle_name: nil, social_media: nil, tags: nil}

    test "list_profiles/0 returns all profiles" do
      profile = profile_fixture()
      assert Manager.list_profiles() == [profile]
    end

    test "get_profile!/1 returns the profile with given id" do
      profile = profile_fixture()
      assert Manager.get_profile!(profile.id) == profile
    end

    test "create_profile/1 with valid data creates a profile" do
      valid_attrs = %{handle_name: "some handle_name", social_media: "some social_media", tags: "some tags"}

      assert {:ok, %Profile{} = profile} = Manager.create_profile(valid_attrs)
      assert profile.handle_name == "some handle_name"
      assert profile.social_media == "some social_media"
      assert profile.tags == "some tags"
    end

    test "create_profile/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Manager.create_profile(@invalid_attrs)
    end

    test "update_profile/2 with valid data updates the profile" do
      profile = profile_fixture()
      update_attrs = %{handle_name: "some updated handle_name", social_media: "some updated social_media", tags: "some updated tags"}

      assert {:ok, %Profile{} = profile} = Manager.update_profile(profile, update_attrs)
      assert profile.handle_name == "some updated handle_name"
      assert profile.social_media == "some updated social_media"
      assert profile.tags == "some updated tags"
    end

    test "update_profile/2 with invalid data returns error changeset" do
      profile = profile_fixture()
      assert {:error, %Ecto.Changeset{}} = Manager.update_profile(profile, @invalid_attrs)
      assert profile == Manager.get_profile!(profile.id)
    end

    test "delete_profile/1 deletes the profile" do
      profile = profile_fixture()
      assert {:ok, %Profile{}} = Manager.delete_profile(profile)
      assert_raise Ecto.NoResultsError, fn -> Manager.get_profile!(profile.id) end
    end

    test "change_profile/1 returns a profile changeset" do
      profile = profile_fixture()
      assert %Ecto.Changeset{} = Manager.change_profile(profile)
    end
  end

  describe "categories" do
    alias PhoenixSample.Manager.Category

    import PhoenixSample.ManagerFixtures

    @invalid_attrs %{title: nil}

    test "list_categories/0 returns all categories" do
      category = category_fixture()
      assert Manager.list_categories() == [category]
    end

    test "get_category!/1 returns the category with given id" do
      category = category_fixture()
      assert Manager.get_category!(category.id) == category
    end

    test "create_category/1 with valid data creates a category" do
      valid_attrs = %{title: "some title"}

      assert {:ok, %Category{} = category} = Manager.create_category(valid_attrs)
      assert category.title == "some title"
    end

    test "create_category/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Manager.create_category(@invalid_attrs)
    end

    test "update_category/2 with valid data updates the category" do
      category = category_fixture()
      update_attrs = %{title: "some updated title"}

      assert {:ok, %Category{} = category} = Manager.update_category(category, update_attrs)
      assert category.title == "some updated title"
    end

    test "update_category/2 with invalid data returns error changeset" do
      category = category_fixture()
      assert {:error, %Ecto.Changeset{}} = Manager.update_category(category, @invalid_attrs)
      assert category == Manager.get_category!(category.id)
    end

    test "delete_category/1 deletes the category" do
      category = category_fixture()
      assert {:ok, %Category{}} = Manager.delete_category(category)
      assert_raise Ecto.NoResultsError, fn -> Manager.get_category!(category.id) end
    end

    test "change_category/1 returns a category changeset" do
      category = category_fixture()
      assert %Ecto.Changeset{} = Manager.change_category(category)
    end
  end
end
