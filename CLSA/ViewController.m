//
//  ViewController.m
//  CLSA
//
//  Created by Joseph Hilland on 1/1/15.
//  Copyright (c) 2015 Effect. All rights reserved.
//

#if !defined(__has_feature) || !__has_feature(objc_arc)
#error "This file requires ARC support."
#endif

#import "ViewController.h"
#import "LocationViewController.h"
#import <GoogleMaps/GoogleMaps.h>

@interface ViewController ()
@property (nonatomic, retain) CLLocationManager *locationManager;
@end

@implementation ViewController {
    GMSMapView *mapView_;
    BOOL firstLocationUpdate_;
}

_coordinatesPassed = false;
CLLocationManager *_locationAuthorizationManager;

// iOS 8 not yet supported by Google Maps API so use this method in place of
// the mapView_.myLocationEnabled = YES;
-(void)enableMyLocation {
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    
    if(status == kCLAuthorizationStatusNotDetermined) {
        [self requestLocationAuthorization];
    }
    else  {
        return;
    }
}

-(void) requestLocationAuthorization {
    _locationAuthorizationManager = [[CLLocationManager alloc] init];
    _locationAuthorizationManager.delegate = self;
    [_locationAuthorizationManager requestAlwaysAuthorization];
}

-(void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    if(status != kCLAuthorizationStatusNotDetermined) {
        [self performSelectorOnMainThread:@selector(enableMyLocation) withObject:nil waitUntilDone:[NSThread isMainThread]];
        _locationAuthorizationManager.delegate = nil;
        _locationAuthorizationManager = nil;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.theImageView.image = self.theImage;
    
    

    
    // get the coordinates passed during segue from list
    if(_coordinatesPassed == TRUE) {
        //NSLog(@"%@", _latitudeCoordinate);
        //NSLog(@"%@", _longitudeCoordinate);
        double latitudeDouble = [_latitudeCoordinate doubleValue];
        double longitudeDouble = [_longitudeCoordinate doubleValue];
        
        //NSLog(@"%f", latitudeDouble);
        //NSLog(@"%f", longitudeDouble);
        
        // now take the coordinates and pass them to GMAPS
        GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:latitudeDouble longitude:longitudeDouble zoom:18];
        
        mapView_ = [GMSMapView mapWithFrame:CGRectZero camera:camera];
        mapView_.settings.indoorPicker = YES;
        mapView_.indoorEnabled = YES;
        //mapView_.indoorDisplay.delegate = self;
        mapView_.settings.compassButton = YES;
        mapView_.settings.myLocationButton = YES;
        mapView_.myLocationEnabled = YES;
        self.view = mapView_;
        
        CLLocationCoordinate2D  position = CLLocationCoordinate2DMake(latitudeDouble, longitudeDouble);
        //GMSMarker *marker = [GMSMarker markerWithPosition:position];
        GMSMarker *marker = [[GMSMarker alloc] init];
        marker.position = position;
        marker.title = _nameCoordinate;
        marker.snippet = _buildingNumber;
        marker.appearAnimation = kGMSMarkerAnimationPop;
        marker.icon = [GMSMarker markerImageWithColor:[UIColor greenColor]];
        marker.map = mapView_;
        
        // show info menu on map
        [mapView_ setSelectedMarker:marker];
        
    }
    else {
  
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:35.0839
                                                            longitude:-106.6186
                                                                 zoom:14];
        
        mapView_ = [GMSMapView mapWithFrame:self.view.bounds camera:camera];
        mapView_.settings.compassButton = YES;
        mapView_.myLocationEnabled = YES;
        mapView_.settings.myLocationButton = YES;
        
        // listen to the mylocation property of GMSMapView
        //[mapView_ addObserver:self forKeyPath:@"myLocation" options:NSKeyValueObservingOptionNew context:NULL];
        [self locationManager];
        self.view = mapView_;
   
        
        // ask for my location data after the map has already been added to the UI
        dispatch_async(dispatch_get_main_queue(), ^{
            mapView_.myLocationEnabled = YES;
            NSLog(@"Users Location: %@", mapView_.myLocation);
        });
        
    
    }
}



-(void)dealloc {
    //[mapView_ removeObserver:self forKeyPath:@"myLocation" context:NULL];
}

#pragma mark - KVO updates

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    
    if(!firstLocationUpdate_) {
        firstLocationUpdate_ = YES;
        CLLocation *location = [change objectForKey:NSKeyValueChangeNewKey];
        [self.locationManager requestWhenInUseAuthorization];
        mapView_.camera = [GMSCameraPosition cameraWithTarget:location.coordinate zoom:14];
        
        
    }
}

@end
