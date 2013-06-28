require "spec_helper"


describe MessagesController do 
  
  it "saves a message to the db" do  
    params = {game_id: 1, team_name: "test team", content: "This is a message."}
    original_count = Message.count
    MessageRecorder.record(params)
    sleep 2
    expect( Message.count ).to eq(original_count + 1)
  end

  context "reading index for a game_id" do
    it "can access messages as a JSON response" do
      MessageRecorder.record(game_id: 1, team_name: "test team", content: "This is a message.")
      get :index, format: :json, game_id: 1
      json_response = JSON.parse(response.body)
      expect(json_response.first["team_name"]).to eq("test team")
    end
  end
end
