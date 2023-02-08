//
//  SlideData.swift
//  E-Commerce
//
//  Created by HungND on 07/02/2023.
//

import Foundation

struct Slide {
    let line1: String
    let line2: String
    let line3: String
    let image: String
}

let slideData: [Slide] = [
    Slide(line1: "Thousands of products", line2: "from", line3: "famous manufacture", image: "onboard_first_img"),
    Slide(line1: "Make home", line2: "for", line3: "better living", image: "onboard_second_img"),
    Slide(line1: "Unique funiture", line2: "with", line3: "high quality", image: "onboard_third_img")
]
