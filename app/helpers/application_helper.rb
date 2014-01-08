module ApplicationHelper
  def spree_guest_api_key
    spree_guest_api_key = User.find_by_email('guest@example.com').spree_api_key
  end
end