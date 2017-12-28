require 'test_helper'

class TimeTableSettingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @time_table_setting = time_table_settings(:one)
  end

  test "should get index" do
    get time_table_settings_url
    assert_response :success
  end

  test "should get new" do
    get new_time_table_setting_url
    assert_response :success
  end

  test "should create time_table_setting" do
    assert_difference('TimeTableSetting.count') do
      post time_table_settings_url, params: { time_table_setting: { break_durations: @time_table_setting.break_durations, num_breaks: @time_table_setting.num_breaks, period_duration: @time_table_setting.period_duration, school_end: @time_table_setting.school_end, school_start: @time_table_setting.school_start } }
    end

    assert_redirected_to time_table_setting_url(TimeTableSetting.last)
  end

  test "should show time_table_setting" do
    get time_table_setting_url(@time_table_setting)
    assert_response :success
  end

  test "should get edit" do
    get edit_time_table_setting_url(@time_table_setting)
    assert_response :success
  end

  test "should update time_table_setting" do
    patch time_table_setting_url(@time_table_setting), params: { time_table_setting: { break_durations: @time_table_setting.break_durations, num_breaks: @time_table_setting.num_breaks, period_duration: @time_table_setting.period_duration, school_end: @time_table_setting.school_end, school_start: @time_table_setting.school_start } }
    assert_redirected_to time_table_setting_url(@time_table_setting)
  end

  test "should destroy time_table_setting" do
    assert_difference('TimeTableSetting.count', -1) do
      delete time_table_setting_url(@time_table_setting)
    end

    assert_redirected_to time_table_settings_url
  end
end
