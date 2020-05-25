class ChallengesController < ApplicationController
  protect_from_forgery with: :exception
  rescue_from ActionController::InvalidAuthenticityToken, with: :handle_unverified_request_bad

  def show
    @challenge = if %w[admin].include? params[:user_id]
                   Challenge.find(params[:id])
                 else
                   Challenge.find(0)
                 end
    render json: @challenge
  end

  def create
    c = Challenge.new(challenge_params)
    c.test_assertions = combine_assertions(assertion_params)
    c.is_challenge = true
    begin
      if c.save
        render plain: 'good'
      else
        render plain: 'bad'
      end
    rescue => exception
      render plain: 'bad'
    end
  end

  private

  def challenge_params
    params.permit(:challenge, :pattern_type)
  end

  def assertion_params
    params.permit(:testFunction, :assertion1left, :assertion2left, :assertion3left, :assertion1right, :assertion2right, :assertion3right)
  end

  def combine_assertions(assertion_params)
    left_assertions = []
    right_assertions = []
    test_function = assertion_params.dig(:testFunction).strip

    3.downto(1) do |x|
      left_assertions.push(assertion_params.dig("assertion#{x}left").strip)
      right_assertions.push(assertion_params.dig("assertion#{x}right").strip)
    end

    assertions = ''

    left_assertions.length.times do |_x|
      l_a = left_assertions.pop
      r_a = right_assertions.pop
      if !l_a.blank? && !r_a.blank?
        r_a_stripped = r_a.gsub("'", '')
        assertions = "#{assertions}\n it('will return #{r_a_stripped}', function(){\n expect(#{test_function}(#{l_a})).toEqual(#{r_a})\n });"
      end
    end

    "describe('#{test_function}', function(){  #{assertions} \n });"
  end

  def handle_unverified_request_bad
    render plain: 'bad'
  end
end
