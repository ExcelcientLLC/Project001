class Event
  attr_reader :date, :visit, :category

  def initialize(date, visit, category)
    @date     = date
    @visit   = visit
    @category = category
  end
end