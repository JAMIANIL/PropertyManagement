require "application_system_test_case"

class AgentsTest < ApplicationSystemTestCase
  setup do
    @agent = agents(:one)
  end

  test "visiting the index" do
    visit agents_url
    assert_selector "h1", text: "Agents"
  end

  test "creating a Agent" do
    visit agents_url
    click_on "New Agent"

    fill_in "Company", with: @agent.company_id
    fill_in "First name", with: @agent.first_name
    fill_in "Last name", with: @agent.last_name
    fill_in "Role", with: @agent.role
    click_on "Create Agent"

    assert_text "Agent was successfully created"
    click_on "Back"
  end

  test "updating a Agent" do
    visit agents_url
    click_on "Edit", match: :first

    fill_in "Company", with: @agent.company_id
    fill_in "First name", with: @agent.first_name
    fill_in "Last name", with: @agent.last_name
    fill_in "Role", with: @agent.role
    click_on "Update Agent"

    assert_text "Agent was successfully updated"
    click_on "Back"
  end

  test "destroying a Agent" do
    visit agents_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Agent was successfully destroyed"
  end
end