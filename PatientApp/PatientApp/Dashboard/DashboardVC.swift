//
//  DashboardVCViewController.swift
//  PatientApp
//
//  Created by Apple on 2/15/15.
//  Copyright (c) 2015 Mobilinic. All rights reserved.
//

import UIKit

class DashboardVC: UIViewController {

    var heartbitTimer : NSTimer? = nil
    var heartbit : Int = 60
    var animateHeartbit : Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCurrentHeartbitChart()
        //setupHeartbitHistoryChart()
        drawHeartbit();
        
        // Do any additional setup after loading the view.
    }

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
        
        currentHeartbitChart.hidden = true;
        
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
        currentHeartbitChart.xAxis = xAxis
        
        let yAxis = TKChartNumericAxis(minimum: -30, andMaximum: 120)
        yAxis.position = TKChartAxisPosition.Left
        yAxis.style.lineHidden = true
        yAxis.style.majorTickStyle.ticksHidden = true
        yAxis.style.labelStyle.textHidden = true
        currentHeartbitChart.yAxis = yAxis
        
        currentHeartbitChart.allowAnimations = true
        currentHeartbitChart.title().hidden = false
        
        
        currentHeartbitChart.addSeries(series)

    }
    
    /*
    func setupHeartbitHistoryChart() {
        let heartbits = NSMutableArray()
        
        heartbits.addObject(TKChartDataPoint(x: 1, y:60))
        heartbits.addObject(TKChartDataPoint(x: 2, y:60))
        heartbits.addObject(TKChartDataPoint(x: 3, y:63))
        heartbits.addObject(TKChartDataPoint(x: 4, y:61))
        heartbits.addObject(TKChartDataPoint(x: 5, y:60))
        heartbits.addObject(TKChartDataPoint(x: 6, y:60))
        heartbits.addObject(TKChartDataPoint(x: 7, y:58))
        heartbits.addObject(TKChartDataPoint(x: 8, y:57))
        heartbits.addObject(TKChartDataPoint(x: 9, y:60))
        heartbits.addObject(TKChartDataPoint(x: 10, y:65))
        heartbits.addObject(TKChartDataPoint(x: 11, y:68))
        heartbits.addObject(TKChartDataPoint(x: 13, y:70))
        heartbits.addObject(TKChartDataPoint(x: 14, y:80))
        heartbits.addObject(TKChartDataPoint(x: 15, y:70))
        heartbits.addObject(TKChartDataPoint(x: 16, y:60))
        
        /*
        for i in 1...1000 {
        ecgData.addObject(TKChartDataPoint(x: (i+1), y: Int(arc4random()%100)))
        
        }
        */
        
        
        var series:TKChartSeries
        series = TKChartSplineSeries(items:heartbits as [AnyObject])
        
        let xAxis = TKChartNumericAxis(minimum: 1, andMaximum: 16)
        xAxis.position = TKChartAxisPosition.Bottom
        //xAxis.style.lineHidden = true
        //xAxis.style.majorTickStyle.ticksHidden = true
        xAxis.style.labelStyle.textHidden = true
        xAxis.majorTickInterval = 1
        xAxis.minorTickInterval = 1
        heartbitHistoryChart.xAxis = xAxis
        
        let yAxis = TKChartNumericAxis(minimum: 30, andMaximum: 90)
        yAxis.position = TKChartAxisPosition.Left
        //yAxis.style.lineHidden = true
        //yAxis.style.majorTickStyle.ticksHidden = true
        //yAxis.style.labelStyle.textHidden = true
        heartbitHistoryChart.yAxis = yAxis
        
        heartbitHistoryChart.allowAnimations = false
        heartbitHistoryChart.title().hidden = false
        
        heartbitHistoryChart.addSeries(series)
        heartbitHistoryChart.hidden = false
        
    }
    */

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
    
    
    @IBOutlet weak var heartbitHistoryChart: TKChart!
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
