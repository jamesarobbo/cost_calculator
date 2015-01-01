class Item < ActiveRecord::Base
  belongs_to :activity

  validates :name, presence: true
  validates :cost, presence: true
end
