module Api 
    module V1
        class CompaniesController < ApplicationController
            def index
                
                companies =Company.order('Created_at DESC');
                render json: {message:'Companies',data:companies}
            end
            
            def show
                company =Company.find(params[:id])
                render json: {status: 'SUCCESS',message:'Company',data:company}
            end

            def new
                company =Company.new
            end

            def create
                company =Company.new(company_params)
                company.user_id = doorkeeper_token[:resource_owner_id]
                
                if company.save
                    render json: {data:company}
                else
                    render json: {data:company.errors}
                end
            end

            def update
                company=Company.find(params[:id])
                if company.update(company_params)
                    render json: {status: :'Success',message:'company updated',data:company}
                else
                    render json: {data:company.errors}
                end
                
            end
            def destroy
                company=Company.find(params[:id])
                company.destroy
                render json: {status: :'SUCCESS',message:'Deleted Company',data:company}
            end
            
            private
            def company_params
                params.require(:company).permit(:name, :contact_number, :email, :founded_year)
            end


        end
    end

end
