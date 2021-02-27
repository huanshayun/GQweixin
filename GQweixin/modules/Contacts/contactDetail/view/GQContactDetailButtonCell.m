//
//  GQContactDetailButtonCell.m
//  GQweixin
//
//  Created by Li Guoqing on 2021/2/27.
//
//  显示功能区控件

#import "GQContactDetailButtonCell.h"
#import "Masonry.h"

@interface GQContactDetailButtonCell ()

//功能控件
@property (nonatomic, strong) UIButton *titleButton;

@end

@implementation GQContactDetailButtonCell

//行高
+ (CGFloat)viewCellHeight{
    return 64.0f;
}

//保存控件标题
- (void)setTitleText:(NSString *)titleText{
    [self.titleButton setTitle:titleText forState:UIControlStateNormal];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

//初始化
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        //[self setBackgroundColor:[UIColor whiteColor]];
        [self initUI];
    }
    return self;
}

//视图初始化
- (void)initUI{
    //设置控件属性
    self.titleButton = [[UIButton alloc] init];
    [self.titleButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.titleButton setBackgroundColor:[UIColor whiteColor]];
    [self.titleButton.titleLabel setFont:[UIFont systemFontOfSize:18.0]];
    [self.contentView addSubview:self.titleButton];
    [self.titleButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(-5);
    }];
    [self.titleButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
    [self.titleButton.titleLabel setTextAlignment:NSTextAlignmentCenter];
    [self.titleButton layoutIfNeeded];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
