class Ride < ActiveRecord::Base
  # write associations here
  belongs_to :user
  belongs_to :attraction

  def take_ride
    @user, @attraction = User.find(self.user_id), Attraction.find(self.attraction_id)
    if @user.height >= @attraction.min_height && @user.tickets >= @attraction.tickets
      @user.tickets -= @attraction.tickets
      @user.happiness += @attraction.happiness_rating
      @user.nausea += @attraction.nausea_rating
      @user.save
      self.save
    end
    flash
  end

  def flash
    if @user.height < @attraction.min_height && @user.tickets < @attraction.tickets
      "You do not have enough tickets to ride the #{attraction.name}\nYou are not tall enough to ride the #{attraction.name}"
    elsif @user.height < @attraction.min_height
      "You are not tall enough to ride the #{@attraction.name}"
    elsif @user.tickets < @attraction.tickets
      "You do not have enough tickets to ride the #{@attraction.name}"
    else
      "Thanks for riding the #{@attraction.name}!"
    end
  end
end
