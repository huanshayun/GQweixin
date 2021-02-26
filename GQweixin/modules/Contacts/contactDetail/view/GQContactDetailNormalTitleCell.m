//
//  GQContactDetailNormalTitleCell.m
//  GQweixin
//
//  Created by Li Guoqing on 2021/2/25.
//
//  显示联系人的普通标题

#import "GQContactDetailNormalTitleCell.h"
#import "Masonry.h"

@interface GQContactDetailNormalTitleCell ()

//标题内容
@property (nonatomic, strong) UILabel *titleLabel;
//右箭头标志
@property (nonatomic, strong) UIImageView *rightArrow;

@end

@implementation GQContactDetailNormalTitleCell

//行高
+(CGFloat)viewCellHeight{
    return 48.0f;
}

//初始化
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self setBackgroundColor:[UIColor whiteColor]];
        [self initUI];
    }
    return self;
}

//设置标题文字内容
-(void)setTitleText:(NSString *)titleText{
    [self.titleLabel setText:titleText];
}

//页面初始化
-(void)initUI{
    //右箭头显示
    self.rightArrow = [UIImageView new];
    [self.rightArrow setImage:[UIImage imageNamed:@"right_arrow"]];
    [self.contentView addSubview:self.rightArrow];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(8, 13));
        make.right.mas_equalTo(-15);
    }];
    
    //标题文字显示
    self.titleLabel = [UILabel new];
    [self.titleLabel setTextColor:[UIColor darkGrayColor]];
    [self.titleLabel setFont:[UIFont systemFontOfSize:16]];
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(15);
        make.right.mas_lessThanOrEqualTo(self.rightArrow.mas_left).mas_offset(-15);
    }];
}
@end
