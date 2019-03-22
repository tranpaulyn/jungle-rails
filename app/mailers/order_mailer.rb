class OrderMailer < ApplicationMailer

    def order_notification(user, order)
        @order = order
        @user = user
        mail(
            to: @user.email,
            subject: "Thank you for your order ID##{@order.id}" 
        )
    end
end
