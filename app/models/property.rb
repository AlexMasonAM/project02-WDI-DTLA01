class Property
  include Mongoid::Document
  include Mongoid::Timestamps
  field :address, type: String
  field :list_price, type: Integer
  field :sale_price, type: Integer
  field :fix_costs, type: Integer
  field :time_held, type: Integer

  # calculated fields
  field :profit_margin, type: Integer
  field :percent_profit, type: Integer

  has_one :user

  validates :list_price, :sale_price, presence: true

  def date_published
    created_at.localtime.strftime("%A, %B %-d, %Y at %l:%M %p")
  end  
end
