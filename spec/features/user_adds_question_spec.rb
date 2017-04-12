require "rails_helper"

feature "User submits a new question" do

  scenario "user goes to new question page" do
    visit new_question_path

    fill_in "Title", with: "Something about 40 characters long, which this is now"
    fill_in "Description", with: "This needs to be a whole lot longer. Something or other and blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah"
    click_button "Submit"

    expect(page).to have_content("Something about 40 characters long, which this is now")
    expect(page).to have_content("This needs to be a whole lot longer. Something or other")
  end

  scenario "user gets error messages for improperly filled out form" do
    visit new_question_path

    fill_in "Title", with: "Short"
    fill_in "Description", with: "This needs to be a whole lot longer."
    click_button "Submit"

    expect(page).to have_content("Title is too short")
    expect(page).to have_content("Description is too short")
    expect(find_field("Title").value).to have_content("Short")
    expect(find_field("Description").value).to have_content("This needs to be a whole lot longer")
  end

end
