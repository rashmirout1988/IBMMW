//
//  FooterView.m
//  IBMMW
//
//  Created by Rashmi Ranjan on 7/13/15.
//  Copyright (c) 2015 Rashmi Ranjan. All rights reserved.
//

#import "FooterView.h"
@interface FooterView () {
    
    BOOL isFooterTableViewVisible;
}


@end
@implementation FooterView

- (void)awakeFromNib {
    
    [[NSBundle mainBundle] loadNibNamed:@"FooterView" owner:self options:nil];
    [self addSubview:self.contentView];
}

- (IBAction)portfolioNavigateButton:(UIButton *)sender
{
    float heightOfFooterTableMenu;
    float yPosition;

    if (isFooterTableViewVisible)
    {
        heightOfFooterTableMenu=0.0f;
        yPosition = self.currentViewController.view.frame.size.height - 49.0;
        self.footerTableViewHeightConstraints.constant=0.0f;
        isFooterTableViewVisible = NO;
    }
    else
    {
        heightOfFooterTableMenu=200.0f;
        yPosition = self.currentViewController.view.frame.size.height-249.0f;
        self.footerTableViewHeightConstraints.constant=200.0f;
        isFooterTableViewVisible = YES;
    }
 /*
    [UIView animateWithDuration:0.2f animations:^{
        self.footerTableView.frame = CGRectMake(self.currentViewController.view.frame.size.width - 100.0f, yPosition, self.footerTableView.bounds.size.width, heightOfFooterTableMenu);
    }];
  */
    
}

- (IBAction)sendMail:(id)sender {
    if ([MFMailComposeViewController canSendMail])
    {
        
        MFMailComposeViewController *mailer = [[MFMailComposeViewController alloc] init];
        mailer.mailComposeDelegate = self;
        [mailer setSubject:@"Test Mail"];
        [mailer setMessageBody:nil isHTML:YES];
        NSString *messageBody =@"Test mail from IBM";
        [mailer setMessageBody:messageBody isHTML:NO];
        NSArray *toRecipients = [NSArray arrayWithObjects:@"", nil];
        [mailer setToRecipients:toRecipients];
        [self.currentViewController presentViewController:mailer animated:YES completion:nil];
        
        //[mailer release];
    }
    
    else
    {
        UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Please add an email account." delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [error show];
    }
}
- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            //NSLog(@"Mail cancelled: you cancelled the operation and no email message was queued");
            break;
        case MFMailComposeResultSaved:
            //NSLog(@"Mail saved: you saved the email message in the Drafts folder");
            break;
        case MFMailComposeResultSent:
            //NSLog(@"Mail send: the email message is queued in the outbox. It is ready to send the next time the user connects to email");
            break;
        case MFMailComposeResultFailed:
            //NSLog(@"Mail failed: the email message was nog saved or queued, possibly due to an error");
            break;
        default:
            //NSLog(@"Mail not sent");
            break;
    }
    [controller dismissViewControllerAnimated:YES completion:nil];
}
-(void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
{
    [controller dismissViewControllerAnimated:YES completion:nil];
}

@end
