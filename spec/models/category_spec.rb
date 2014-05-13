require 'spec_helper'

describe Category do
  it 'can be created' do
    expect(Category.new).to be_a Category
  end
end
