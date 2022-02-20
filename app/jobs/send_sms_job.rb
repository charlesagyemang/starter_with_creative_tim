class SendSmsJob < ApplicationJob
  queue_as :default

  def perform(loan_payment)
    # send_sms(to, message)
    phone_number = loan_payment.loaner.phone_number
    total_payment = LoanPayment.where(loan_id: loan_payment.loan_id).sum(:amount)
    message = "Amount Received: #{loan_payment.amount}.\n
    Mode Of Payment: #{loan_payment.mode}.\n
    Total Payment: #{loan_payment.next_payment_date}\n
    Next Payment Date: #{loan_payment.next_payment_date}\n
    Amount Remaning: #{loan_payment.amount - total_payment}
    "
  end

  private
    def send_sms(to, message)
      client = WITTLY_FLOW_CLIENT
      res = client.send_sms("A.G.B.A", to, message)
      puts "============ SENDING SMS TO #{to} SMS LOGS: #{message} ====================="
      puts "============ SMS LOGS: #{res} ====================="
    end
end
