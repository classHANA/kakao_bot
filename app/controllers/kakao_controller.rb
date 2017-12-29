require 'parser'

class KakaoController < ApplicationController
  def keyboard
  	# home_keyboard = {
  	# 	:type => "text"
  	# }
  	home_keyboard = {
  		:type => "button",
  		:buttons => ["영화","메뉴","고양이","로또"]
  	}

  	render json: home_keyboard
  end

  def message

  	# 사용자가 보내준 텍스트를 그대로 다시 말하기

  	user_message = params[:content]
  	return_text = "임시텍스트"
  	image = false
  	# 로또
  	# 메뉴
  	# 다른 명령어가 들어왔을때 
  	# => ㅠㅠ 알수없는 명령어 입니다.
  	if user_message == "로또"
  		return_text = (1..45).to_a.sample(6).to_s
  	elsif user_message == "메뉴" 
  		return_text = ["20층","시골집","다이어트","편의점","시래기"].sample
  	elsif user_message == "고양이"
  		image = true
  		animal = Parser::Animal.new
  		return_text = "나만 고양이 없어"
  		img_url = animal.cat

  	elsif user_message == "영화"
  		
  		image = true
  		naver_movie = Parser::Movie.new
  		naver_movie_info = naver_movie.naver
  		return_text = naver_movie_info[0]
  		img_url = naver_movie_info[1]

  	else
  		return_text = "로또,고양이,영화,메뉴"
  	end
  		
  	# return_message = {
  	# 	:message => {
  	# 		:text => user_message 
  	# 	}

  	# }
  	home_keyboard = {
  		:type => "button",
  		:buttons => ["영화","메뉴","고양이","로또"]
  	}

  	return_message_with_img = {
  		:message => {
  			:text => return_text,
  			:photo => {
  				:url => img_url,
  				:width => 640,
  				:height => 480
  			}
  			},
  		:keyboard => home_keyboard
  	}

  	return_message = {
  		:message => {
  			:text => return_text,
  			},
  		:keyboard => home_keyboard
  	}

  	if image
  		render json: return_message_with_img
  	else
  		render json: return_message
  	end
  end
end




















