//
//  MSNumberKeyBord.m
//  MoneySaver
//
//  Created by Tbxark on 15/9/25.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import "MSNumberKeyBord.h"

#import "MSNumberKeyBordButton.h"

#import <Masonry.h>
#import <ReactiveCocoa.h>
#import <ReactiveCocoa/RACEXTScope.h>

#import "UIColor+MoneySaver.h"



@interface MSNumberKeyBord ()<UITextFieldDelegate>
{
    BOOL _isNewNumber;
}

@property (nonatomic, strong) NSMutableString *currentString;
@property (nonatomic, strong) NSMutableArray  *numberArray;

@property (nonatomic, weak  ) UITextField     *textField;


@property (nonatomic, strong) NSTimer         *deleteTimer;
@property (nonatomic, assign) BOOL            isMultNumber;

@end

@implementation MSNumberKeyBord

#pragma mark - Life Cycle
- (instancetype)initWithTextField:(UITextField *)textField
{
    self = [super init];
    if (self) {
        _textField = textField;
        _textField.delegate = self;
        _numberArray = [NSMutableArray new];
        _textField.inputView = self;
        [self configureView];
        
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef contex = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(contex, 0.4);
    [[UIColor grayColor] set];
    CGContextAddRect(contex, rect);
    
    CGFloat width        = SCREEN_WIDTH;
    CGFloat buttonWidth  = SCREEN_WIDTH/4.0;
    CGFloat buttonHeight = kMSNumberKeyBordHeight/4.0;
    
    for (NSInteger index = 0; index < 3; index ++) {
        CGFloat x = buttonWidth * (index + 1);
        CGFloat y = buttonHeight * (index + 1);
        CGFloat lineLength = width;
        if (index == 0 || index == 2) {
            lineLength -= buttonWidth;
        }
        CGPoint xLine[] = {CGPointMake(x, 0),CGPointMake(x, kMSNumberKeyBordHeight)};
        CGPoint yLine[] = {CGPointMake(0, y),CGPointMake(lineLength, y)};
        CGContextAddLines(contex, xLine, 2);
        CGContextAddLines(contex, yLine, 2);
    }
    CGContextStrokePath(contex);
}

- (void)configureView
{
    CGFloat width        = SCREEN_WIDTH;
    CGFloat buttonWidth  = SCREEN_WIDTH/4.0;
    CGFloat buttonHeight = kMSNumberKeyBordHeight/4.0;
    
    self.frame = CGRectMake(0, 0, width, kMSNumberKeyBordHeight);
    self.backgroundColor = [UIColor colorWithWhite:0.98 alpha:1];
    
    
    CGRect buttonFrame = CGRectMake(0, 0, buttonWidth, buttonHeight);
    NSInteger types[] = {MSNumberKeyBordPointButtonType,MSNumberKeyBordZeroButton,MSNumberKeyBordAddButtonType};
    
    for (NSInteger index = 0; index < 12; index ++) {
        NSInteger lineCount = index/3;
        NSInteger rowCount  = (index + 3)%3;
        buttonFrame.origin.x = rowCount * buttonWidth;
        buttonFrame.origin.y = lineCount * buttonHeight;
        MSNumberKeyBordButtonType type = index + 1;
        if (lineCount == 3) {type = types[rowCount];}
        MSNumberKeyBordButton *button = [MSNumberKeyBordButton buttonWithType:type];
        button.frame = buttonFrame;
        if (type == MSNumberKeyBordAddButtonType) {
            [button addTarget:self action:@selector(addButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        } else {
            [button addTarget:self action:@selector(numberButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        }
        [self addSubview:button];
    }
    
    {
        buttonFrame.origin.y = 0;
        buttonFrame.size.height = buttonHeight*2;
        buttonFrame.origin.x = 3 * buttonWidth;
        MSNumberKeyBordButton *clearButton = [MSNumberKeyBordButton buttonWithType:MSNumberKeyBordDeleteButtonType];
        clearButton.frame = buttonFrame;
        [clearButton addTarget:self action:@selector(deleteButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:clearButton];
        
        UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressDeleteButton:)];
        longPress.allowableMovement = NO;
        longPress.minimumPressDuration = 0.5f;
        [clearButton addGestureRecognizer:longPress];
        
        buttonFrame.origin.y += buttonHeight*2;
        MSNumberKeyBordButton *commtieButton = [MSNumberKeyBordButton buttonWithType:MSNumberKeyBordCommiteButtonType];
        commtieButton.frame = buttonFrame;
        commtieButton.backgroundColor = [UIColor ms_RedColor];
        [commtieButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [commtieButton setTitleColor:[UIColor colorWithWhite:0.9 alpha:1] forState:UIControlStateHighlighted];
        [commtieButton addTarget:self action:@selector(commiteButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:commtieButton];
        
        NSString *cacheTitle = commtieButton.currentTitle;
        @weakify(commtieButton);
        [RACObserve(self, isMultNumber) subscribeNext:^(NSNumber *x) {
            @strongify(commtieButton);
            if (x.boolValue) {
                [commtieButton setTitle:@"=" forState:UIControlStateNormal];
            } else {
                [commtieButton setTitle:cacheTitle forState:UIControlStateNormal];
            }
        }];
    }
}


#pragma mark - Button Action
- (void)numberButtonAction:(MSNumberKeyBordButton *)button
{
    [self pushNumber:button.currentTitle];
    [self showTextForTextField];
}

- (void)deleteButtonAction:(MSNumberKeyBordButton *)button
{
    if (self.currentString.length == 0) {
        if (self.numberArray.count > 1) {
            [self.numberArray removeLastObject];
            _currentString = nil;
            [self currentString];
        }
        else
        {
//            [self.deleteTimer invalidate];
        }
    }else
    {
        [self popNumber];
    }
    [self showTextForTextField];
}

- (void)longPressDeleteButton:(UILongPressGestureRecognizer *)gesture
{
    if (gesture.state == UIGestureRecognizerStateEnded) {
        [self.deleteTimer invalidate];
    }else if (gesture.state == UIGestureRecognizerStateBegan)
    {
       self.deleteTimer = [NSTimer scheduledTimerWithTimeInterval:0.1f
                                                           target:self
                                                         selector:@selector(deleteButtonAction:)
                                                         userInfo:nil
                                                          repeats:YES];
    }
}

- (void)addButtonAction:(MSNumberKeyBordButton *)button
{
    if (self.currentString.length == 0) {
        return;
    }
    if ([self.currentString hasSuffix:@"."]) {
        [self pushNumber:@"0"];
    }
    _isNewNumber = YES;
    [self currentString];
    [self showTextForTextField];
}

- (void)commiteButtonAction:(MSNumberKeyBordButton *)button
{
    if (_isMultNumber) {
        [self addButtonAction:nil];
        [self.currentString appendString:@"0"];
        CGFloat count = 0;
        for (NSString *string in self.numberArray) {
            count += [string doubleValue];
        }
        [self.numberArray removeAllObjects];
        _isNewNumber = YES;
        [self.currentString appendFormat:@"%@",@(count)];
        [self showTextForTextField];
    }else
    {
        if (self.inputComplete) {
            self.inputComplete(self.inputString);
        }
    }
}


#pragma mark - UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    return NO;
}

#pragma mark - Input Action
- (void)pushNumber:(NSString *)num
{
    BOOL isPoint = [num isEqualToString:@"."];
    if ([self.currentString containsString:@"."]) {
        if (isPoint) {return;}
    }else if (self.currentString.length == 0)
    {
        if (isPoint) {num = @"0.";}
    }
    [self.currentString appendString:num];
}

- (void)popNumber
{
    NSInteger length = self.currentString.length;
    if (length) {
        [self.currentString deleteCharactersInRange:NSMakeRange(length - 1, 1)];
    }
}

- (void)showTextForTextField
{
    if (self.numberArray.count ==0) {
        self.isMultNumber = NO;
        return;
    }
    if (self.numberArray.count == 1) {
        self.isMultNumber = NO;
        self.inputString = [self.numberArray lastObject];
    } else {
        self.isMultNumber = YES;
        self.inputString = [self.numberArray componentsJoinedByString:@"+"];
    }
    self.textField.text = self.inputString;
}


#pragma mark - Getter

- (NSMutableString *)currentString
{
    if (self.numberArray.count == 0) {
        _isNewNumber = YES;
    }
    if (_isNewNumber) {
        _isNewNumber = NO;
        _currentString = [NSMutableString new];
        [self.numberArray addObject:_currentString];
    }else{
        _currentString = [self.numberArray lastObject];
    }
    
    return _currentString;
}



@end
