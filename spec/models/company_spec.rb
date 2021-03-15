require "rails_helper"
#RSpec.describe Company, :type=> :model do
describe Company do

    before(:all) do
        @company1 = build(:company,name:"namee",contact_number:2914755,email:"email1gmail",founded_year:"2015-05-04")
      end
    
    
      context "Validations" do
        it "is valid with valid attributes" do
             expect(@company1).to be_valid
        end
      end
    
      context "Invalid" do      
        it "should not have duplicates" do
            @company2=build(:company)
            expect(@company2).to_not be_valid
        end

        it "is not valid without a name"do
            @company2=build(:company,name:nil)
            expect(@company2).to_not be_valid
       end 
        
       it "is not valid without a name"do
       @company2=build(:company,contact_number:nil)
       expect(@company2).to_not be_valid
  end 
      end


  describe "#create company" do
    let!(:lock1) {FactoryBot.create(:lock, number: 45678)}
    let!(:lock2) {FactoryBot.create(:lock, number: 45679)}

    context "no locks present" do
      it "should not returun any lkocks" do
        company = FactoryBot.create(:company, email: 'asdlk@jlks.ljkd', contact_number: 345678)
        expect(company.locks.pluck(:id).sort).to eq([lock1.id, lock2.id].sort)
      end
    end

    context "combination of assinged and unassigned locks" do
      before(:each) do
        company2 = FactoryBot.create(:company, email: 'asdlk@jlks.ljkd', contact_number: 345678)
      end

      it "should assign to only unassigned locks" do
        lock3 = FactoryBot.create(:lock, number: 456791)
        company3 = FactoryBot.create(:company, email: 'asdlk@jlks.ljd', contact_number: 45678)
        expect(company3.locks.pluck(:id).sort).to eq([lock3.id].sort)
      end
    end

    context "more than 10 locks" do
      before(:each) do
        30.times do |i|
          FactoryBot.create(:lock, number: i)
        end
      end

      it "should assign only to 10 locks" do
        company = FactoryBot.create(:company, email: 'asdlk@jlks.ljkd', contact_number: 345678)
        expect(company.locks.count).to eq(10)
      end
    end
  end
end