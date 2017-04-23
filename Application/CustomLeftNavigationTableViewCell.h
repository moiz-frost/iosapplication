//
//  CustomLeftNavigationTableViewCell.h
//  Application
//
//  Created by FARAZ AHMED SIDDIQUI on 4/23/17.
//  Copyright © 2017 2plebs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomLeftNavigationTableViewCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UIImageView *categoryImage;
@property (nonatomic, strong) IBOutlet UILabel *categoryName;



+ (NSString*)cellIdentifier;
+ (id)createCell;

@end
