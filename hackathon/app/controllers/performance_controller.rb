class PerformanceController < ApplicationController
  def index
    @statuses = Status.all
    # for 30 days prior today for all status
    table = Array.new(5){Array.new(30)}
    for i in (1..5)
      for j in (30..1)
        table[i-1][j-1] = Status.GetStatus(i, j.days.ago)
      end
    end

    @chart1 = LazyHighCharts::HighChart.new('graph') do |f|
      # f.title(text: "Activity for the past few days")
      f.xAxis(categories: (30..1).to_a)

      f.series(name: Status.find(1).name, yAxis: 0, data: table[0])
      f.series(name: Status.find(2).name, yAxis: 0, data: table[1])
      f.series(name: Status.find(3).name, yAxis: 0, data: table[2])
      f.series(name: Status.find(4).name, yAxis: 0, data: table[3])
      f.series(name: Status.find(5).name, yAxis: 0, data: table[4])
      # f.series(name: "Population in Millions", yAxis: 0, data: [310, 127, 1340, 81, 65])

      f.yAxis [
        {title: {text: "no of applicants"}, plotLines: [{value: 0, width: 1, color: '#808080'}] }
      ]

      f.legend({itemStyle: '{"fontSize": "15px"}'})
      # f.chart({defaultSeriesType: "column"})
    end

    @chart2 = LazyHighCharts::HighChart.new('graph') do |f|
      # f.title(text: "Activity for the past few days")
      f.xAxis(categories: ["Nov 21", "Nov 22", "Nov 23", "Nov 24", "Nov 25"])
      @statuses.each do |v, k|
        # f.series(name: v.name, yAxis: k, data: [14119, 5068, 4985, 3339, 2656])
      end
      f.series(name: "GDP in Billions", yAxis: 0, data: [14119, 5068, 4985, 3339, 2656])
      f.series(name: "Population in Millions", yAxis: 0, data: [310, 127, 1340, 81, 65])

      f.yAxis [
        {title: {text: "no of applicants"}, plotLines: [{value: 0, width: 1, color: '#808080'}] }
      ]

      # f.legend(align: 'center', verticalAlign: 'top', y: 75, x: -50, layout: 'vertical')
      # f.chart({defaultSeriesType: "column"})
    end

    @chart3 = LazyHighCharts::HighChart.new('graph') do |f|
      # f.title(text: "Activity for the past few days")
      f.xAxis(categories: ["Nov 21", "Nov 22", "Nov 23", "Nov 24", "Nov 25"])
      @statuses.each do |v, k|
        # f.series(name: v.name, yAxis: k, data: [14119, 5068, 4985, 3339, 2656])
      end
      f.series(name: "GDP in Billions", yAxis: 0, data: [14119, 5068, 4985, 3339, 2656])
      f.series(name: "Population in Millions", yAxis: 0, data: [310, 127, 1340, 81, 65])

      f.yAxis [
        {title: {text: "no of applicants"}, plotLines: [{value: 0, width: 1, color: '#808080'}] }
      ]

      # f.legend(align: 'center', verticalAlign: 'top', y: 75, x: -50, layout: 'vertical')
      # f.chart({defaultSeriesType: "column"})
    end

    @chart4 = LazyHighCharts::HighChart.new('graph') do |f|
      # f.title(text: "Activity for the past few days")
      f.xAxis(categories: ["Nov 21", "Nov 22", "Nov 23", "Nov 24", "Nov 25"])
      @statuses.each do |v, k|
        # f.series(name: v.name, yAxis: k, data: [14119, 5068, 4985, 3339, 2656])
      end
      f.series(name: "GDP in Billions", yAxis: 0, data: [14119, 5068, 4985, 3339, 2656])
      f.series(name: "Population in Millions", yAxis: 0, data: [310, 127, 1340, 81, 65])

      f.yAxis [
        {title: {text: "no of applicants"}, plotLines: [{value: 0, width: 1, color: '#808080'}] }
      ]

      # f.legend(align: 'center', verticalAlign: 'top', y: 75, x: -50, layout: 'vertical')
      # f.chart({defaultSeriesType: "column"})
    end
  end

  def dashboard
    
  end
end
