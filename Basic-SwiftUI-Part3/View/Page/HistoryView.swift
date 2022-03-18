//
//  HistoryView.swift
//  Basic-SwiftUI-Part3
//
//  Created by Chondro Satrio Wibowo on 18/03/22.
//

import SwiftUI

struct HistoryView: View {
    let history = History.random(count: 2000)
    let dateFormatter:DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter
    }()
    var header: some View{
        Text("History").foregroundColor(.white)
            .font(.title)
        #if os(iOS)
            .frame(width: UIScreen.main.bounds.width, height: 50)
        #endif
            .background(Color.gray)
    }
    
    func getElement(_ element:History) -> some View{
        VStack(alignment:.center){
            Text("\(dateFormatter.string(from: element.date))").font(.caption2).foregroundColor(.blue)
            HStack{
                VStack{
                    Text("Question:").font(.caption)
                        .foregroundColor(.gray)
                    Text(element.challenge.question)
                }
                VStack{
                    Text("Answer:").font(.caption)
                        .foregroundColor(.gray)
                    Text(element.challenge.answer)
                        .font(.body)
                }
                VStack{
                    Text("Guessed").font(.caption).foregroundColor(.gray)
                    Text(element.challenge.succeeded ? "Yes":"No")
                }
            }
        }.padding()
        #if os(iOS)
            .frame(width:UIScreen.main.bounds.width)
        #endif
    }
    
    
    var body: some View {
        ScrollView{
            LazyVStack(spacing:0,pinnedViews: [.sectionHeaders]){
                Section(header:header){
                    ForEach(history,id:\.self){element in
                        getElement(element)
                    }
                }
            }
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
