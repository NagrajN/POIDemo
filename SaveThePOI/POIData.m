//
//  POIData.m
//  SaveThePOI
//
//  Created by nagrajn on 2/23/14.
//  Copyright (c) 2014 nagrajn. All rights reserved.
//

#import "POIData.h"

@implementation POIData


@synthesize searchText;
@synthesize latitude;
@synthesize longitude;

- (id)initWithCoder:(NSCoder *)aDecoder {
    
    if(self = [super init]) {
        
        self.searchText = [aDecoder decodeObjectForKey:@"searchText"];
        self.latitude = [aDecoder decodeObjectForKey:@"latitude"];
        self.longitude = [aDecoder decodeObjectForKey:@"longitude"];
        
    }
    
    return self;
    
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    
    [aCoder encodeObject:searchText forKey:@"searchText"];
    [aCoder encodeObject:latitude forKey:@"latitude"];
    [aCoder encodeObject:longitude forKey:@"longitude"];
    
}

@end
