class PerformanceController < ApplicationController
  def index
    @statuses = Status.all
    @chart1 = LazyHighCharts::HighChart.new('graph') do |f|
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
    @statuses = Status.all
    @chart = LazyHighCharts::HighChart.new('graph') do |f|
      # f.title(text: "Activity for the past few days")
      f.xAxis(categories: ["Nov 21", "Nov 22", "Nov 23", "Nov 24", "Nov 25"])
      @statuses.each do |v, k|
        # f.series(name: v.name, yAxis: k, data: [14119, 5068, 4985, 3339, 2656])
      end
      f.series(name: "GDP in Billions", yAxis: 0, data: [1000, 900, 800, 700, 500])
      f.series(name: "Population in Millions", yAxis: 0, data: [310, 127, 1340, 81, 65])

      f.yAxis [
        {title: {text: "no of applicants"}, plotLines: [{value: 0, width: 1, color: '#808080'}] }
      ]

      # f.legend(align: 'center', verticalAlign: 'top', y: 75, x: -50, layout: 'vertical')
      # f.chart({defaultSeriesType: "column"})
    end
  end
end
