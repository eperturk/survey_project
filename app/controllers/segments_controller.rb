class SegmentsController < ApplicationController

  def index
    @segments = Segment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @segments }
    end
  end

  def show
    @segment = Segment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @segment }
    end
  end

  def new
    @segment = Segment.new
    @note = Note.find(params[:note_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @segment }
    end
  end

  def edit
    @segment = Segment.find(params[:id])
    @note = Note.find(params[:note_id])
  end

  def create
    @note = Note.find(params[:note_id])
    @segment = @note.segments.create(:content => params[:content], :note_id => @note.id)

    respond_to do |format|
      if @segment.save
        format.html { redirect_to @note, notice: 'Segment was successfully created.' }
        format.json { render json: @note, status: :created, location: @segment }
      else
        format.html { render action: "new" }
        format.json { render json: @segment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @note = Note.find(params[:note_id])
    @segment = Segment.find(params[:id])
    @segment.content = params[:content]
    respond_to do |format|
      if @segment.save
        format.html { redirect_to @note, notice: 'Segment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @segment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @segment = Segment.find(params[:id])
    @segment.destroy

    respond_to do |format|
      format.html { redirect_to segments_url }
      format.json { head :no_content }
    end
  end
end
