require "rails_helper"

feature "User submits an answer to a question" do
  let!(:question_one) { Question.create(
    title: "Title goes here and making it long enough because yeah",
    description: "This is some kind of a description for the first question, it needs to be rather long which is frustrating when making random examples. So yes, this is going on even longer for no other reason.") }

  scenario "user goes to question details page to submit an answer" do
    visit question_path(question_one)

    expect(page).to have_content("Add An Answer")
    expect(find_field("Your Answer").value).to have_content("")
    find_button('Submit').click
  end

  scenario "user successfully submits an answer to a question!" do
    visit question_path(question_one)

    fill_in "Your Answer", with: "puppies pupppies puppies pupppies puppies pupppies puppies pupppies puppies pupppies puppies pupppies puppies pupppies puppies pupppies puppies pupppies puppies pupppies puppies pupppies puppies pupppies "
    click_button "Submit"

    expect(page).to have_content("puppies pupppies puppies pupppies puppies pupppies puppies")
    expect(page).to have_content("Title goes here and making it long enough because yeah")
    expect(page).to have_content("some kind of a description for the first question, ")
  end

  scenario "user fails to submits an answer to a question and gets errors" do
    visit question_path(question_one)

    fill_in "Your Answer", with: "too little puppies"
    click_button "Submit"

    expect(find_field("Your Answer").value).to have_content("too little puppies")
    expect(page).to have_content("Body is too short")
    expect(page).to have_content("some kind of a description for the first question, ")
  end

end
