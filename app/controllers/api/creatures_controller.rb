class Api::CreaturesController < ApplicationController
#display all creatures
    def index
        #get all creatures from db and save to instance variable
    @creatures = Creature.all 

    render json: @creatures 
    end 

    def create 
        #whitelist params and save them to a variable 
        creature_params = params.require(:creature).permit(:name, :description)

        #if creature saves, render the new creature in JSOn
        if @creature.save
            render json: @creature
        end
    #display a specific creature
    def show
        #get the creature id from the url params
        creature_id = params[:id]
        
        #use 'creature_id' to find the creature in the database
        #and save it to an instance variable 
        @creature = Creature.find_by_id(creature_id)

        render json: @creature 
    end

    def update 
        #get the creature id from the url params
        creature_id = params[:id]

        #use 'creature_id' to find the creature in the database
        @creature = Creature.find_by_id(creature_id)

        #whitelist params and save them to a variable
        creature_params = params.require(:creature).permit(:name, :description)

        #update the creature 
        @creature.update_attributes(creature_params)

        render json: @creature
    end 

    def destroy
        #get the creature id from the url params
        creature_id = params[:id]

        #use 'creature_id' to find the creature in the database
        # and save it to a variable
        @creature.destroy 
        render json: {
            msg: "Successfully Deleted"
        }
    end 

    private 

    def creature_params
        #whitelist params return whitelisted version
        params.require(:creature).permit(:name, :description)
    end
end
