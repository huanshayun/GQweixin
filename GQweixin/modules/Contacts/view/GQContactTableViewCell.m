//
//  GQContactTableViewCell.m
//  GQweixin
//
//  Created by Li Guoqing on 2021/1/28.
//

#import "GQContactTableViewCell.h"
#import "GQContact.h"
#import "Masonry.h"

@interface GQContactTableViewCell()

@property (nonatomic, strong) UIImageView *iconImage;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *remarkLabel;

@end

@implementation GQContactTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self initUI];
    }
    return self;
}

- (void)setContactModel:(GQContact *)contact{
    _contactModel = contact;
    _nameLabel.text = [NSString stringWithFormat:@"%@", contact.showName];
    _iconImage.image = [UIImage imageNamed:contact.userIcon];
    _remarkLabel.text = [NSString stringWithFormat:@"%@", contact.remarkName];
}

+ (CGFloat)viewCellHeight{
    return 55.0f;
}

- (void)initUI{
    [self.contentView addSubview:self.iconImage];
    [self.iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(10);
        make.bottom.mas_equalTo(-10);
        make.height.mas_equalTo(self.iconImage.mas_width);
    }];
    
    [self.contentView addSubview:self.nameLabel];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconImage.mas_right).mas_offset(10);
        make.centerY.mas_equalTo(self.iconImage);
        make.right.mas_lessThanOrEqualTo(-20);
    }];
    
}
@end
