//
//  AppDelegate.m
//  OSMOSXMapKit
//
//  Created by Carson on 1/26/14.
//  Copyright (c) 2014 Carson McDonald. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    MKTileOverlay *osmOverlay = [[MKTileOverlay alloc] initWithURLTemplate:@"http://c.tile.openstreetmap.org/{z}/{x}/{y}.png"];
    
    // This lets MapKit know that the provided tiles can replace the MapKit provided
    // tiles, when this is set to YES the MapKit tiles will not be rendered.
    osmOverlay.canReplaceMapContent = YES;
    
    [_mapView addOverlay:osmOverlay];
}

- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id <MKOverlay>)overlay
{
    return [[MKTileOverlayRenderer alloc] initWithTileOverlay:overlay];
}

@end
