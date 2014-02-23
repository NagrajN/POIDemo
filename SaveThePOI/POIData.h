//
//  POIData.h
//  SaveThePOI
//
//  Created by nagrajn on 2/23/14.
//  Copyright (c) 2014 nagrajn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface POIData : NSObject <NSCoding>{

    NSString *searchText;
    NSString *latitude;
    NSString *longitude;
    
}

@property (nonatomic, copy) NSString *searchText;
@property (nonatomic, copy) NSString *latitude;
@property (nonatomic, copy) NSString *longitude;

@end
