//
//  CV.hpp
//  Phototrope-osx
//
//  Created by Dani Pletter on 10/25/15.
//  Copyright © 2015 Everyside Innovations, LLC. All rights reserved.
//

#ifndef CV_hpp
#define CV_hpp

#include <stdio.h>
#include "opencv2/imgproc/imgproc.hpp"

void detectBlob(cv::Mat& image, std::vector<int> loc);

#endif /* CV_hpp */
