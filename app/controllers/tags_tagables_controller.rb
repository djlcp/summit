class TagsTagablesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tags_tagable, only: [:destroy]

  def create
    @tags_tagable = tags_tagable.new(tags_tagables_params)
    @tags_tagable.tagable = @tagable
    @tags_tagable.save
  end

  def destroy
    @tags_tagable.destroy
  end

  private

  def set_tags_tagable
    @tags_tagable = TagsTagable.find(params[:id])
  end

  def tags_tagables_params
    params.require(:tags_tagable).permit(:tag_id)
  end
end
