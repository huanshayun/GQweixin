//
//  GQContactDetailPhoneNumberCell.m
//  GQweixin
//
//  Created by Li Guoqing on 2021/2/25.
//
//  显示联系人的手机号信息

#import "GQContactDetailPhoneNumberCell.h"
#import "Masonry.h"

@interface GQContactDetailPhoneNumberCell ()

//手机号（以UIButton形式）
@property (nonatomic, strong) UIButton *phoneButton;
//标题文字
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation GQContactDetailPhoneNumberCell

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

//视图初始化
-(void)initUI{
    //标题文字显示
    self.titleLabel = [UILabel new];
    [self.titleLabel setTextColor:[UIColor darkGrayColor]];
    [self.titleLabel setFont:[UIFont systemFontOfSize:16]];
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(15);
    }];
    
    //手机号信息显示
    self.phoneButton = [UIButton new];
    [self.phoneButton.titleLabel setTextColor:[UIColor blueColor]];
    [self.phoneButton.titleLabel setFont:[UIFont systemFontOfSize:16]];
    [self.contentView addSubview:self.phoneButton];
    [self.phoneButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(self.titleLabel.mas_right).mas_offset(15);
        make.right.mas_lessThanOrEqualTo(-15);
    }];
    [self.phoneButton addTarget:self action:@selector(callPhone:) forControlEvents:UIControlEventTouchUpInside];
}

//点击事件（未完成）
-(void)callPhone:(UIButton *)sender{
    NSString *phoneN = self.phoneButton.titleLabel.text;
    NSString *urlPhone = [NSString stringWithFormat:@"tel:%@", phoneN];
}

//保存手机号信息
-(void)setTitleText:(NSString *)titleText phoneNumber:(NSString *)phoneNumber{
    [self.titleLabel setText:titleText];
    [self.phoneButton.titleLabel setText:phoneNumber];
}
@end
