//
//  TableCell.swift
//  ListApp
//
//  Created by logesh on 12/15/19.
//  Copyright © 2019 logesh. All rights reserved.
//

import SwiftUI

struct TableCell : View {
    
    var todo:Personal
    
    var body : some View {
        Text("\(todo.name!)")
    }
}
