//
//  DashboardVCViewController.swift
//  PatientApp
//
//  Created by Apple on 2/15/15.
//  Copyright (c) 2015 Mobilinic. All rights reserved.
//

import UIKit
import Foundation

class DashboardVC: UIViewController {

    @IBOutlet weak var mainScrollView: UIScrollView!
    
    var heartbitTimer : NSTimer? = nil
    var heartbit : Int = 60
    var animateHeartbit : Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.mainScrollView.contentSize.height=UIScreen.mainScreen().bounds.size.height;

        
        
        setupCurrentHeartbitChart()
        drawHeartbit();
        setupEcgHistoryChart()
        setupBodyTemperatureHistoryChart()
        setupSpO2HistoryChart()
        
        // Do any additional setup after loading the view.
    }
    
    
    
    //  ==== HEART BITS  ========

    func setupCurrentHeartbitChart() {
        let ecgData = NSMutableArray()
        
        ecgData.addObject(TKChartDataPoint(x: 1, y:0))
        ecgData.addObject(TKChartDataPoint(x: 2, y:0))
        ecgData.addObject(TKChartDataPoint(x: 3, y:3))
        ecgData.addObject(TKChartDataPoint(x: 4, y:8))
        ecgData.addObject(TKChartDataPoint(x: 5, y:0))
        ecgData.addObject(TKChartDataPoint(x: 6, y:-2))
        ecgData.addObject(TKChartDataPoint(x: 7, y:-10))
        ecgData.addObject(TKChartDataPoint(x: 8, y:100))
        ecgData.addObject(TKChartDataPoint(x: 9, y:-20))
        ecgData.addObject(TKChartDataPoint(x: 10, y:-5))
        ecgData.addObject(TKChartDataPoint(x: 11, y:0))
        ecgData.addObject(TKChartDataPoint(x: 13, y:3))
        ecgData.addObject(TKChartDataPoint(x: 14, y:8))
        ecgData.addObject(TKChartDataPoint(x: 15, y:0))
        ecgData.addObject(TKChartDataPoint(x: 16, y:0))
        
        /*
        for i in 1...1000 {
        ecgData.addObject(TKChartDataPoint(x: (i+1), y: Int(arc4random()%100)))
        
        }
        */
        
        self.currentHeartbitChart.hidden = true;
        
        var series:TKChartSeries
        series = TKChartSplineSeries(items:ecgData as [AnyObject])
        
        series.style.palette = TKChartPalette()
        let paletteItem = TKChartPaletteItem()
        paletteItem.stroke = TKStroke(color: UIColor.redColor())
        paletteItem.stroke.width = 2
        series.style.palette.addPaletteItem(paletteItem)

        let xAxis = TKChartNumericAxis(minimum: 1, andMaximum: 16)
        xAxis.position = TKChartAxisPosition.Bottom
        xAxis.style.lineHidden = true
        xAxis.style.majorTickStyle.ticksHidden = true
        xAxis.style.labelStyle.textHidden = true
        self.currentHeartbitChart.xAxis = xAxis
        
        let yAxis = TKChartNumericAxis(minimum: -30, andMaximum: 120)
        yAxis.position = TKChartAxisPosition.Left
        yAxis.style.lineHidden = true
        yAxis.style.majorTickStyle.ticksHidden = true
        yAxis.style.labelStyle.textHidden = true
        self.currentHeartbitChart.yAxis = yAxis
        
        self.currentHeartbitChart.allowAnimations = true
        self.currentHeartbitChart.title().hidden = false
        
        
        self.currentHeartbitChart.addSeries(series)

    }
    
   
    func drawHeartbit() {
        if (self.animateHeartbit == true) {
        let interval  = (Double(60) / Double(self.heartbit))
        self.heartbitTimer = NSTimer.scheduledTimerWithTimeInterval(interval, target: self, selector: Selector("drawHeartbit"), userInfo: nil, repeats: false)
        }
        self.currentHeartbitChart.hidden = false;
        self.currentHeartbitChart.reloadData();
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @IBOutlet weak var heartbitHistoryChart: TKChart!

    
    @IBOutlet weak var currentHeartbitChart: TKChart!
    @IBOutlet weak var currentBpmLabel: UILabel!
    
    
    @IBAction func slow(sender: AnyObject) {
        self.heartbit = 40
        self.currentBpmLabel.text = "40"
    }
  
    @IBAction func normal(sender: AnyObject) {
        self.heartbit = 60
        self.currentBpmLabel.text = "60"
    }
    
    @IBAction func fast(sender: AnyObject) {
        self.heartbit = 90
        self.currentBpmLabel.text = "90"
    }
    
    @IBAction func tapGestureCurrentHeartbitChartView(sender: AnyObject) {
        
        if (self.animateHeartbit == true) {
            self.animateHeartbit = false
        } else {
            self.animateHeartbit = true
            drawHeartbit()
        }
    }
    
    //  ===  ECG STATUS HISTORY   =====
    
    @IBOutlet weak var EcgHistoryScrollView: UIScrollView!
    
    @IBOutlet weak var ecgHistoryChart: TKChart!
    
    func setupEcgHistoryChart() {
        
        EcgHistoryScrollView.contentSize.width = 1000
        
        var dataPoints = [TKChartDataPoint]()
        
        let values = [957,983,974,939,980,954,990,991,1023,1010,1038,977,936,964,973,910,1949,1183,975,960,937,974,945,977,1006,1022,1022,1032,1031,1008,980,938]
        //let values = [36.5, 35.5, 36.2, 37.1, 0, 36, 36, 36, 37, 36, 0, 36, 36, 37, 36]
        
        for var sec = 0; sec < 10; ++sec {
            for var i = 0; i < values.count; ++i {
                dataPoints.append(TKChartDataPoint(x: dataPoints.count+1, y: values[i]))
            }
        }
        
        
        let lineSeries = TKChartLineSeries(items: dataPoints)
        lineSeries.style.palette = TKChartPalette()
        let strokeRed = TKStroke(color: UIColor.redColor(), width: 1.5)
        lineSeries.style.palette.addPaletteItem(TKChartPaletteItem(stroke: strokeRed))
        self.ecgHistoryChart.addSeries(lineSeries)
        
        let yAxis = TKChartNumericAxis(minimum: minElement(values), andMaximum: maxElement(values))
        yAxis.position = TKChartAxisPosition.Left
        yAxis.offset = 0
        yAxis.baseline = 0
        self.ecgHistoryChart.yAxis = yAxis
        self.ecgHistoryChart.yAxis.style.majorTickStyle.ticksHidden = true
        self.ecgHistoryChart.yAxis.style.labelStyle.textHidden = true
    
        let axisColor = TKStroke(color: UIColor.redColor(), width: 0)
        self.ecgHistoryChart.xAxis.style.lineStroke = axisColor
        //self.ecgHistoryChart.xAxis.hidden = true
        self.ecgHistoryChart.xAxis.style.majorTickStyle.ticksHidden = true
        self.ecgHistoryChart.xAxis.style.labelStyle.textHidden = true
    }
    
    
    //  === BODY TEMPERATURE ===
    
    @IBOutlet weak var BodyTemperatureHistoryScrollView: UIScrollView!
    @IBOutlet weak var bodyTemperatureHistoryChart: TKChart!
    
    func setupBodyTemperatureHistoryChart() {
        
        BodyTemperatureHistoryScrollView.contentSize.width = 1000
        
        var normalValueDataPoints = [TKChartDataPoint]()
        var highValueDataPoints = [TKChartDataPoint]()
        
        let normalValues = [36.5, 35.5, 36.2, 37.1, 0, 36, 36, 36, 37, 36, 0, 36, 36, 37, 36]
        
        for var repeat=0 ; repeat<3; ++repeat {
            for var i = 0; i < normalValues.count; ++i {
                normalValueDataPoints.append(TKChartDataPoint(x: normalValueDataPoints.count, y: normalValues[i]))
            }
        }
        
        let highValues = [0, 0, 0, 0, 38.0, 0, 0, 0, 0, 0, 39, 0, 0, 0, 0]
        
        for var repeat=0 ; repeat<3; ++repeat {
            for var i = 0; i < highValues.count; ++i {
                highValueDataPoints.append(TKChartDataPoint(x: highValueDataPoints.count, y: highValues[i]))
            }
        }
        
        let stackInfo = TKChartStackInfo(ID: 1, withStackMode: TKChartStackMode.Stack)
        
        let seriesNormal = TKChartColumnSeries(items: normalValueDataPoints)
        seriesNormal.stackInfo = stackInfo
        seriesNormal.minColumnWidth = 7
        seriesNormal.maxColumnWidth = 7
        
        seriesNormal.style.palette = TKChartPalette()
        let paletteItemNormal = TKChartPaletteItem()
        paletteItemNormal.fill = TKSolidFill(color: UIColor(red: 76.0 / 255.0, green: 175.0 / 255.0, blue: 80.0 / 255.0, alpha: 1))
        paletteItemNormal.stroke = TKStroke(color: UIColor(red: 102.0 / 255.0, green: 187.0 / 255.0, blue: 106.0 / 255.0, alpha: 1))
        seriesNormal.style.palette.addPaletteItem(paletteItemNormal)
        
        self.bodyTemperatureHistoryChart.addSeries(seriesNormal)
        
        
        let seriesHigh = TKChartColumnSeries(items: highValueDataPoints)
        seriesHigh.stackInfo = stackInfo
        seriesHigh.minColumnWidth = 7
        seriesHigh.maxColumnWidth = 7
        
        seriesHigh.style.palette = TKChartPalette()
        let paletteItemHigh = TKChartPaletteItem()
        paletteItemHigh.fill = TKSolidFill(color: UIColor.orangeColor())
        paletteItemHigh.stroke = TKStroke(color: UIColor.orangeColor())
        seriesHigh.style.palette.addPaletteItem(paletteItemHigh)
        
        self.bodyTemperatureHistoryChart.addSeries(seriesHigh)
        
        let xAxis = TKChartNumericAxis(minimum: -1, andMaximum: 45)
        xAxis.position = TKChartAxisPosition.Bottom
        xAxis.style.lineHidden = true
        xAxis.style.majorTickStyle.ticksHidden = true
        xAxis.style.labelStyle.textHidden = true
        self.bodyTemperatureHistoryChart.xAxis = xAxis

        var maxTemp : Double = 0
        maxTemp = maxElement(highValues)
        if maxTemp == 0 {let maxTemp = maxElement(normalValues)}
        
        var minTemp : Double = 1000;
        
        for var i = 0; i < normalValues.count; ++i {
            if (normalValues[i]>0) && (normalValues[i]<minTemp) {minTemp = normalValues[i]}
        }
        
        if minTemp==1000 {
            for var i = 0; i < normalValues.count; ++i {
                if (highValues[i]>0) && (highValues[i]<minTemp) {minTemp = highValues[i]}
            }
        }
        
        minTemp = minTemp - 2;
        
        let yAxis = TKChartNumericAxis(minimum: minTemp, andMaximum: maxTemp)
        yAxis.position = TKChartAxisPosition.Left
        yAxis.style.lineHidden = true
        yAxis.style.majorTickStyle.ticksHidden = true
        yAxis.style.labelStyle.textHidden = true
        self.bodyTemperatureHistoryChart.yAxis = yAxis
        
    }
    
    //  === SPO2 ===
    
    @IBOutlet weak var spO2HistoryScrollView: UIScrollView!
    @IBOutlet weak var spO2HistoryChart: TKChart!
    
    func setupSpO2HistoryChart() {
        
        spO2HistoryScrollView.contentSize.width = 1000
        
        var dataPoints = [TKChartDataPoint]()
        
        let values = [94.5, 94.5, 94.2, 94.1, 94, 96.1, 96, 96.1, 97.1, 96.2, 96, 95.2, 95.1, 94.8, 94]
        
        for var repeat=0 ; repeat<3; ++repeat {
            for var i = 0; i < values.count; ++i {
                dataPoints.append(TKChartDataPoint(x: dataPoints.count, y: values[i]))
            }
        }
        
        let series = TKChartSplineAreaSeries(items: dataPoints)
        self.spO2HistoryChart.addSeries(series)
        
        let xAxis = TKChartNumericAxis(minimum: -1, andMaximum: 45)
        xAxis.position = TKChartAxisPosition.Bottom
        xAxis.style.lineHidden = true
        xAxis.style.majorTickStyle.ticksHidden = true
        xAxis.style.labelStyle.textHidden = true
        self.spO2HistoryChart.xAxis = xAxis
        
        var maxValue = maxElement(values)
        var minValue = minElement(values)
        
        let yAxis = TKChartNumericAxis(minimum: minValue-2, andMaximum: maxValue)
        yAxis.position = TKChartAxisPosition.Left
        yAxis.style.lineHidden = true
        yAxis.style.majorTickStyle.ticksHidden = true
        yAxis.style.labelStyle.textHidden = true
        self.spO2HistoryChart.yAxis = yAxis
        
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
