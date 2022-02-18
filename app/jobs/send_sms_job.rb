class SendSmsJob < ApplicationJob
  queue_as :default

  def perform(to, message)
    # Do something later
    send_sms(to, message)
  end

  private
    def send_sms(to, message)
      client = WITTLY_FLOW_CLIENT
      res = client.send_sms("A.G.B.A", to, message)
      puts "============ SENDING SMS TO #{to} SMS LOGS: #{message} ====================="
      puts "============ SMS LOGS: #{res} ====================="
    end
end
