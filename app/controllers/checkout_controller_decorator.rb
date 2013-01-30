require 'find_address'

CheckoutController.class_eval do

  private

  def before_address
    return if @order.bill_address or @order.ship_address
    #puts "BEFORE ADDRESS2 called user= #{@order}  #{@order.email}"
    @order.bill_address , @order.ship_address = FindAddressHelper.find_address(@order.email)
    # in case none found
    @order.bill_address ||= current_user.bill_address || Address.default
    @order.ship_address ||= current_user.ship_address || Address.default
  end


end
