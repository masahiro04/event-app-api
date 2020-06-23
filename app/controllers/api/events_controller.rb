# frozen_string_literal: true

module Api
  class EventsController < ApplicationController
    before_action :authenticate_api_user!
    before_action :set_event, only: %i[show update destroy]

    def index
      begin
        response_success(Event.all.map{ |event| event.to_dict })
      end
    rescue StandardError => e
      logger.error e.message
      response_bad_request
    end

    def show
      begin
        response_success(@event.to_dict)
      end
    rescue StandardError => e
      logger.error e.message
      response_bad_request
    end

    def create
      begin
        @event = current_api_user.events.build(event_params)
        if @event.save
          response_success(@event.to_dict)
        else
          response_unprocessable_entity(@event.to_dict)
        end
      end
    rescue StandardError => e
      logger.error e.message
      response_bad_request
    end

    def update
      begin
        return response_unauthorized unless canAccess?(@event)
        if @event.update(event_params)
          response_success(@event.to_dict)
        else
          response_unprocessable_entity(@event)
        end
      end
    rescue StandardError => e
      logger.error e.message
      response_bad_request
    end

    def destroy
      begin
        return response_unauthorized unless canAccess?(@event)
        @event.destroy
        response_success('success')
      end
    rescue StandardError => e
      logger.error e.message
      response_bad_request
    end

    private

    def set_event
      @event = Event.find(params[:id])
    end

    def canAccess?(event)
      event.user_id == current_api_user.id
    end

    def event_params
      params.require(:event).permit(:title, :body, :address, :user_id)
    end
  end
end
