//
//  SaveThePOIAppDelegate.h
//  SaveThePOI
//
//  Created by nagrajn on 2/23/14.
//  Copyright (c) 2014 nagrajn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "POIData.h"

@interface SaveThePOIAppDelegate : UIResponder <UIApplicationDelegate> {
    
}

-(void) addPOI:(POIData *)poiData;
-(NSMutableArray *) getPOIArray;

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) NSMutableArray *poiArray;



@end
