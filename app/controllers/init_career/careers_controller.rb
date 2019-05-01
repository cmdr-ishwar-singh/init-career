require_dependency "init_career/application_controller"

module InitCareer
  class CareersController < ApplicationController

    before_action :set_career, only: [:show, :edit, :update, :destroy, :submissions]

    # GET /careers
    # GET /careers.json
    def index
      @careers = Career.all.order(title: :asc)
    end

    # GET /careers/1
    # GET /careers/1.json
    def show
    end

    # GET /careers/new
    def new
      @career = Career.new
    end

    # GET /careers/1/edit
    def edit
    end

    # POST /careers
    # POST /careers.json
    def create
      @career = Career.new(career_params)
      respond_to do |format|
        if @career.save
          format.html { redirect_to careers_path, notice: 'Career was successfully created.' }
          format.json { render :show, status: :created, location: @career }
        else
          format.html { render :new }
          format.json { render json: @career.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /careers/1
    # PATCH/PUT /careers/1.json
    def update
      respond_to do |format|
        if @career.update(career_params)
          format.html { redirect_to careers_path, notice: 'Career was successfully updated.' }
          format.json { render :show, status: :ok, location: @career }
        else
          format.html { render :edit }
          format.json { render json: @career.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /careers/1
    # DELETE /careers/1.json
    def destroy
      @career.destroy
      respond_to do |format|
        format.html { redirect_to careers_path, notice: 'Career was successfully deleted.' }
        format.json { head :no_content }
      end
    end

    def career_question
      respond_to do |format|
        format.js
      end
    end

    def submission_detail
      @career_submission = CareerSubmission.find(params[:career_submission_id])
      respond_to do |format|
        format.js
      end
    end


    def careers_list
      @careers = Career.all.order(title: :asc)
    end

    def career_apply
      @career = Career.find(params[:id])
      @career_submission = CareerSubmission.new
    end

    def career_submission
      @career = Career.find(params[:id])
      @career_submission = CareerSubmission.new(career_submission_params.merge!(career_id: @career.id))
      if (@career_submission.save)
      # unless (ENV['TO_EMAIL'].to_s.empty?)
      #   UserMailer.career_submission(@career_submission.id).deliver
      # end
        redirect_to "/", notice: 'Your application has been submitted successfully.'
      else
        render :career_apply
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_career
        @career = Career.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def career_params
        p = params.require(:career).permit(:title, :position, :location, :description, :questions, :status)
        unless params[:career][:questions].nil?
          p[:questions] = params[:career][:questions].values
        end
        return p
      end

      def career_submission_params
        p = params.require(:career_submission).permit(:career_id,:name,:email,:phone,:current_company,:linkedin_url,:twitter_url,:github_url,:other_url,:gender,:veteran_status,:disability_status,:question_answers,:note,:status)
      end
  end
end


    

