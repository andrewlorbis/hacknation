class PerformanceController < ApplicationController
  def index
    @statuses = Status.all
    # for 30 days prior today for all status
    dt = 10
    dm = 6
    tableday = Array.new(5){Array.new(dt)}
    tablemonth = Array.new(5){Array.new(dm)}
    x_axd = Array.new(dt)
    x_axm = Array.new(dm)
    for i in (1..5)
      for j in (1..dt)
        tableday[i-1][j-1] = Status.get_count_day(i, j)
        x_axd[j-1] = j.days.ago.strftime('%m-%d')
      end
      for j in (1..dm)
        tablemonth[i-1][j-1] = Status.get_count_month(i, j)
        x_axm[j-1] = j.months.ago.strftime('%m %Y')
      end
    end

    @chartday = LazyHighCharts::HighChart.new('graph') do |f|
      # f.title(text: "Activity for the past few days")
      f.xAxis(categories: x_axd.reverse)
      for i in (1..@statuses.count)
        f.series(name: Status.find(i).name, yAxis: 0, data: tableday[i-1].reverse)
      end
      f.yAxis [
        {title: {text: "no of applicants"}, plotLines: [{value: 0, width: 1, color: '#808080'}] }
      ]
      f.legend({layout: 'horizontal'})
      f.plotOptions({line: {marker: "{enabled: false}", lineWidth: 1}})
      # f.chart({defaultSeriesType: "column"})
    end

    @chartmonth = LazyHighCharts::HighChart.new('graph') do |f|
      # f.title(text: "Activity for the past few days")
      f.xAxis(categories: x_axm.reverse)
      for i in (1..@statuses.count)
        f.series(name: Status.find(i).name, yAxis: 0, data: tablemonth[i-1].reverse)
      end
      f.yAxis [
        {title: {text: "no of applicants"}, plotLines: [{value: 0, width: 1, color: '#808080'}] }
      ]
      f.legend({layout: 'horizontal'})
      # f.legend({itemStyle: '{"fontSize": "15px"}'})
      # f.chart({defaultSeriesType: "column"})
    end
  end

  def dashboard
    @statuses = Status.all
    # for 30 days prior today for all status
    dt = 7
    tableday = Array.new(5){Array.new(dt)}
    x_axd = Array.new(dt)
    for i in (1..5)
      for j in (1..dt)
        tableday[i-1][j-1] = Status.get_count_day(i, j)
        x_axd[j-1] = j.days.ago.strftime('%m-%d')
      end
    end

    @chartday = LazyHighCharts::HighChart.new('graph') do |f|
      # f.title(text: "Activity for the past few days")
      f.xAxis(categories: x_axd.reverse)
      for i in (1..@statuses.count)
        f.series(name: Status.find(i).name, yAxis: 0, data: tableday[i-1].reverse)
      end
      f.yAxis [
        {title: {text: "no of applicants"}, plotLines: [{value: 0, width: 1, color: '#808080'}] }
      ]
      f.legend({layout: 'horizontal'})
      # f.plotOptions({line: {marker: "{enabled: false}", lineWidth: 1}})
      # f.chart({defaultSeriesType: "column"})
    end
  end
end
