class Answer < ActiveRecord::Base
  attr_accessible :question_id, :title
  validates :title, presence: true
  belongs_to :question
end
