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

    # @chart1 = LazyHighCharts::HighChart.new('graph') do |f|
    #   f.title({text: 'Stratificatied<br>Applicant<br>Demographics', align: 'center', verticalAlign: 'middle', y: 40})
    #   f.tooltip({pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'})
    #   f.plotOptions({pie: 'dataLabels: {enabled: true, distance: -50, style: {fontWeight: "bold", color: "white"}}, startAngle: -90, endAngle: 90, center: ["50%", "75%"]}'})
    #   f.series({type: 'pie', name: 'Demographics', innerSize: '50%', data: [['Firefox', 10.38], ['IE', 56.33], ['Chrome', 24.03], ['Safari', 4.77], ['Opera', 0.91], {name: 'Proprietary or Undetectable', y: 0.2, dataLabels: {enabled: false}}]})
    # end

    @chart1 = LazyHighCharts::HighChart.new('graph') do |f|
        f.chart({:defaultSeriesType=>"pie", :margin=> [50, 0, 0, 0]})
        #f.title({:text => ""})
        # f.subtitle({:text => 'Stratificatied<br>Applicant<br>Demographics'})
        f.plotOptions ({
            pie: {
              dataLabels: {
                  enabled: true,
                  distance: -50,

              },
              startAngle: -90,
              endAngle: 90,
              center: ['50%', '75%']
            }
        }
        )
        f.series({
          :type => "pie",
          :name => "2016",
          :size => "150%",
          :innerSize => "30%",
          :data => [{ :name => @positions[1].name, :y => 44.2, :color => "#4572A7" },{ :name => @positions[2].name, :y => 46.6, :color => "#AA4643" },{ :name => @positions[3].name, :y => 3.1, :color => "#89A54E" },{ :name => @positions[4].name, :y => 2.7, :color => "#80699B" },{ :name => @positions[5].name, :y => 1.35, :color => "#3D96AE" },{ :name => @positions[6].name, :y => 1.35, :color => "#DB843D" }],}
        )
    end

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

      f.series(name: "Max", yAxis: 0, data: max, color: 'rgba(0,0,0,0.5)', visible: false)
      f.series(name: "Actual", yAxis: 0, data: act, color: 'rgb(109,179,63)')
      f.series(name: "Ave", yAxis: 0, data: avg, color: 'rgba(0,179,207,0.5)')
      f.series(name: "Min", yAxis: 0, data: min, color: 'rgba(255,255,0,0.5)', visible: false)

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
