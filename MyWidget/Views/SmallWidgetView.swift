
import SwiftUI

struct SmallWidgetView: View {
    //var entry: SimpleEntry
    //EXAMPLE
    let card : Trip
    var now = Date.now.formatted()


        var body: some View {
//            if now < card.nextArrivals[0]  {
//                    RoutesView()
//            } else {
                CardWidgetSmallView(card: .placeholder())
//            }
        
    }
}
