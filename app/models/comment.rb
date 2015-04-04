class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  validates :body, presence: true

  after_create :send_message

  private

    def send_message
      begin
        response = RestClient::Request.new(
          :method => :post,
          :url => "https://api.twilio.com/2010-04-01/Accounts/#{ENV['TWILIO_ACCOUNT_SID']}/Messages.json",
          :user => ENV['TWILIO_ACCOUNT_SID'],
          :password => ENV['TWILIO_AUTH_TOKEN'],
          :payload => {
            :Body => "New comment added to question: " +
              self.post.title,
            :To => self.post.user.phone_number,
            :From => "+15005550006" }
        ).execute
      rescue RestClient::BadRequest => error
        message = JSON.parse(error.response)['message']
        errors.add(:base, message)
        false
      end
    end
end
