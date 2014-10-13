//
//  LocationDetailsViewController.h
//  MyLocations
//
//  Created by jfl913 on 14-5-11.
//  Copyright (c) 2014年 jfl913. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LocationDetailsViewController : UITableViewController

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, strong) CLPlacemark *placemark;

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

@end
