//
//  CVWrapper.m
//  CVOpenTemplate
//
//  Created by Washe on 02/01/2013.
//  Copyright (c) 2013 foundry. All rights reserved.
//

#include <UIKit/UIKit.h>
#import "CVWrapper.h"
#include <vector>
#include "opencv2/opencv.hpp"

@implementation UIImage (OpenCV)

- (void)findCirclesOfColor:(UIColor*)color{

}

@end

@implementation CVWrapper


+ (UIImage*) processImageWithOpenCV: (UIImage*) inputImage
{
    std::vector<int> loc;
    cv::Mat img;
    //detectBlob(img, loc);
    return inputImage;
}


@end