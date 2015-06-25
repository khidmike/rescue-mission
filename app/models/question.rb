class Question < ActiveRecord::Base

  has_many :answers

  validates :title,
    presence: true,
    uniqueness: true

  validates :body,
    presence: true
end
