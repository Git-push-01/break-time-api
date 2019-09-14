
class ApplicationController < ActionController::API



  def index
      render json: { message: "successful", status: 200 }
    end

    def get_current_user
      jwt_token = request.headers['HTTP_AUTHORIZATION']

      if jwt_token
        user_info = Auth.decode(jwt_token)
        user ||= User.find(user_info['user_id'])
      end

      user
    end
    def append_info_to_payload(payload)
      super
     case
        when payload[:status] == 200
          payload[:level] = "INFO"
        when payload[:status] == 302
          payload[:level] = "WARN"
        else
          payload[:level] = "ERROR"
        end
end
  end
