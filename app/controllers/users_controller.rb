class UsersController < ApplicationController

    def index
        @users=User.all
    end

    def update
        user= User.find(params[:id])
        user.update(user_params)
        redirect_to user

    end

    def show
        @user=User.find(params[:id])
    end

    def edit
        @user=User.find(params[:id])
        
    end

    def destroy
        user= User.find(params[:id])
        user.destroy
        redirect_to User
    end

    def create
        # raise user_params.inspect
        user=User.create(user_params)
        redirect_to user_path(user)
    end

    def new
        @user=User.new
    end

    private

    def user_params
        params.require(:user).permit([:name, :age])
    end

end
