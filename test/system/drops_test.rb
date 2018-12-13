require "application_system_test_case"

class DropsTest < ApplicationSystemTestCase
  setup do
    @drop = drops(:one)
  end

  test "visiting the index" do
    visit drops_url
    assert_selector "h1", text: "Drops"
  end

  test "creating a Drop" do
    visit drops_url
    click_on "New Drop"

    fill_in "Description", with: @drop.description
    fill_in "Title", with: @drop.title
    click_on "Create Drop"

    assert_text "Drop was successfully created"
    click_on "Back"
  end

  test "updating a Drop" do
    visit drops_url
    click_on "Edit", match: :first

    fill_in "Description", with: @drop.description
    fill_in "Title", with: @drop.title
    click_on "Update Drop"

    assert_text "Drop was successfully updated"
    click_on "Back"
  end

  test "destroying a Drop" do
    visit drops_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Drop was successfully destroyed"
  end
end
