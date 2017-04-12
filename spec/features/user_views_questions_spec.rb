require "rails_helper"

feature "User sees a list of questions on the index page" do
  let!(:question_one) { Question.create(
    title: "Title goes here and making it long enough because yeah",
    description: "This is some kind of a description for the first question, it needs to be rather long which is frustrating when making random examples. So yes, this is going on even longer for no other reason.") }
  let!(:question_two) { Question.create(
    title: "Puppies puppies puppies puppies puppies puppies puppies puppies puppies puppies puppies puppies puppies puppies",
    description: "Kitties kitties kitties kitties kitties kitties kitties kitties kitties kitties kitties kitties kitties kitties kitties kitties kitties kitties kitties kitties kitties kitties"
    ) }

  scenario "user goes to index and sees list of questions" do
    visit "/"
    expect(page).to have_content("Title goes here and making")
    expect(page).to have_content(question_two.title)
  end

  scenario "user can go to question details page and see the title and description for a specific question" do
    visit "/"

    click_link question_one.title

    expect(page).to have_content(question_one.title)
    expect(page).to have_content(question_one.description)
  end

end
