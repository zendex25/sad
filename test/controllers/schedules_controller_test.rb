require 'test_helper'

class SchedulesControllerTest < ActionController::TestCase
  setup do
    @schedule = schedules(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:schedules)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create schedule" do
    assert_difference('Schedule.count') do
      post :create, schedule: { day_id: @schedule.day_id, finish_time: @schedule.finish_time, professor_id: @schedule.professor_id, room_id: @schedule.room_id, section_id: @schedule.section_id, start_time: @schedule.start_time, subject_id: @schedule.subject_id, time: @schedule.time, time: @schedule.time }
    end

    assert_redirected_to schedule_path(assigns(:schedule))
  end

  test "should show schedule" do
    get :show, id: @schedule
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @schedule
    assert_response :success
  end

  test "should update schedule" do
    patch :update, id: @schedule, schedule: { day_id: @schedule.day_id, finish_time: @schedule.finish_time, professor_id: @schedule.professor_id, room_id: @schedule.room_id, section_id: @schedule.section_id, start_time: @schedule.start_time, subject_id: @schedule.subject_id, time: @schedule.time, time: @schedule.time }
    assert_redirected_to schedule_path(assigns(:schedule))
  end

  test "should destroy schedule" do
    assert_difference('Schedule.count', -1) do
      delete :destroy, id: @schedule
    end

    assert_redirected_to schedules_path
  end
end
