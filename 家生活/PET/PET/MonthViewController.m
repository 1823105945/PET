//
//  MonthViewController.m
//  PET
//
//  Created by liu_yakai on 16/10/10.
//  Copyright © 2016年 liu_yakai. All rights reserved.
//

#import "MonthViewController.h"
#import "BluetoothObject.h"
#import "FSLineChart.h"
#import "UIColor+FSPalette.h"
#import "TWRChart.h"

@interface MonthViewController (){
    NSInteger index;
}
@property (weak, nonatomic) IBOutlet UILabel *timeLable;
@property(strong, nonatomic) IBOutlet TWRChartView *chartView;
@property (nonatomic, strong) IBOutlet FSLineChart *chart;

@end

@implementation MonthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    index=0;
    self.timeLable.text=[NSString stringWithFormat:@"%@-%@",[self dateTime:index-30],[self dateTime:index]];
    [self loadChartWithDates];
    [self loadBarChart];

}

- (IBAction)beforeClock:(id)sender {
    UIButton *button=(UIButton *)sender;
    if (button.tag==1000) {
        index=index-30;
        self.timeLable.text=[NSString stringWithFormat:@"%@-%@",[self dateTime:index-30],[self dateTime:index]];
    }else{
        index=index+30;
        self.timeLable.text=[NSString stringWithFormat:@"%@-%@",[self dateTime:index],[self dateTime:index+30]];
    }
}

-(NSString *)dateTime:(NSInteger)n{
    return [BluetoothObject getNDay:n];
}

//绘制折线统计图
- (void)loadChartWithDates {
    // Generating some dummy data
    NSMutableArray* chartData = [NSMutableArray arrayWithCapacity:7];
    for(int i=0;i<7;i++) {
        chartData[i] = [NSNumber numberWithFloat: (float)i / 30.0f + (float)(rand() % 100) / 500.0f];
    }
    
    NSArray* months = @[@"January", @"February", @"March", @"April", @"May", @"June", @"July"];
    
    // Setting up the line chart
    self.chart.verticalGridStep = 6;
    self.chart.horizontalGridStep = 6;
    self.chart.fillColor = nil;
    self.chart.displayDataPoint = YES;
    self.chart.dataPointColor = [UIColor fsOrange];
    self.chart.dataPointBackgroundColor = [UIColor fsOrange];
    self.chart.dataPointRadius = 2;
    self.chart.color = [self.chart.dataPointColor colorWithAlphaComponent:0.3];
    self.chart.valueLabelPosition = ValueLabelLeftMirrored;
    
    self.chart.labelForIndex = ^(NSUInteger item) {
        return months[item];
    };
    
    //    self.chart.labelForValue = ^(CGFloat value) {
    //        return [NSString stringWithFormat:@"%.02f €", value];
    //    };
    
    [self.chart setChartData:chartData];
}

//绘制助兴统计图
- (void)loadBarChart {
    //    NSString *jsFilePath = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"js"];
    //    [_chartView setChartJsFilePath:jsFilePath];
    // Build chart data
    TWRDataSet *dataSet1 = [[TWRDataSet alloc] initWithDataPoints:@[@10, @15, @5, @15, @5]
                                                        fillColor:[[UIColor orangeColor] colorWithAlphaComponent:0.5]
                                                      strokeColor:[UIColor orangeColor]];
    
    TWRDataSet *dataSet2 = [[TWRDataSet alloc] initWithDataPoints:@[@5, @10, @5, @15, @10]
                                                        fillColor:[[UIColor redColor] colorWithAlphaComponent:0.5]
                                                      strokeColor:[UIColor redColor]];
    
    NSArray *labels = @[@"A", @"B", @"C", @"D", @"E"];
    TWRBarChart *bar = [[TWRBarChart alloc] initWithLabels:labels
                                                  dataSets:@[dataSet1, dataSet2]
                                                  animated:YES];
    // Load data
    [_chartView loadBarChart:bar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
