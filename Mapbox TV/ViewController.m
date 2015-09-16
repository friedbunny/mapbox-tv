//
//  ViewController.m
//  Mapbox TV
//
//  Created by Jason Wray on 9/12/15.
//  Copyright © 2015 Mapbox. All rights reserved.
//

#import "ViewController.h"
#import "Mapbox.h"

@interface ViewController () <MGLMapViewDelegate>

@property (strong, nonatomic) MGLMapView *mapView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.mapView = [[MGLMapView alloc] initWithFrame:self.view.bounds];
    self.mapView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.mapView.delegate = self;
    
    [self.view addSubview:self.mapView];
}

- (void)viewDidAppear:(BOOL)animated
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        MGLMapCamera *camera = [MGLMapCamera cameraLookingAtCenterCoordinate:CLLocationCoordinate2DMake(37.7757158, -122.4136878) fromDistance:100000 pitch:60 heading:180];
        
        [self.mapView setCamera:camera withDuration:10.f animationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
    });
}

@end
