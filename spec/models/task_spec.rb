require 'rails_helper'

RSpec.describe Task, type: :model do
  it 'is not valid without a title' do
    task = Task.new(description: 'Some description', completed: false)
    expect(task).to_not be_valid
  end

  it 'is valid with a title' do
    task = Task.new(title: 'Example Task', description: 'Some description', completed: false)
    expect(task).to be_valid
  end

  it 'defaults to not completed' do
    task = Task.new(title: 'Example Task', description: 'Some description')
    expect(task.completed).to be(false)
  end
end
