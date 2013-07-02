class Question < ActiveRecord::Base
  attr_accessible :date, :deleted, :enabled, :order, :title
  validates :title, :order, :date, presence: true
  has_many :answers, dependent: :destroy
end
