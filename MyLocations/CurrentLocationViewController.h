//
//  FirstViewController.h
//  MyLocations
//
//  Created by jfl913 on 14-4-27.
//  Copyright (c) 2014年 jfl913. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface CurrentLocationViewController : UIViewController <CLLocationManagerDelegate>

@property (nonatomic, weak) IBOutlet UILabel *messageLabel;
@property (nonatomic, weak) IBOutlet UILabel *latitudeLabel;
@property (nonatomic, weak) IBOutlet UILabel *longitudeLabel;
@property (nonatomic, weak) IBOutlet UILabel *addressLabel;
@property (nonatomic, weak) IBOutlet UIButton *tagButton;
@property (nonatomic, weak) IBOutlet UIButton *getButton;

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

- (IBAction)getLocation:(id)sender;

@end
