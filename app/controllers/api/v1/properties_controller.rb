module Api 
    module V1
        class PropertiesController < ApplicationController
           protect_from_forgery with: :null_session
           before_action :doorkeeper_authorize!


            def current_agent
                @current_agent ||= Agent.find_by(id: doorkeeper_token[:resource_owner_id])
            end

            def index
                #properties =Property.order('Created_at DESC');
                #selected_prop=[]
                #properties.each do |prop|
                 #   if current_agent.company_id == prop.company_id
                  #     selected_prop.push(prop)
                   # end
                  #end
                  selected_prop=Property.where(company_id: current_agent.company_id)
                render json: {message:'Properties',data:selected_prop}
            end
            
            def show    
                property =Property.find(params[:id])
                render json: {status: 'SUCCESS',message:'Property',data:property}
            end

            def new
                property =Property.new
            end

            def create
                property =Property.new(property_params)
                #property.company_id=current_agent.company_id;
                #property.user_id = doorkeeper_token[:resource_owner_id]
                property.company_id = current_agent.company_id 
                property.save
                render json: {data:property}
               # if current_agent.company_id != property.company_id
              #      render json: {message:"Invalid token",data:property} 
              #  else
                #  if property.save
                 #   render json: {data:property}
                 # else
                #    render json: {data:property.errors}
                 # end
               # end
            end

            def update
                property=Property.find(params[:id])
                if property.update(property_params)
                    render json: {status: :'Success',message:'property updated',data:property}
                else
                    render json: {data:property.errors}
                end
                
            end
            def destroy
                property=Property.find(params[:id])
                property.destroy
                render json: {status: :'SUCCESS',message:'Deleted Property',data:property}
            end
            
            private
            def property_params
                params.require(:property).permit(:name, :address, :area)
            end


        end
    end

end
