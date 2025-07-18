require "application_system_test_case"

class EnvelopesTest < ApplicationSystemTestCase
  setup do
    @envelope = envelopes(:one)
  end

  test "visiting the index" do
    visit envelopes_url
    assert_selector "h1", text: "Envelopes"
  end

  test "should create envelope" do
    visit envelopes_url
    click_on "New envelope"

    fill_in "Amount", with: @envelope.amount
    fill_in "Name", with: @envelope.name
    click_on "Create Envelope"

    assert_text "Envelope was successfully created"
    click_on "Back"
  end

  test "should update Envelope" do
    visit envelope_url(@envelope)
    click_on "Edit this envelope", match: :first

    fill_in "Amount", with: @envelope.amount
    fill_in "Name", with: @envelope.name
    click_on "Update Envelope"

    assert_text "Envelope was successfully updated"
    click_on "Back"
  end

  test "should destroy Envelope" do
    visit envelope_url(@envelope)
    click_on "Destroy this envelope", match: :first

    assert_text "Envelope was successfully destroyed"
  end
end
