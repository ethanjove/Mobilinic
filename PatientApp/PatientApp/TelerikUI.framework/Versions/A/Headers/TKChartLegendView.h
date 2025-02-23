//
//  TkChartLegendView.h
//
//  Copyright (c) 2013 Telerik. All rights reserved.
//

#import "TKChartLegendContainer.h"
#import "TKChartLegendStyle.h"
#import "TKView.h"

@class TKChart;

/**
 @discussion The legend in TKChart.
 */
@interface TKChartLegendView : TKView

/**
 The text title of the legend.
 @return A UILanbel representing the title of the legend.
 */
@property (nonatomic, strong, readonly) UILabel *titleLabel;

/**
 The container that contains legend items.
 @return A TKChartLegendContainer containing legend items.
 */
@property (nonatomic, strong, readonly) TKChartLegendContainer *container;

/**
 The legend's chart.
 */
@property (nonatomic, weak) TKChart *chart;

/**
 Determines visibility of legend title. By default, it is NO.
 */
@property (nonatomic, assign) BOOL showTitle;

/**
 Determines whether tapping on legend items will change selection. By default, it is YES.
 */
@property (nonatomic, assign) BOOL allowSelection;

/**
 The legend's style.
 */
@property (nonatomic, strong) TKChartLegendStyle *style;

/**
 Initializes the legend with a TKChart instance.
 @param chart The associated TKChart instance.
 */
- (id)initWithChart:(TKChart*)chart;

/**
 Reloads the legends view.
 */
- (void)reloadItems;


@end
