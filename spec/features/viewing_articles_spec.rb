require 'spec_helper'

feature 'Viewing articles' do

  let(:article) { FactoryGirl.create(:article, :content => "Blah dee blah") }
  let(:category) { FactoryGirl.create(:category, :name => "Movies") }

  scenario 'As a viewer I want to be able to read an Article' do
    visit article_path(article)

    page.should have_content "Blah dee blah"
  end

  scenario 'As a viewer I want to be able to find an Article by Category' do
    article.categories << category
    article.save

    visit category_path(category)

    click_link article.title

    page.should have_content article.content
  end
end
