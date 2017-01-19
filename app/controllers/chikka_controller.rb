class ChikkaController < ApplicationController
  def receiveChikka

  	#get msg from chikka svr
  	#{msg, mobile_num}
  	#get info from models
  	#result = EvacCenter..... query('msg')
  	@mobile_number = params[:mobile_number]
  	@request_id = params[:request_id]
  	@message = params[:message]

  	client = Chikka::Client.new(client_id:'637c944b7bc58998ad060f24427708d88bb81a00f8e319c833acb7c465138ee0', secret_key:'04ca9a305e7061a634274cdad89eb3cd96142a104a217b2ee019ed31dad31b35', shortcode:'2929017116')
  	client.send_message(message: "Hi koya", mobile_number:@mobile_number, request_id: @request_id, request_cost: 'P1.00')
  	render json: client
  end
end
