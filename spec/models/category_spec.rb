require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) { create(:user) }
  it 'is valid with a name, description, and associated user' do
    category = Category.new(
      name: 'Example Category',
      description: 'Example Description',
      user: user
    )
    expect(category).to be_valid
  end

  it 'is invalid without a name' do
    category = Category.new(
      name: nil,
      description: 'Example Description',
      user: user
    )
    category.valid?
    expect(category.errors[:name]).to include("can't be blank")
  end
end

