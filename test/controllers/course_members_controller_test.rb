# frozen_string_literal: true

require 'test_helper'

class CourseMembersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @course_member = course_members(:one)
  end

  test 'should get index' do
    get course_members_url, as: :json
    assert_response :success
  end

  test 'should create course_member' do
    assert_difference('CourseMember.count') do
      post course_members_url, params: { course_member: { course_id: @course_member.course_id, role: @course_member.role, user_id: @course_member.user_id } }, as: :json
    end

    assert_response 201
  end

  test 'should show course_member' do
    get course_member_url(@course_member), as: :json
    assert_response :success
  end

  test 'should update course_member' do
    patch course_member_url(@course_member), params: { course_member: { course_id: @course_member.course_id, role: @course_member.role, user_id: @course_member.user_id } }, as: :json
    assert_response 200
  end

  test 'should destroy course_member' do
    assert_difference('CourseMember.count', -1) do
      delete course_member_url(@course_member), as: :json
    end

    assert_response 204
  end
end
