class SendSmsJob < ApplicationJob
  queue_as :default

  def perform(loan_payment)
    # send_sms(to, message)
    phone_number = loan_payment.loaner.phone_number
    total_payment = LoanPayment.where(loan_id: loan_payment.loan_id, loaner_id: loan_payment.loaner_id).map { |x| x.amount.to_i }.inject(0, :+)
    message = "Hi #{loan_payment.loaner.first_name}, we have received #{loan_payment.amount} from you via #{loan_payment.mode}. check your stats below\nTotal Paid: #{total_payment}\nNext Payment Date: #{loan_payment.next_payment_date.strftime("%B %d, %Y")}\nAmount Remaning: #{loan_payment.loan.amount - total_payment}"
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
