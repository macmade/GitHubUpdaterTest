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

import SwiftUtilities

/// The application's shared GitHub updater.
///
/// Configures a single ``GitHubUpdater`` pointed at this test app's own GitHub
/// repository, in ``UpdateBehavior/inApp`` mode, so the manual and background
/// checks share one source of truth.
enum AppUpdater
{
    /// The owner of the GitHub repository the updater checks.
    static let owner = "macmade"

    /// The name of the GitHub repository the updater checks.
    static let repository = "GitHubUpdaterTest"

    /// The shared updater, configured for in-app updates.
    ///
    /// `nil` when a valid releases URL cannot be built from ``owner`` and
    /// ``repository``. Call sites use optional chaining, so a failed
    /// construction simply performs no check.
    static let shared = GitHubUpdater( owner: AppUpdater.owner, repository: AppUpdater.repository, behavior: .inApp )
}
