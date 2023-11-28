require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'should not save Category without description' do
    category = Category.new
    category.name = "Work"
    category.description = "Description"
    
    expect(category.save).to be_falsey
    expect(category.errors[:description]).to include("can't be blank")
    expect(category.errors[:name]).to include("can't be blank")
  end
end
