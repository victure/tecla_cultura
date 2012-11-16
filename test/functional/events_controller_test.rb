require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  setup do
    @event = events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event" do
    assert_difference('Event.count') do
      post :create, event: { cover: @event.cover, date_at: @event.date_at, description: @event.description, flayer: @event.flayer, name: @event.name, pace_at: @event.pace_at, place_id: @event.place_id, state: @event.state }
    end

    assert_redirected_to event_path(assigns(:event))
  end

  test "should show event" do
    get :show, id: @event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @event
    assert_response :success
  end

  test "should update event" do
    put :update, id: @event, event: { cover: @event.cover, date_at: @event.date_at, description: @event.description, flayer: @event.flayer, name: @event.name, pace_at: @event.pace_at, place_id: @event.place_id, state: @event.state }
    assert_redirected_to event_path(assigns(:event))
  end

  test "should destroy event" do
    assert_difference('Event.count', -1) do
      delete :destroy, id: @event
    end

    assert_redirected_to events_path
  end
end
