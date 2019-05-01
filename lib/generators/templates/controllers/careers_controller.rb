class <%= plural_scope.capitalize %>Controller < ApplicationController

	before_action :set_<%= prefix_scope.downcase %>, only: [:show, :edit, :update, :destroy, :submissions]

    # GET /<%= plural_scope %>
    # GET /<%= plural_scope %>.json
    def index
      @<%= plural_scope %> = <%= prefix_scope %>.all.order(title: :asc)
    end

    # GET /<%= plural_scope %>/1
    # GET /<%= plural_scope %>/1.json
    def show
    end

    # GET /<%= plural_scope %>/new
    def new
      @career = <%= prefix_scope %>.new
    end

    # GET /careers/1/edit
    def edit
    end

    # POST /<%= plural_scope %>
    # POST /<%= plural_scope %>.json
    def create
      @career = <%= prefix_scope %>.new(<%= prefix_scope.downcase %>_params)
      respond_to do |format|
        if @career.save
          format.html { redirect_to <%= plural_scope %>_path, notice: '<%= prefix_scope %> was successfully created.' }
          format.json { render :show, status: :created, location: @<%= prefix_scope.downcase %> }
        else
          format.html { render :new }
          format.json { render json: @<%= prefix_scope.downcase %>.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /<%= plural_scope %>/1
    # PATCH/PUT /<%= plural_scope %>/1.json
    def update
      respond_to do |format|
        if @<%= prefix_scope.downcase %>.update(<%= prefix_scope.downcase %>_params)
          format.html { redirect_to <%= plural_scope %>_path, notice: '<%= prefix_scope %> was successfully updated.' }
          format.json { render :show, status: :ok, location: @<%= prefix_scope.downcase %> }
        else
          format.html { render :edit }
          format.json { render json: @<%= prefix_scope.downcase %>.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /<%= plural_scope %>/1
    # DELETE /<%= plural_scope %>/1.json
    def destroy
      @<%= prefix_scope.downcase %>.destroy
      respond_to do |format|
        format.html { redirect_to <%= plural_scope %>_path, notice: '<%= prefix_scope %> was successfully deleted.' }
        format.json { head :no_content }
      end
    end

    def career_question
      respond_to do |format|
        format.js
      end
    end

    def submission_detail
      @career_submission = <%= prefix_scope %>Submission.find(params[:<%= prefix_scope.downcase %>_submission_id])
      respond_to do |format|
        format.js
      end
    end


    def careers_list
      @careers = <%= prefix_scope %>.all.order(title: :asc)
    end

    def career_apply
      @career = <%= prefix_scope %>.find(params[:id])
      @career_submission = <%= prefix_scope %>Submission.new
    end

    def career_submission
      @<%= prefix_scope.downcase %> = <%= prefix_scope %>.find(params[:id])
      @<%= prefix_scope.downcase %>_submission = <%= prefix_scope %>Submission.new(<%= prefix_scope.downcase %>_submission_params.merge!(<%= prefix_scope.downcase %>_id: @<%= prefix_scope.downcase %>.id))
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
      def set_<%= prefix_scope.downcase %>
        @<%= prefix_scope.downcase %> = <%= prefix_scope %>.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def <%= prefix_scope.downcase %>_params
        p = params.require(:<%= prefix_scope.downcase %>).permit(:title, :position, :location, :description, :questions, :status)
        unless params[:<%= prefix_scope.downcase %>][:questions].nil?
          p[:questions] = params[:<%= prefix_scope.downcase %>][:questions].values
        end
        return p
      end

      def <%= prefix_scope.downcase %>_submission_params
        p = params.require(:<%= prefix_scope.downcase %>_submission).permit(:<%= prefix_scope.downcase %>_id,:name,:email,:phone,:current_company,:linkedin_url,:twitter_url,:github_url,:other_url,:gender,:veteran_status,:disability_status,:question_answers,:note,:status)
      end

end