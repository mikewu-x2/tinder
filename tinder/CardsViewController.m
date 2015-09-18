//
//  CardsViewController.m
//  tinder
//
//  Created by Michael Wu on 9/18/15.
//  Copyright © 2015 Michael Wu. All rights reserved.
//

#import "CardsViewController.h"

@interface CardsViewController ()
@property CGPoint cardInitialCenter;
@property (weak, nonatomic) IBOutlet UIImageView *navImage;
@property (weak, nonatomic) IBOutlet UIImageView *cardImage;
@property (weak, nonatomic) IBOutlet UIImageView *actionImage;
@end

@implementation CardsViewController
- (IBAction)onCardPan:(UIPanGestureRecognizer *)sender {
    
    switch (sender.state) {
            
        case UIGestureRecognizerStateBegan:
            NSLog(@"Began %f, %f", self.cardImage.center.x, self.cardImage.center.y);
            self.cardInitialCenter = self.cardImage.center;
            //self.trayOriginalCenter = self.trayView.center;
            break;
        case UIGestureRecognizerStateCancelled:
            NSLog(@"Cancelled");
            sender.enabled = YES;
            self.cardImage.center = self.cardInitialCenter;
            break;
        case UIGestureRecognizerStateChanged: {
            NSLog(@"Changed");
            CGPoint translation = [sender translationInView:self.cardImage];
            //CGPoint velocity = [sender velocityInView:self.trayView];
            
            //CGFloat dx = currentPosition.x  - self.cardInitialCenter.x;//delta x with sign
            //CGFloat dy = translation.y  - self.cardInitialCenter.y;//delta y with sign
            
            //CGFloat distance = sqrt(translation.y * translation.y);//distance
            //NSLog(@"%f, %f", log(translation.y), translation.y);
            
            //CGFloat weightedX = initialCentre.x +  dx * (1/log(distance)); //new x as inverse function of distance
            CGFloat weightedY = self.cardInitialCenter.y +  log(translation.y); //new y as inverse function of distance
            
            
            
            self.cardImage.center = CGPointMake(self.cardInitialCenter.x, weightedY);//set  the center

            
            
            
            //self.cardImage.center = CGPointMake(self.cardInitialCenter.x, self.cardInitialCenter.y + translation.y);
            
            if (log(translation.y) > 5) {
                sender.enabled = NO;
                [self showProfileView];
            }
            
            //NSLog(@"center %f, %f", self.trayView.center.x, self.trayView.center.y);
            
            //if (velocity.y > 0) {
            //CGPoint trayPosition = self.trayIsClosed;
            //self.trayView.center = self.trayIsClosed;
            //} else {
            //CGPoint trayPosition = self.trayIsOpen;
            //self.trayView.center = self.trayIsOpen;
            //}
            
//            [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0.01 options:0 animations:^{
//                if (velocity.y > 0) {
//                    //CGPoint trayPosition = self.trayIsClosed;
//                    self.trayView.center = self.trayIsClosed;
//                } else {
//                    //CGPoint trayPosition = self.trayIsOpen;
//                    self.trayView.center = self.trayIsOpen;
//                }
//                //self.trayView.center = trayPosition;
//                [self.trayView layoutIfNeeded];
//            }completion:nil];
            
            break;
        }
        case UIGestureRecognizerStateEnded:
            NSLog(@"Ended");
            sender.enabled = YES;
            self.cardImage.center = self.cardInitialCenter;
            
            break;
        default:
            NSLog(@"Default");
            break;
            
    }
}

- (void)showProfileView {
     [self performSegueWithIdentifier:@"showProfileView" sender:self];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UIViewController *viewController = [segue destinationViewController];
    viewController.modalPresentationStyle = UIModalTransitionStyleCrossDissolve;
}


@end
