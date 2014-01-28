Spree::Product.class_eval do
  belongs_to :user

  def artist
    property('artist')
  end

  def format
    property('format')
  end
  
end