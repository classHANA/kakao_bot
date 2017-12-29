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

  	# 로또
  	# 메뉴
  	# 다른 명령어가 들어왔을때 
  	# => ㅠㅠ 알수없는 명령어 입니다.
  	if user_message == "로또"
  		user_message = (1..45).to_a.sample(6).to_s
  	elsif user_message == "메뉴" 
  		user_message = ["20층","시골집","다이어트","편의점","시래기"]
  	else
  		user_message = "지금 사용가능한 명령어는 <메뉴>,<로또> 입니다."
  	end
  		
  	return_message = {
  		:message => {
  			:text => user_message 
  		}

  	}


  	render json: return_message

  end
end




















