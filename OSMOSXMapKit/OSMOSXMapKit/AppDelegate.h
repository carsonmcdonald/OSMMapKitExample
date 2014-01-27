//
//  AppDelegate.h
//  OSMOSXMapKit
//
//  Created by Carson on 1/26/14.
//  Copyright (c) 2014 Carson McDonald. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <MapKit/MapKit.h>

@interface AppDelegate : NSObject <NSApplicationDelegate, MKMapViewDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet MKMapView *mapView;

@end
