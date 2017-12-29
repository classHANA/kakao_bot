class KakaoController < ApplicationController
  def keyboard
  	home_keyboard = {
  		:type => "text"
  	}

  	render json: home_keyboard
  end

  def message

  	# 사용자가 보내준 텍스트를 그대로 다시 말하기

  	user_message = params[:content]



  	return_message = {
  		:message => {
  			:text => user_message 
  		}

  	}


  	render json: return_message

  end
end




















