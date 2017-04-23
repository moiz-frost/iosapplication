//
//  CustomLeftNavigationTableViewCell.m
//  Application
//
//  Created by FARAZ AHMED SIDDIQUI on 4/23/17.
//  Copyright © 2017 2plebs. All rights reserved.
//

#import "CustomLeftNavigationTableViewCell.h"

@implementation CustomLeftNavigationTableViewCell

@synthesize categoryImage;
@synthesize categoryName;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+ (NSString*)cellIdentifier{
    static NSString *cellIdentifier = @"MenuItem";
    return cellIdentifier;
}

+ (id)createCell{

    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CustomLeftNavigationTableViewCell" owner:self options:nil];
    return [nib lastObject];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
  
    
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
