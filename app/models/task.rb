class Task < ApplicationRecord
  belongs_to :category
  belongs_to :user
  attr_accessor :completed
end
