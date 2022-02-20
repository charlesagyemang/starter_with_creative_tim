class SendSmsJob < ApplicationJob
  queue_as :default

  def perform(loan_payment)
    # send_sms(to, message)
    phone_number = loan_payment.loaner.phone_number
    total_payment = LoanPayment.where(loan_id: loan_payment.loan_id, loaner_id: loan_payment.loaner_id).sum(&:amount).to_i
    message = "Amount Received: #{loan_payment.amount}.\n
    Mode Of Payment: #{loan_payment.mode}\n
    Total Payment: #{total_payment}\n
    Next Payment Date: #{loan_payment.next_payment_date}\n
    Amount Remaning: #{loan_payment.loan.amount - total_payment}"
    puts "============ MESSAGES #{message} ====================="
    send_sms(phone_number, message)
  end

  private
    def send_sms(to, message)
      client = WITTLY_FLOW_CLIENT
      res = client.send_sms("BenjiCap", to, message)
      puts "============ SENDING SMS TO #{to} SMS LOGS: #{message} ====================="
      puts "============ SMS LOGS: #{res} ====================="
    end
end
