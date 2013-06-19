require "spec_helper"


describe MessagesController do 
  
  it "saves a message to the db" do  
    params = {content: "This is a test message"}
     expect{ post :create, message: params.to_json 
    }.to change(Message,:count).by(1) 
  end

  context "reading index for a game_id" do
    it "can access messages as a JSON response" do
      Message.create!(game_id: 1, team_name: "test team", content: "This is a message.")
      get :index, format: :json
      json_response = JSON.parse(response.body)
      expect(json_response.first["team_name"]).to eq("test team")
    end
  end

end