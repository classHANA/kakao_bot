class KakaoController < ApplicationController
  def keyboard
  	home_keyboard = {
  		:type => "text"
  	}

  	render json: home_keyboard
  end

  def message
  end
end
