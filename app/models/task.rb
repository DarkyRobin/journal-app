class Task < ApplicationRecord
  belongs_to :category
  attr_accessor :completed
end
