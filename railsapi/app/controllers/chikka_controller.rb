class ChikkaController < ApplicationController
  def receiveChikka

  	@mobile_number = params[:mobile_number]
  	@request_id = params[:request_id]
  	@message = params[:message]

  	@reply = EvacCenter.get_result(@message)
# <<<<<<< HEAD
#   	render json: @reply
#   	# client = Chikka::Client.new(client_id:'f3be0f5b7d2abc0ce6fc0dccf7ecc049272af5679fbf5a547429cbaddb0391ff', secret_key:'757f94e11c41b07a8eb846c20ad1db7fcb98b07a57b85ebe7092c3e4c457f87b', shortcode:'29290469148')
#   	# client.send_message(message: "Hi koya", mobile_number:@mobile_number, request_id: @request_id, request_cost: 'FREE')
#   	# render json: client
# =======

  	client = Chikka::Client.new(client_id:'f3be0f5b7d2abc0ce6fc0dccf7ecc049272af5679fbf5a547429cbaddb0391ff', secret_key:'757f94e11c41b07a8eb846c20ad1db7fcb98b07a57b85ebe7092c3e4c457f87b', shortcode:'29290469148')
  	client.send_message(message: @reply, mobile_number:@mobile_number, request_id: @request_id, request_cost: 'FREE')
  	render json: client
  end
end
