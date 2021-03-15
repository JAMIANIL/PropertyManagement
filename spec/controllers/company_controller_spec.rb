require "rails_helper"

let!(:agent) {FactoryBot.create(:agent, name: 'test', role: 'admin')}

before(:each) do
    allow_any_instance_of()
end

describe "GET companies#show" do
    it "should render stories#show template" do
    get :index
    end
end

describe "GET companes#new" do
    it "should render stories#new template" do
    end
end