class SendSmsJob < ApplicationJob
  queue_as :default

  def perform(loan_payment)
    # send_sms(to, message)
    phone_number = loan_payment.loaner.phone_number
    total_payment = LoanPayment.where(loan_id: loan_payment.loan_id, loaner_id: loan_payment.loaner_id).sum(:amount)
    message = "Hi #{loan_payment.loaner.first_name}, we have received GHC #{loan_payment.amount} from you  as part payment on your loan.\nTotal Paid: GHC #{total_payment}\nAmount Remaning: GHC #{loan_payment.loan.amount - total_payment}\nNext Payment Date: #{loan_payment.next_payment_date.strftime("%B %d, %Y")}"
    message = total_payment < loan_payment.loan.amount ? message : "Hi #{loan_payment.loaner.first_name}, you have completed your loan payment.\nTotal Paid: #{total_payment}\nAmount Remaning: GHC #{loan_payment.loan.amount - total_payment}"
    puts "============ MESSAGES #{message} ====================="
    puts "============ PhoneNumber #{phone_number} ====================="

    send_sms(phone_number, message)
    send_sms("0507565349", message)
    send_sms("0241763680", message)
  end

  private
    def send_sms(to, message)
      client = WITTLY_FLOW_CLIENT
      res = client.send_sms("NBKFund", to, message)
      puts "============ SENDING SMS TO #{to} SMS LOGS: #{message} ====================="
      puts "============ SMS LOGS: #{res} ====================="
    end
end
