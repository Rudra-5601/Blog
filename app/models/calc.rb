class Calc < ApplicationRecord
  belongs_to :user
  has_many :calc_results, dependent: :destroy

  validates :name, presence: true
end
