//
//  EDMainTableViewCell.m
//  JQEstate
//
//  Created by Паша on 26.04.16.
//  Copyright © 2016 EarthquakeDev. All rights reserved.
//

#import "EDMainTableViewCell.h"
#import "EDItem.h"
#import <UIImageView+AFNetworking.h>

@interface EDMainTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *previewImageView;

@property (weak, nonatomic) IBOutlet UILabel *hightwayNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;

@property (weak, nonatomic) IBOutlet UILabel *saleTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@property (weak, nonatomic) IBOutlet UILabel *idTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *idLabel;

@property (weak, nonatomic) IBOutlet UILabel *typeTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *typeLabel;

@property (weak, nonatomic) IBOutlet UILabel *sqTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *sqLabel;

@property (weak, nonatomic) IBOutlet UILabel *stateTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *stateLabel;

@end

@implementation EDMainTableViewCell

- (void) prepareForReuse {
    
    [self.previewImageView setImage:nil];
    
}

- (void) setItem: (EDItem *) item {
    
    [self.previewImageView setImageWithURL:[NSURL URLWithString:[item.images firstObject][@"url"]]];
    
    [self.hightwayNameLabel setText:item.location[@"routeName"]];
    
    [self.addressLabel setText:item.location[@"localityName"]];
    
    [self.priceLabel setText:[NSString stringWithFormat:@"%@ %@", item.saleOffer[@"price"], item.saleOffer[@"currency"]]];
    
    [self.idLabel setText:[item.id stringValue]];
    
    [self.sqLabel setText:[item.landDetails[@"area"] stringValue]];
    
    if ([item.kind isEqualToString:@"apartment"]) {
        [self.typeLabel setText:@"Апартаменты"];
    } else if ([item.kind isEqualToString:@"flat"]) {
        [self.typeLabel setText:@"Квартира"];
    } if ([item.kind isEqualToString:@"room"]) {
        [self.typeLabel setText:@"Комната"];
    } if ([item.kind isEqualToString:@"house"]) {
        [self.typeLabel setText:@"Дом"];
    } if ([item.kind isEqualToString:@"land"]) {
        [self.typeLabel setText:@"Участок"];
    } if ([item.kind isEqualToString:@"office"]) {
        [self.typeLabel setText:@"Офис"];
    } if ([item.kind isEqualToString:@"warehouse"]) {
        [self.typeLabel setText:@"Склад"];
    } if ([item.kind isEqualToString:@"townhouse"]) {
        [self.typeLabel setText:@"Таунхаус"];
    }
    
    if ([item.state isEqualToString:@"draft"]) {
        [self.stateLabel setText:@"Черновик"];
    } else if ([item.state isEqualToString:@"public"]) {
        [self.stateLabel setText:@"Общедоступный"];
    } else if ([item.state isEqualToString:@"postponed"]) {
        [self.stateLabel setText:@"Отложен"];
    } else if ([item.state isEqualToString:@"sold"]) {
        [self.stateLabel setText:@"Продан"];
    } else if ([item.state isEqualToString:@"rented"]) {
        [self.stateLabel setText:@"Арендован"];
    } else if ([item.state isEqualToString:@"private"]) {
        [self.stateLabel setText:@"Приватный"];
    }
    
    
    
}

//- (void)awakeFromNib {
//    // Initialization code
//}
//
//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//
//    // Configure the view for the selected state
//}

@end
