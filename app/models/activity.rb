class Activity < ActiveRecord::Base
  belongs_to :user
  has_many :items

  validates_presence_of :title

  def self.total_cost(activity)
   
    t = activity.items.collect{|x| x.cost}
    total = t.reject{|x| x == nil}
    total.sum
    
  end

  def self.overall_cost(activities)

    a = activities.each.collect{|x| x.items}
    b = a.flatten
    c = b.collect do |k, v|
          k[:cost]
        end
    c.sum      
  end
end
