require "rails_helper"

feature "User sees a list of answers on a question details page" do
  let!(:question_one) { Question.create(
    title: "Title goes here and making it long enough because yeah",
    description: "This is some kind of a description for the first question, it needs to be rather long which is frustrating when making random examples. So yes, this is going on even longer for no other reason.") }

  let!(:answer_one) { Answer.create(
    body: "Kitties! kitties kitties kitties kitties kitties kitties kitties kitties kitties kitties kitties kitties kitties kitties kitties kitties kitties kitties kitties kitties kitties kitties kitties kitties kitties kitties",
    question: question_one
    )}

  scenario "user can go to question details page and see the a list of answers for that question" do
    visit "/"

    click_link question_one.title

    expect(page).to have_content(answer_one.body)
  end

end
