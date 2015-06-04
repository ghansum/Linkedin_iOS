//
//  Location.h
//  SlideOutMenu
//
//  Created by Nourdine GHANSUM on 16/04/15.
//  Copyright (c) 2015 Archetapp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Location : NSObject  {
    NSString *_name;
    NSString *_address;
    CLLocationCoordinate2D _coordinate;
}

@property (copy) NSString *name;
@property (copy) NSString *address;
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

- (id)initWithName:(NSString*)name address:(NSString*)address coordinate:(CLLocationCoordinate2D)coordinate;


@end
