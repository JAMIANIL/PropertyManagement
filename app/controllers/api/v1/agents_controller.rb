module Api 
    module V1
        class AgentsController < ApplicationController
            def index
                
                agents =Agent.order('Created_at DESC');
                render json: {message:'Agents',data:agents}
            end
            
            def show
                agent =Agent.find(params[:id])
                render json: {status: 'SUCCESS',message:'Agent',data:agent}
            end

            def new
                agent =Agent.new
            end

            def create
                agent =Agent.new(agent_params)
                agent.user_id = doorkeeper_token[:resource_owner_id]
                
                if agent.save
                    render json: {data:agent}
                else
                    render json: {data:agent.errors}
                end
            end

            def update
                agent=Agent.find(params[:id])
                if agent.update(agent_params)
                    render json: {status: :'Success',message:'agent updated',data:agent}
                else
                    render json: {data:agent.errors}
                end
                
            end
            def destroy
                agent=Agent.find(params[:id])
                agent.destroy
                render json: {status: :'SUCCESS',message:'Deleted Agent',data:agent}
            end
            
            private
            def agent_params
                params.require(:agent).permit(:first_name, :last_name, :role, :company_id, :email, :password)
            end


        end
    end

end
