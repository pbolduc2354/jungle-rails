class JungleMailer < ApplicationMailer

    def sample_email(order)
        @order = order
        mail(to: @order.email, subject: "Confirmation email for order: #{@order.id}")
    end
end
