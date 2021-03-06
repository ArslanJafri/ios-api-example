#import "BlueSphereChangeHeading.h"
@import Wrld;


@interface BlueSphereChangeHeading ()

@property (nonatomic) WRLDMapView *mapView;

@end

@implementation BlueSphereChangeHeading
{
    NSTimer *myTimer;
    float heading;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _mapView = [[WRLDMapView alloc] initWithFrame:self.view.bounds];
    
    _mapView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    [_mapView setCenterCoordinate:CLLocationCoordinate2DMake(56.459721, -2.977541)
                        zoomLevel:18
                         animated:NO];
    
    [self.view addSubview:_mapView];
    
    WRLDBlueSphere* bluesphere;
    bluesphere = [_mapView blueSphere];
    [bluesphere setEnabled:YES];
    [bluesphere setCoordinate:CLLocationCoordinate2DMake(56.459721, -2.977541)
                    heading:0];
    
    myTimer = [NSTimer scheduledTimerWithTimeInterval:2
                                               target:self
                                             selector:@selector(rotateBlueSphere:)
                                             userInfo:bluesphere
                                              repeats:YES];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [myTimer invalidate];
    myTimer = nil;
}

- (void)rotateBlueSphere:(NSTimer *)timer
{
    WRLDBlueSphere* bluesphere = timer.userInfo;
    bluesphere.heading += 45;
}

@end
