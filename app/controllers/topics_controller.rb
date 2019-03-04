# frozen_string_literal: true

class TopicsController < ApplicationController
  before_action :set_topic, only: %i[show update destroy]

  def index
    @topics = Topic.all
    render json: @topics.as_json(only: %i[id name])
  end

  def stats
    @topics = Topic.joins(:questions).merge(Question.asked_since(params[:since]))
    @topics = @topics.group('topics.id').select('SUM(questions.votes) AS vote_count','name','id', 'COUNT(questions)')
    render json: @topics.as_json
  end

  def show; end

  def create
    @topic = Topic.new(topic_params)

    if @topic.save
      render :show, status: :created, location: @topic
    else
      render json: @topic.errors, status: :unprocessable_entity
    end
  end

  def update
    if @topic.update(topic_params)
      render :show, status: :ok, location: @topic
    else
      render json: @topic.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @topic.destroy
  end

  private

  def set_topic
    @topic = Topic.find(params[:id])
  end

  def topic_params
    params.require(:topic).permit(:name)
  end
end
