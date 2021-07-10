//
//  GQContactTableViewCell.m
//  GQweixin
//
//  Created by Li Guoqing on 2021/1/28.
//
//  设置联系人tableviewCell的视图

#import "GQContactTableViewCell.h"
#import "Masonry.h"

@interface GQContactTableViewCell()

@property (nonatomic, strong) UIImageView *iconImage;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *remarkLabel;

@end

@implementation GQContactTableViewCell

// 初始化
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self initUI];
    }
    return self;
}

// 保存对应的模型
- (void)setContactModel:(GQContact *)contact{
    _contactModel = contact;
    _nameLabel.text = [NSString stringWithFormat:@"%@", contact.showName];
    _iconImage.image = [UIImage imageNamed:contact.userIcon];
    _remarkLabel.text = [NSString stringWithFormat:@"%@", contact.remarkName];
}

// cell的高度
+ (CGFloat)viewCellHeight{
    return 55.0f;
}

// 初始化contactTableViewCell的视图
- (void)initUI{
    //设置头像
    self.iconImage = [UIImageView new];
    [self.contentView addSubview:self.iconImage];
    [self.iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(10);
        make.bottom.mas_equalTo(-10);
        make.height.mas_equalTo(self.iconImage.mas_width);
    }];
    
    //设置名称
    self.nameLabel = [UILabel new];
    [self.nameLabel setTextColor:[UIColor darkGrayColor]];
    [self.nameLabel setFont:[UIFont systemFontOfSize:16.0f]];
    [self.contentView addSubview:self.nameLabel];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconImage.mas_right).mas_offset(10);
        make.centerY.mas_equalTo(self.iconImage);
        make.right.mas_lessThanOrEqualTo(-20);
    }];
    
    //设置备注
    self.remarkLabel = [UILabel new];
}
//懒加载，将属性设置放在取方法
- (UIImageView *)iconImage{
    if(_iconImage == nil){
        _iconImage = [UIImageView new];
    }
    return _iconImage;
}
@end
