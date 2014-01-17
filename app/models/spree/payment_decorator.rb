Spree::Payment.class_eval do

  include Spree::Payment::Processing
  # see https://github.com/spree/spree/issues/981
  def build_source

    return if source_attributes.nil?
    # binding.pry

    if payment_method and payment_method.payment_source_class

      self.source = payment_method.payment_source_class.new(source_attributes)
    end
  end


end






