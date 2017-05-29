//
//  RightTableViewCell.m
//  Application
//
//  Created by Abdul Moiz on 29/05/2017.
//  Copyright © 2017 2plebs. All rights reserved.
//

#import "RightTableViewCell.h"

@implementation RightTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (NSString*)cellIdentifier{
    static NSString *cellIdentifier = @"CartItem";
    return cellIdentifier;
}

@end
