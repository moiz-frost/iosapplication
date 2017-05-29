//
//  RightTableViewCell.h
//  Application
//
//  Created by Abdul Moiz on 29/05/2017.
//  Copyright © 2017 2plebs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RightTableViewCell : UITableViewCell

@property (nonatomic, weak, readwrite) IBOutlet UIImageView *itemImage;



+ (NSString*)cellIdentifier;


@end
