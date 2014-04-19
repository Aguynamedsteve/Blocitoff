module TodoHelper
  def days_left(created_at)
    (created_at.to_date - (Date.today - 7.days)).to_i
  end
end
