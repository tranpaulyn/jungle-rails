class OrderMailer < ApplicationMailer

    def order_notification(order)
        @order = order
        mail(
            to: @order.email,
            subject: "Thank you for your order"
        )
    end
end
