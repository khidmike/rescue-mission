class Answer < ActiveRecord::Base

  belongs_to :question
  validates :body,
    presence: true,
    uniqueness: true

end
