#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    MKTileOverlay *osmOverlay = [[MKTileOverlay alloc] initWithURLTemplate:@"http://c.tile.openstreetmap.org/{z}/{x}/{y}.png"];
    
    // This lets MapKit know that the provided tiles can replace the MapKit provided
    // tiles, when this is set to YES the MapKit tiles will not be rendered.
    osmOverlay.canReplaceMapContent = YES;
    
    [_mapView addOverlay:osmOverlay];
    
    _mapView.userTrackingMode = MKUserTrackingModeFollow;
    _mapView.showsUserLocation = YES;
}

- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id <MKOverlay>)overlay
{
    return [[MKTileOverlayRenderer alloc] initWithTileOverlay:overlay];
}

@end
