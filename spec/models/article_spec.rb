require 'spec_helper'

describe Article do


  describe '#user' do
    let(:user) { FactoryGirl.create(:user) }

    it 'should belong to a user' do
      article = user.articles.create(:title => 'my article', :content => "blah dee blah");
      expect(article.user).to be_a User
    end
  end

  describe '#categories' do

    let(:article) { FactoryGirl.create(:article) }
    let(:cats) { FactoryGirl.create(:category, :name => "Cats") }

    it 'should have many categories through ArticleCategories' do
      article.categories << cats
      article.save
      expect(article.categories).to include cats
    end
  end

end
