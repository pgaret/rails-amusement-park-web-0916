class User < ActiveRecord::Base
  # write associations here
  has_many :rides
  has_many :attractions, through: :rides

  def mood
    if self.nausea > self.happy
      "sad"
    else
      "happy"
    end
  end
end
