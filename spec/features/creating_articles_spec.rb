require 'spec_helper'

feature 'Creating articles' do
  let(:user) { FactoryGirl.create(:user) }
  let!(:category) { FactoryGirl.create(:category, :name => "Movies") }

  before :each do
    sign_in_as(user)

    visit new_article_path
  end

  scenario 'As an Author I want to be able to post an Article' do
    fill_in "article_title", :with => "My Title"
    fill_in "article_content", :with => "My Content"
    find("#article_category_ids_[value='#{category.id}']").set(true)
    click_button "Create Article"

    page.should have_content "My Content"
    expect(Article.last.content).to eq "My Content"
  end

  scenario 'As an Author I want to be able to categorize an Article' do
    fill_in "article_title", :with => "My Title"
    fill_in "article_content", :with => "My Content"
    find("#article_category_ids_[value='#{category.id}']").set(true)
    click_button "Create Article"

    expect(Article.last.categories).to include category
  end
end
