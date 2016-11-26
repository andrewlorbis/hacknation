class ApplicantsController < ApplicationController
  before_action :set_applicant, only: [:show, :edit, :update, :destroy]

  # GET /applicants
  # GET /applicants.json
  def index
    @agerange = ['18-25', '26-30', '31-40', '40++']
    @positions = Position.all
    @languages = Language.all
    @statuses = Status.all
    @applicants = Applicant.all
  end

  # GET /applicants/1
  # GET /applicants/1.json
  def show
    max = [Applicant.maximum('age'), Applicant.maximum('gpa'), Applicant.maximum('exp')]
    avg = [Applicant.average('age').truncate(2).to_f, Applicant.average('gpa').truncate(2).to_f, Applicant.average('exp').truncate(2).to_f]
    act = [@applicant.age, @applicant.gpa, @applicant.exp]
    min = [Applicant.minimum('age'), Applicant.minimum('gpa'), Applicant.minimum('exp')]
    @chart = LazyHighCharts::HighChart.new('graph') do |f|
      # f.title(text: "Activity for the past few days")
      f.xAxis(categories: ["Age", "GPA", "Y_Exp"])

      # f.series(name: "Max", yAxis: 0, data: max, color: 'rgba(0,0,0,0.5)', pointPlacement: 0.1)
      # f.series(name: "Actual", yAxis: 0, data: act, color: 'rgb(109,179,63)', pointPlacement: 0.0)
      # f.series(name: "Ave", yAxis: 0, data: avg, color: 'rgba(76,179,207,0.5)', pointPlacement: 0.05)

      f.series(name: "Max", yAxis: 0, data: max, color: 'rgba(0,0,0,0.5)')
      f.series(name: "Actual", yAxis: 0, data: act, color: 'rgb(109,179,63)')
      f.series(name: "Ave", yAxis: 0, data: avg, color: 'rgba(76,179,207,0.5)')

      f.yAxis [
        {title: {text: "Score"}, plotLines: [{value: 0, width: 1, color: '#808080'}] }
      ]

      f.chart({defaultSeriesType: "column"})
      f.legend({shadow: false})
      f.tooltip({shared: true})
      f.plotOptions({column: {grouping: false, shadow:false, borderWidth: 0}})
    end
  end

  # GET /applicants/new
  def new
    @applicant = Applicant.new
  end

  # GET /applicants/1/edit
  def edit
  end

  # POST /applicants
  # POST /applicants.json
  def create
    @applicant = Applicant.new(applicant_params)

    respond_to do |format|
      if @applicant.save
        format.html { redirect_to @applicant, notice: 'Applicant was successfully created.' }
        format.json { render :show, status: :created, location: @applicant }
      else
        format.html { render :new }
        format.json { render json: @applicant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /applicants/1
  # PATCH/PUT /applicants/1.json
  def update
    respond_to do |format|
      if @applicant.update(applicant_params)
        format.html { redirect_to @applicant, notice: 'Applicant was successfully updated.' }
        format.json { render :show, status: :ok, location: @applicant }
      else
        format.html { render :edit }
        format.json { render json: @applicant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /applicants/1
  # DELETE /applicants/1.json
  def destroy
    @applicant.destroy
    respond_to do |format|
      format.html { redirect_to applicants_url, notice: 'Applicant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_applicant
      @applicant = Applicant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def applicant_params
      params.require(:applicant).permit(:name, :age, :location, :gpa, :exp)
    end
end
