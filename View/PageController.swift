//
//  PageController.swift
//  UI-206
//
//  Created by にゃんにゃん丸 on 2021/05/25.
//

import SwiftUI

struct PageController: UIViewRepresentable {
    
    var maxPage : Int
    var currentpage : Int
    func makeUIView(context: Context) -> UIPageControl {
        
        let view = UIPageControl()
        view.backgroundStyle = .minimal
        view.numberOfPages = maxPage
        view.currentPage = currentpage
        return view
        
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        
        uiView.currentPage = currentpage
        
    }
}


