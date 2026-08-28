//
//  MatchMarkers.swift
//  Codebreaker
//
//  Created by Anirudh on 11/08/26.
//
import SwiftUI


enum Match {
    case nomatch
    case exact
    case inexact
}

struct MatchMarkers: View {
    var matches: Array<Match>
    var body: some View {
        return HStack(alignment: .top) {
            //            VStack {
            //                matchMarker(peg: 0)
            //                matchMarker(peg: 1)
            //            }
            //            VStack {
            //                matchMarker(peg: 2)
            //                matchMarker(peg: 3)
            //            }
            
            let n = matches.count
            if (n % 2 == 0) {
               
                ForEach(0..<(n/2), id: \.self) { col in
                    VStack {
                        ForEach(0..<2, id: \.self) { row in
                            let pegIndex = row + col * 2
                            matchMarker(peg: pegIndex)

                    
                        }
                    }
                    
                }
            }
            
        
            if (n%2 != 0){
                ForEach(0..<((n/2) + 1), id: \.self) { col in
                    VStack {
                        ForEach(0..<2, id: \.self) { row in
                            let pegIndex = row + col * 2
                            if (pegIndex < n) {
                                
                                matchMarker(peg: pegIndex)
                            }

                        }
                    }
                    
                }
            }
            
            
        }
        
    }
    
    func matchMarker(peg: Int) -> some View {
        let exactCount: Int = matches.count(where: { match in match == .exact})
        let foundCount: Int = matches.count(where: {match in match != .nomatch})
        return Circle()
            .fill(exactCount > peg ? Color.primary : Color.clear)
            .strokeBorder(foundCount > peg ? Color.primary : Color.clear, lineWidth: 2)
            .aspectRatio(1, contentMode: .fit)
//            .frame(width: 18, height: 18)
        
    }
    
    
}


struct MatchMarkersPreview: View {
    var matchesPreview: Array<Match> = []
    var body: some View {
        VStack(alignment: .leading){
            dummyPegs(count: matchesPreview.count)
        }
        .padding()
        
        
    }
    
    func dummyPegs(count: Int) -> some View {
        var numberOfPegs = count
        if numberOfPegs < 3 {
            numberOfPegs = 3
        }
        return HStack(alignment: .top, spacing: 8) {
            ForEach(0..<numberOfPegs, id: \.self) { index in
                Circle()
                    .fill(Color.primary)
                    .strokeBorder(Color.primary)
                    .aspectRatio(1, contentMode: .fit)
//                    .frame(width: 45, height: 45)
            }
            MatchMarkers(matches: matchesPreview)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
}


#Preview {
    MatchMarkersPreview(matchesPreview: [.exact, .inexact, .inexact,])
    MatchMarkersPreview(matchesPreview: [.exact, .inexact, .inexact,])
    MatchMarkersPreview(matchesPreview: [.exact, .inexact, .inexact, .exact, .nomatch, . nomatch])
    MatchMarkersPreview(matchesPreview: [.exact, .inexact, .inexact,])
    MatchMarkersPreview(matchesPreview: [.exact, .inexact, .inexact,])
//    MatchMarkersPreview()
}
