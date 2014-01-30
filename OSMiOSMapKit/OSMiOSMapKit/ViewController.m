#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    NSDictionary *tileSources;
    CLLocationManager *locationManager;
    CLLocation *originalLocation;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    originalLocation = nil;
    tileSources = @{@"Open Streetmap Default": @"http://c.tile.openstreetmap.org/{z}/{x}/{y}.png",
                    @"Map Quest Open Aerial": @"http://otile1.mqcdn.com/tiles/1.0.0/sat/{z}/{x}/{y}.jpg"};
    
    MKTileOverlay *osmOverlay = [[MKTileOverlay alloc] initWithURLTemplate:tileSources[@"Open Streetmap Default"]];
    
    // This lets MapKit know that the provided tiles can replace the MapKit provided
    // tiles, when this is set to YES the MapKit tiles will not be rendered.
    osmOverlay.canReplaceMapContent = YES;
    
    [_mapView addOverlay:osmOverlay];
    
    _mapView.userTrackingMode = MKUserTrackingModeFollow;
    _mapView.showsUserLocation = YES;
    
    // Set up to track location to zoom into the initial location
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers;
    [locationManager startUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    if(originalLocation == nil && newLocation != nil)
    {
        originalLocation = newLocation;

        MKCoordinateRegion region;
        region.center = originalLocation.coordinate;
        region.span.latitudeDelta = 0.25;
        region.span.longitudeDelta = 0.25;
        [_mapView setRegion:region animated:YES];
        
        [locationManager stopUpdatingLocation];
    }
}

- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id <MKOverlay>)overlay
{
    return [[MKTileOverlayRenderer alloc] initWithTileOverlay:overlay];
}

@end
