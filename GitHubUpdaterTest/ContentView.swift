/*******************************************************************************
 * The MIT License (MIT)
 *
 * Copyright (c) 2026, Jean-David Gadina - www.xs-labs.com
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the Software), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED AS IS, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 ******************************************************************************/

import AppKit
import SwiftUI
import SwiftUtilities

struct ContentView: View
{
    /// The running application's icon, falling back to the generic application
    /// icon and finally to an empty image, so no force-unwrap is needed.
    private var applicationIcon: NSImage
    {
        NSImage( named: "AppIcon" ) ?? NSApplication.shared.applicationIconImage ?? NSImage()
    }

    var body: some View
    {
        VStack( spacing: 24 )
        {
            Image( nsImage: self.applicationIcon )
                .resizable()
                .interpolation( .high )
                .frame( width: 128, height: 128 )
                .clipShape( RoundedRectangle( cornerRadius: 28, style: .continuous ) )
                .shadow( color: .black.opacity( 0.25 ), radius: 12, y: 6 )

            VStack( spacing: 6 )
            {
                Text( Bundle.main.title )
                    .font( .system( .title, design: .rounded ).weight( .bold ) )

                Text( "Version \( Bundle.main.version )" )
                    .font( .callout )
                    .foregroundStyle( .secondary )
            }

            Button( action: { AppUpdater.shared?.checkForUpdates() } )
            {
                Text( "Check for Updates..." )
                    .frame( maxWidth: .infinity )
            }
            .controlSize( .large )
            .buttonStyle( .borderedProminent )
        }
        .padding( 40 )
        .frame( width: 320 )
    }
}

#Preview
{
    ContentView()
}
