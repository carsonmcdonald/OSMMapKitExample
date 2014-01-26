#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    MKTileOverlay *osmOverlay = [[MKTileOverlay alloc] initWithURLTemplate:@"http://c.tile.openstreetmap.org/{z}/{x}/{y}.png"];
    [_mapView addOverlay:osmOverlay];
}

- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id <MKOverlay>)overlay
{
    return [[MKTileOverlayRenderer alloc] initWithTileOverlay:overlay];
}

@end
