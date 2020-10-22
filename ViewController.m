//
//  ViewController.m
//  CAShapeLayerDemo
//
//  Created by anchu on 2020/10/22.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path addArcWithCenter:CGPointMake(50, 50) radius:25 startAngle:0 endAngle:M_PI*2 clockwise:YES];

    CAShapeLayer *shape = [CAShapeLayer layer];
    shape.frame = CGRectMake(100, 100, 100, 100);
    shape.path = path.CGPath;
    shape.fillColor = [UIColor redColor].CGColor;
    shape.strokeColor = [UIColor blueColor].CGColor;
    shape.borderColor = [UIColor yellowColor].CGColor;
    shape.borderWidth = 2;
    shape.lineDashPhase = .5f;
    shape.lineDashPattern = @[@2,@10];
    [self.view.layer addSublayer:shape];
    
    UIBezierPath *roundPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 200, 200) cornerRadius:100];
    UIBezierPath *rectPath = [UIBezierPath bezierPathWithRect:CGRectMake(10, 10, 180, 180)];
    [roundPath appendPath:rectPath];
    roundPath.usesEvenOddFillRule = YES;
    
    CAShapeLayer *roundShape = [CAShapeLayer layer];
    roundShape.frame = CGRectMake(100, 300, 200, 200);
    roundShape.path = roundPath.CGPath;
    roundShape.fillRule = kCAFillRuleEvenOdd;
    roundShape.fillColor = [UIColor redColor].CGColor;
    roundShape.lineJoin = kCALineJoinMiter;
    roundShape.miterLimit = 50;
    [self.view.layer addSublayer:roundShape];
    
    UIBezierPath *HUDPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 100, 100)];
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = CGRectMake(100, 600, 100, 100);
    shapeLayer.strokeEnd = 0.7f;
    shapeLayer.strokeStart = 0.1f;
    shapeLayer.path = HUDPath.CGPath;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.lineWidth = 2.0f;
    shapeLayer.strokeColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:shapeLayer];
    CABasicAnimation *pathAnima = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnima.duration = 3.0f;
    pathAnima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pathAnima.fromValue = [NSNumber numberWithFloat:0.0f];
    pathAnima.toValue = [NSNumber numberWithFloat:1.0f];
    pathAnima.fillMode = kCAFillModeForwards;
    pathAnima.removedOnCompletion = NO;
    pathAnima.repeatCount = -1;
    [shapeLayer addAnimation:pathAnima forKey:@"strokeEndAnimation"];
}


@end
