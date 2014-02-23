//
//  SaveThePOIFirstViewController.m
//  SaveThePOI
//
//  Created by nagrajn on 2/23/14.
//  Copyright (c) 2014 nagrajn. All rights reserved.
//

#import "POIMapController.h"
#import <MapKit/MapKit.h>
#import "POIAppDelegate.h"
#import "POIData.h"

@interface SaveThePOIFirstViewController () <UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet MKMapView *poiView;

@end

@implementation SaveThePOIFirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    _searchBar.delegate = self;
}

-(void) searchBarCancelButtonClicked:(UISearchBar *)searchBar {
        _searchBar.text = @"";
    }


-(void) updateMap:(CLLocationCoordinate2D)mapLocation {
    
    CLLocationCoordinate2D location;
    location.latitude = mapLocation.latitude;
    location.longitude = mapLocation.longitude;
    
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(location, 0.5 *  1609.344, 0.5 *  1609.344);
    
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    [point setCoordinate:mapLocation];
    [point setTitle:[NSString stringWithFormat:@"%1$f , %2$f", location.latitude, location.longitude ]];
    [point setSubtitle:_searchBar.text];
    
    [_poiView addAnnotation:point];
    
    [_poiView setRegion:viewRegion animated:YES];
    
    SaveThePOIAppDelegate *appDelegate = (SaveThePOIAppDelegate *)[[UIApplication sharedApplication] delegate];
    
    POIData *poi = [[POIData alloc]init];
    
    poi.searchText = _searchBar.text;
    poi.latitude = [NSString stringWithFormat:@"%f", location.latitude];
    poi.longitude = [NSString stringWithFormat:@"%f", location.longitude];
    
    [appDelegate addPOI:poi];
    
}

-(void) searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    
    [self.view endEditing:YES];
    
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),
                   
                   
                   ^{
                       
                       CFStringRef encodedString =
                        CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                (__bridge CFStringRef)(searchBar.text),
                                                                NULL,
                                                                CFSTR(":/?#[]@!$&'()*+,;="),
                                                                kCFStringEncodingUTF8);
                       
                
                       NSString *urlString = [NSString stringWithFormat:@"http://maps.googleapis.com/maps/api/geocode/json?address=%1$@&sensor=false", encodedString];
                       
                       NSData* data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString ]];
                       
                       
                       NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:NULL];
                       
                       NSArray *results = [dict objectForKey:@"results"];
                       
                       if ([results count] != 0) {
                       
                       CGFloat latitude = (CGFloat)[[[[results[0] objectForKey:@"geometry"] objectForKey:@"location"] objectForKey:@"lat"]floatValue];
                       
                        CGFloat longitude = (CGFloat)[[[[results[0] objectForKey:@"geometry"] objectForKey:@"location"] objectForKey:@"lng"] floatValue];
                       
                       
                       CLLocationCoordinate2D mapLocation = CLLocationCoordinate2DMake(latitude, longitude)  ;
                       
                       
                        dispatch_async(dispatch_get_main_queue(),
                                         
                                         ^{
                                             
                                             [self updateMap:mapLocation];
                                         }
                                         
                                       );
                           
                       }
                       
                       
                   }
                   
                   
                   );
    

    
}

-(void) viewWillAppear:(BOOL)animated
{
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
