class Todo < ActiveRecord::Base
  include ActionView::Helpers
  
  belongs_to :user

  def days_left
    distance_of_time_in_words(created_at, Date.today - 6.days)
  end
end
