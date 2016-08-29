module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
    end

    def disconnect
    end

    protected
      def find_verified_user
        # request.env['warden'] is an environment variable containing information about the current user. This is where Devise stores its data about the current user. If a user isn't logged in, this variable will be empty
        if verified_user = request.env['warden'].user
          verified_user
        else
          # rails method to stop connection attempts
          reject_unauthorized_connection
        end
      end
  end

end
