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

  # relationals
  belongs_to :user


  validates :list_price, :sale_price, presence: true
  
  def date_published
    created_at.localtime.strftime("%A, %B %-d, %Y at %l:%M %p")
  end 

  def calculate_profit_margin
    self.profit_margin = (self.sale_price - self.list_price).to_i
  end

  def calculate_profit_percent
    (1550/750)*100
  end
  # def calculate_profit_margin
  #   profit_margin = self.profit_margin
  #   self.profit_margin = (self.sale_price - self.list_price).to_i
  #   return profit_margin
  # end

  # attr_accessor :sale_price, :list_price, :fix_costs 

  # before_save :calculate_profit_margin
 

  # def calculate_profit_margin
  #   self.profit_margin = self.sale_price - self.list_price
  # end
  
end
