//
//  ScaledImage.h
//  LondonAdventure
//
//  Created by Emma Makinson on 12/07/2015.
//  Copyright © 2015 Emma Makinson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScaledImage : UIImage

+ (UIImage *)scaleImage:(UIImage *)image toSize:(CGSize)newSize;

@end
