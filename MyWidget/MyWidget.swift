//
//  MyWidget.swift
//  MyWidget
//
//  Created by Alessandro Vinaccia on 24/02/23.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), trips: [.placeholder()])
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
//        let entry = SimpleEntry(date: Date())
//        completion(entry)
        let allTrips = TripViewModel.shared.userTrips
        let twoTrips = Array(allTrips.prefix(2))
        let entry = SimpleEntry(date: Date.now, trips: twoTrips)
        
        _ = Timeline(entries: [entry], policy: .after(.now.advanced(by: 60 * 60 * 15)))
        
        completion(entry)
        
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
//        var entries: [SimpleEntry] = []
//
//        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
//        let currentDate = Date()
//        for minuteOffset in 0 ..< 5 {
//            let entryDate = Calendar.current.date(byAdding: .minute, value: minuteOffset, to: currentDate)!
//            let entry = SimpleEntry(date: entryDate)
//            entries.append(entry)
//        }

//        let timeline = Timeline(entries: entries, policy: .atEnd)
//        completion(timeline)
        let allTrips = TripViewModel.shared.userTrips
        let twoTrips = Array(allTrips.prefix(2))
        let entry = SimpleEntry(date: Date.now, trips: twoTrips)
        
        let timeline = Timeline(entries: [entry], policy: .after(.now.advanced(by: 60 * 60 * 15)))
        
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    var trips : [Trip]
}

struct MyWidgetEntryView : View {
    
    @Environment(\.widgetFamily) var widgetFamily
    var entry: Provider.Entry
    var trips : [Trip]

    var body: some View {
        switch widgetFamily{
        case .systemMedium:
            MediumWidgetView(card: TripViewModel.shared.userTrips.first ?? Trip())
//            (entry: entry)
            
        case .systemSmall:
            SmallWidgetView(card: TripViewModel.shared.userTrips.first ?? Trip())
//            (entry: entry)

        default:
            Text("Not implemented")
        }
    }
}

struct MyWidget: Widget {
    let kind: String = "MyWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            MyWidgetEntryView(entry: entry, trips: [.placeholder()])
        }
        .supportedFamilies([.systemSmall, .systemMedium])
        .configurationDisplayName("My Favorite Trips")
        .description("Get the next trains arriving at the nearest station around you")
    }
}
//
//struct MyWidget_Previews: PreviewProvider {
//    static var previews: some View {
//        MyWidgetEntryView(entry: SimpleEntry(date: Date()))
//            .previewContext(WidgetPreviewContext(family: .systemSmall))
//    }
//}
