return '20120604.202' -- Jeffrey's Export-to-PicasaWeb Lightroom Plugin


--[[----------------------------------------------------------------------------

Version History:

20120604.202 -- <p>It seems that Google creates a lot of spurious internal-use albums for some G+ users; these are now omitted from the album
                list shown in the plugin.</p>

                <p>Discovered that the plugin was being inefficient when it fetched the album list from Google, doing so twice in a row. Now
                doing it just once, and in a much more efficient way to boot.</p>

20120601.201 -- A corrupt image date could crash the upload at Google.

20120530.200 -- <p>(See my blog post &#8220;<a href='http://regex.info/blog/2012-05-30/2005'>Hidden Gems in Lightroom 4.1;
                Hidden Gems in Lightroom Plugin Development</a>&#8221; for some details on what's new in this update for Lightroom 4.1.)</p>

                <p>New upload engine in Lr4.1 that <i>greatly</i> increases the efficiency of large uploads. In Lr4.0 and older versions,
                upload handling is inefficient and large uploads can crash Lightroom, but from Lr4.1 you can easily upload up to PicasaWeb's
                max 20MB images and 100MB videos. (Note: PicasaWeb advertises videos up to 1GB, but you get that only when uploaded via the Picasa desktop
                app. The limit to third-party apps like this plugin is currently 100MB)</p>

                <p>Due to remaining limitations in Lightroom, the plugin can use this more-efficient method only for initial image/video uploads,
                and not for replacements. The big win is for initial video uploads, so this is not a huge setback because Google doesn't allow
                videos to be replaced anyway (the plugin continues to silently ignores video updates).</p>

                <p>With Lr4.1 and later, you also get an upload percent-complete report in the task progress bar, and the ability for upload cancels
                to take effect immediately.</p>

                <p>Also added the ability to control whether geoencoded locations are sent along with the photo to PicasaWeb, and from Lr4.1
                proper (the actual Lr4.1, not the 4.1RCs), the plugin knows whether a photo's location has been marked as private, so the
                plugin can now respond to that and exclude the geoencoded location in such situations. Options have been added to export and
                to metadata-resend operations; they default to excluding private locations.</p>


                <p>Update to handle the Mac App Store version of Lightroom.</p>

20120508.199 -- Yikes, Lr2 registrations were broken again.

20120430.198 -- <p>Tweak for Lr4.1RC2.</p>
                <p>Fixed the &#8220;photo too large to tweet&#8221; dialog message, which had been all garbled up.</p>

20120426.197 -- <p>Fixed a potential crash when processing some captions.</p>

20120423.196 -- <p>Added to the <a href='http://regex.info/blog/lightroom-goodies/template'>template tokens</a> supported by the plugin:
                <b>{FullMasterFolder}</b>,
                <b>{FullExportedFile}</b>, and
                <b>{FullExportedFolder}</b>, and to match, renamed the recently-added <b>{FullMasterPath}</b> to <b>{FullMasterFile}</b>.
                </p>

20120411.195 -- <p>Enhanced the send-log dialog to hopefully make reports more meaningful to me, yielding, I hope, the ability to respond
                more sensibly to more reports.</p>

                <p>Added <b>{FullMasterPath}</b> to the list of <a href='http://regex.info/blog/lightroom-goodies/template'>template tokens</a>
                supported by the plugin.</p>

20120410.194 -- Fixed the "Not authorized to view access private" error some folks got when switching among multiple PicasaWeb accounts.

20120404.193 -- Allow line breaks in captions.

20120330.192 -- Update to handle 4.1RC

20120327.191 -- More graceful handling of videos whose pixel size is not known.

20120326.190 -- Fix a <tt>"Credentials:200"</tt> error.

20120323.189 -- <p>It seems Google has started to quietly roll out unannounced changes to user-account data that completely disconnects a
                user from their history in this plugin, so I've been scrambling to come up with a workaround so that years worth of work is
                not lost. This kind of firedrill wasn't quite on my schedule for the turbulent aftermath of Lr4's release, but such is life.
                This release contains a first stab at a data-migration utility that will help some. A catalog backup is recommended before
                taking the data-migration step. (A dialog will prompt you.)</p>

                <p>No longer send the geoencoded location if metadata is marked to be removed from the exported copy.</p>

20120309.188 -- Fix registrations in Lr2.

20120309.187 -- Handle better when authentication fails. Can now reauthenticate directly from publishing manager.

20120308.186 -- Update to the debug logging to better track down timing issues that might arise.

20120229.185 -- <p>Lots more preparation for Lr4 (but still works in Lr2 and Lr3).</p>

                <p>Lightroom's internal infrastructure doesn't handle large uploads well, and will most likely crash when trying to upload
                huge videos, so I've not added a warning and the ability for the user to decide when it kicks in.</p>

                <p>Files that are offline are now detected before an export/publish begins, and if there are any, offers the option to abort the export,
                or just skip the offline ones. This is a lot more clear than the "dng_error_file_not_found" error you get from Lightroom if you follow through
                with an export attempt of an offline image.</p>

20120217.185 -- <p>Discovered why "metadata that triggers a republish" wasn't reliable, and fixed it.</p>

20120214.184 -- Fixes an Lr2 issue introduced in the previous version.

20120214.183 -- <p>A change in the previous version seemed to tickle a bug in the Lr4 beta that would see Lightroom lock up when
                the plugin was enabled with certain catalogs. I'm not entirely sure what the bug was, but in this release I've
                worked around what was tickling it.</p>

                <p>Attempt to prepare for <a
                href='https://dev.twitter.com/blog/making-api-responses-match-request-content-type'>changes Twitter has
                announced</a> will take place in how they return information about server errors.</p>

20120201.182 -- <p>More on the march toward Lr4, including upheaval in the code to handle  Lightroom APIs being discontinued in Lr4.</p>
                <p>Bumped up the minimum Lr3 version to Lr3.5, to ensure we've got those bug fixes. Lr2 and Lr4 are still supported, of course.</p>
                <p>Added the <b>{AspectRatio}</b> token to the <a href='http://regex.info/blog/lightroom-goodies/template'>token templates</a> understood by the plugin, and added the <b>Length=<i>num</i></b> filter.</p>
                <p>Be a bit more graceful in reporting when the target album of an upload no longer exists at PicasaWeb.</p>

20120114.181 -- More tweaks for Lr4b

20120114.180 -- <p>More attention to the new Twitter authorization code.</p>

20120112.179 -- <p>Removed the &#8220;Re-mark as Published&#8221; button from the plugin-extras dialog in Lr4, because Lr4 now supports this natively.</p>

                <p>Moved the Twitter code over to a new style of Twitter authentication, in hopes that it cures the
                authentication problems some people have been having.</p>
                <p>Moved all access of Twitter to HTTPS.</p>
                <p>Removed an obsolete reference to bit.ly from the Twitter help dialog.</p>

	            <p>Update for Lr4 beta: explain in the plugin manager that the plugin can't be registered in the beta.</p>

20111222.178 -- Enabled export snapshot creation in Publish.

20111216.177 -- <p>Better error handling for video export, and for when images/videos exceed upload limits.</p>
                <p>Warn about the need to update the list of albums if it's not been updated for a long time.</p>
                <p>The Lightroom bug referenced in the version note for <b><a href='#157'>20110623.157</a></b> was fixed in Lr3.5, so I've removed the special workaround processing for that version and later.</p>

20111210.176 -- Had issues with the registration button sometimes not showing

20111207.175 -- <p>Google isn't graceful handling references to images that have been moved from an album
                that has since been deleted; I now try to get around that a bit better.</p>

                <p>Updated how the Manual-association dialog is sized.</p>

20111117.174 -- <p>When doing a plugin upgrade, offer the ability to flush all the old copies of the plugin.</p>

                <p>Fix an "attempt to concatenate field 'user_id_string'" error that pops up at rare times.</p>

                <p>Added a system-clock check and reports to the user if the system clock is more than a minute out of
                date. An incorrect system clock can cause problems with website authentication, among other things.</p>

20111012.173 -- <p>Updates the account-authorization handshaking done with Google to handle <a href='http://googlecode.blogspot.com/2011/10/upcoming-changes-to-oauth-20-endpoint.html'>some changes</a> they will implement on Nov 15, 2011.</p>

                <p>Include the account id (in addition to the full name that's already there) in the Publishing Manager login
                section, to allow multiple accounts associated with the same real name to be easily differentiated.</p>

                <p>Reporting some errors can create a huge dialog box that can be difficult to close on OSX,
                so this update adds a [X] button in the upper right of the dialogs.</p>

20111006.172 -- It seems that Google has a max limit of 50,000,000 pixels per photo.

20111004.171 -- <p>Plugin would crash in some cases while trying to process Twitter-related settings.</p>
                <p>Resending metadata could crash for images that had no GPS data</p>
                <p>The "repopulate" function could fail with a "must be https" error.</p>
                <p>Publish repopulation could fail with write-gate timeouts.</p>
                <p>Google sends back "quota exceeded" errors in a non-standard way... detect these and pass along to the user more gracefully.</p>

20110918.170 -- Previous update introduced a problem when trying to update a photo that has been deleted at PicasaWeb.

20110908.169 -- <p>Reworked the innards to try to handle errors from Google more gracefully.
                (I wish Google's PicasaWeb API had a shred of consistency in how it reports errors. )-:</p>

20110903.168 -- Added {PluginProperty} to the <a href='http://regex.info/blog/lightroom-goodies/template'>template tokens</a> used by my plugins.

20110903.167 -- Work around what seems to be a bug in Windows that caused authentication to sometimes fail with a plugin crash.
                
20110902.168 -- <p>Handle more gracefully the situation where there are no albums at PicasaWeb yet.</p>
                <p>Display the PicasaWeb "nickname" instead of the (possibly-numeric) "username" in the "Logged in as" note.
                <p>Some internal optimizations to handle large gallery sets.</p>

20110821.167 -- More updates for the big authentication change.

20110820.166 -- <p>Due to the big change in the previous version, all authentications ("logins") from prior plugins had to be deleted and
                 reauthenticated, but it seems I missed one place to warn the user. Hopefully this catches them all.</p>

20110820.164 -- <p>Huge overhaul of how the plugin talks to Google, moving to a new authentication system that should work with every type of Google account.
                (The authentication system the plugin used to use was the only one available when I first developed the
                 plugin, but it doesn't work with some kinds of accounts.) I have immense respect for the folks at
                 Google, both for what they do and how they do it, but the API to their photo service is patheticly
                 haphazard... it really is not even in the same universe as the rest of what Google does.</p>

                <p>Added the ability to include a photo when issuing a tweet via Twitter.</p>

                <p>In the list of albums, added the ability to prepend the album type ("private", "protected", "public") to the name.</p>

                <p>Gave the Twitter tweet input UI some attention.</p>

                <p>Twitter automatically replaces URLs with their own <code>t.co</code> urls, and the tweet-text
                character-counter now takes that into account, so pasting in urls of any length now "costs" a fixed amount
                (currently 19 characters for an HTTP url; 20 characters for an HTTPS url). The plugin no longer
                uses <a href='http://bit.ly'>bit.ly</a>.</p>

                <p>Made it so that hitting ENTER while entering a tweet does not actually launch the
                export. This is a maddeningly-frustrating aspect of the Lightroom plugin infrastructure,
                but I've worked around it in a way that seems to work.</p>

                <p>The 'refresh list' button was missing from the upload-destination list when it was configured to be a popup menu.</p>

                <p>Google doesn't allow videos to be updated, so an attempt to republish them is silently ignored. Video metadata is updated.</p>

                <p>Fixed "attempt to compare nil with number" error that some users might have gotten in Publish.</p>

20110712.163 -- Had a minor plugin-crashing boo-boo in the previous update

20110711.162 -- Really long captions could cause a stack overflow.

20110708.161 -- Fix the "Export:663" error some have gotten.

20110706.160 -- Still struggling with catalog-access issues that seemed to have materialized out of the blue (with a bug in Lr3.4??).
                This update addresses creating a new publish collection.

20110706.159 -- <p>The manual-association dialog was too big for some screens... now it auto-adjusts depending on the screen size.</p>
                <p>More on the catalog-access errors that some are getting with Lr3.</p>
   
20110703.158 -- For Lr2, fixes a 'must be called inside withReadAccessDo' error I'd recently introduced. For Lr3, tries to address a similar error that seems to pop up in rare cases.

20110623.157 -- <p>There's a bug in Lightroom that causes it to sometimes include private keywords in exported copies. The plugin now detects these situations and alerts you to them, allowing you to avoid a privacy blunder.</p>

20110614.156 -- Better error reporting for Google errors that we can do nothing about.

20110606.155 -- <p>Better handle long album names by truncating at the beginning with '...', and having the tooltip be the full name.</p>

20110521.154 -- <p>Added a new section to the Publish Service settings dialog, on whether to refresh remote comments automatically or manually.</p>
                <p>Be more robust to errors during the gallery-creation process.</p>
                <p>Fixed a bug that caused the export destination to not properly refresh in response to selecting a preset in the export dialog.</p>

20110513.153 -- Fixed a bug in how some export errors are reported.

20110419.152 -- <p>Handle more gracefully the error that Google returns if you've changed your password since the last time the plugin authenticated itself.</p>
                <p>Wasn't properly issuing an error message when used with Lr3.0 and Lr3.2.</p>

20110409.151 -- <p>Fixed some plugin-crash asserts that some new users might get.</p>
                <p>Added "select all" button to Publish collection list.</p>

20110329.150 -- Oops, the button to refresh the list of galleries had inadvertently disappeared.

20110324.149 -- <p>Previous build was broken under Lr2, and some Lr3 installs.</p>

20110322.148 -- <p>Added the ability to create new PicasaWeb albums from within the publish manager.</p>
                <p>Added the ability to sort the album list in the Publishing Manger</p>
	            <p>Added the ability to select which metadata items cause a Publish republish.</p>

20110311.147 -- <p>Added support for uploading videos. It's predicated on my guessing the MIME type of the video from the filename extension,
                so if you run into one I get wrong, please let me know.</p>
                <p>Added the ability to manually associate photos to images at PicasaWeb, via the
                <span class='nobr'>&#8220;<b>File &gt; Plugin Extras &gt; PicasaWeb Extras</b>&#8221;</span> dialog.
                <p>Detect when Google throws up a CAPTCHA wall, and directs the user to be vetted by Google in their browser.</p>

                <p>Added a progress dialog to the &#8220;Re-mark as Published&#8221; operation, so that it can be canceled,
                and to make it clear that something is going on under the hood.</p>

                <p>Fixed a bug whereby one couldn't export via preset to an account different from the currently-logged in account.</p>

                <p>The list of upload destinations was sometimes getting cut off</p>

20110120.146 -- <p>Added &#8220;Re-Mark as Published&#8221; to the Plugin-Extras dialog
                <span class='nobr'>(&#8220;File &gt; Plugin Extras &gt; PicasaWeb Extras&#8221;)</span>.

                If you have published photos in the &#8220;Modified Photos to Re-Publish&#8221; grid segment, this moves
                them back to &#8220;Published Photos&#8221; without actually uploading anything to PicasaWeb. You might
                use this after making what you know to be a metadata-only change that won't affect how the image is
                shown at PicasaWeb.</p>

                <p>Fixed a problem such that long album names caused buttons to become inaccessible in the export dialog.</p>

                <p>Not sure what happened to the export dialog since I last checked it in Windows, but it was in need of some UI love.</p>

20110116.145 -- Added Twitter support to Publish.

20110113.144 -- <p>This version no longer works in Lr3.0 and Lr3.2 because many bugs have been fixed in Lr3.3: if you're using Lr3.0 or Lr3.2,
                please visit Lightroom's <span class='nobr'>&#8220;<b>Help &gt; Check for Updates</b>&#8221;</span> to download the
                free update from Adobe. (The plugin also continues to work in Lr2.)</p>

                <p>Added {CroppedWidth} and {CroppedHeight} to the <a href='http://regex.info/blog/lightroom-goodies/template'>template tokens</a>
                used by my plugins.</p>

                <p>Add a note of instruction to handle a (rare) situation where one needs to reauthenticate in the normal Export Dialog in order
                to get a Publish Service working again.</p>

                <p>Be more graceful in certain no-response-from-Google situations.</p>

20101217.143 -- Updated Twitter support for Twitter's new API endpoints

20101124.142 -- Fixed a crash sometimes encountered while updating remote-account data in the plugin.

20101116.141 -- <p>Check whether galleries at PicasaWeb have been renamed from when publish-service collections were created, and prompt
                the user with a note that the renaming can be incorporated into Lightroom by enabling the "Forcefully rename current collections"
                option.</p>

                <p>Replaced an ugly debug message that popped up when the plugin detected that a publish-service collection's related
                gallery at PicasaWeb has been removed from PicasaWeb, with a more user-friendly message.</p>

20101104.140 -- <p>Not sure when photo deletion started to fail, but updated the plugin to handle Google's response.</p>
                <p>Be more clear about quote-exceeded messages from Google.</p>

20101028.139 -- <p>Fixes &#8220;<i>Spec:343: attempt to index field '?' (a nil value)</i>&#8221; error some were getting</p>
                <p>Uses with more than 1,000 albums were getting the list chopped off... now all albums are shown, though
                album lists this large are pushing the limits of what Lightroom can handle.</p>


20100908.138 -- <p>Publish was sometimes getting stuck in a 'not logged in' state, if you hadn't refreshed your account data in the plugin for too long a time.
                Not sure why I might have built it that way, but I took off the time limit so now it shouldn't get stuck anymore. Wish I understood why I'd put
                it in in the first place, though. )-:</p>

	            <p>Warn about the loss of metadata if the "resize to megapizels" option is used.</p>

20100830.137 -- When I upgraded the plugin to work with Google's JSON API, I neglected to handle login expiration in
                every place I needed. I think I've taken care of it now.

20100829.136 -- Made the revalidation process much simpler, doing away with the silly need for a revalidation file.

20100820.135 -- Discovered a bug in my plugin build system that caused horribly difficult-to-track-down errors in one plugin,
                so am pushing out rebuilt versions of all plugins just in case.

20100817.134 -- Added code to allow plugin revalidation after having been locked due to a bad Lightroom serial number.</p>

20100801.133 -- <p>Creating of a private gallery in the tools section
                didn't cause the gallery to be auto-selected for export.

20100729.132 -- <p>Added an interactive filter to the album list in Publish; it'll show up if there are more than 10 albums.
                Only albums whose names match all the (space-separated) terms in the filter are shown.</p>

	            <p>Added the {KeywordsAll} template tag, for all keywords (like {Keywords}, but also includes those not marked for export).</p>

	            <p>A few users found some photos to always be "stuck" as Modified photos in a Publish collection. I'm
	            still not 100% what might be going on and can't replicate the issue myself, but this version of the
	            plugin tries some things to hopefully alleviate the problem.</p>

20100715.131 -- There was a bug on Windows that caused the warning about potentially-excessive JPEG quality settings to
                lock up Lightroom for an indeterminate amount of time. Only way I could fix it was to move the warning to
                the metadata management section (where it doesn't belong as much as it doesn't belong where it was
                before, but Lightroom doesn't let me put it where it should go, next to the jpeg-quality slider).
                This also allowed me to put it back into Publish.

20100715.130 -- Yikes, the JPEG-quality thing I added didn't play well with Publish. Removing it from Publish 'till I figure
                out a better way.

20100712.129 -- <p> Egads, the list of albums in the Publish Service dialog was not sorted.</p>

                <p>Did a lot of work to revamp the ability to tie in photos already at PicasaWeb into your Lightroom
                catalog (and hence to populate a PicasaWeb publish service), working around bugs in Lightroom.
                See the <a href='http://regex.info/blog/lightroom-goodies/picasaweb/publish#maintenance'>new publish docs</a>
                for details.</p>

                <p>The plugin has long remembered your export settings from PicasaWeb export session to PicasaWeb export
                session, overriding Lightroom's desire to always bring your recent export settings from non-PicasaWeb
                exports. However, I had neglected to update the list of settings for Lightroom 3, so this is now
                corrected, and so the plugin now also remembers watermarking settings, file-renaming and photo-stacking,
                and DNG compatibility.</p>

                <p>Clarified that the "delete all copies previously uploaded" option applies to, well, all copies
                previously uploaded, as opposed to some magic subset of copies previously uploaded that you might have
                fixed in mind.</p>

                <p>Added a warning that blocks export when the JPEG quality is set needlessly high, referring users to my <a
                href='http://regex.info/blog/lightroom-goodies/jpeg-quality'>Analysis of Lightroom JPEG Export Quality
                Settings</a>. You can bypass the warning if you like, and hide it forever, of course.</p>

20100702.128 -- <p>Discovered some rare and complex bugs related to collection renaming, and (I hope) fixed them.</p>

                <p>Some users get "Unexpected resource version ID" errors when deleting photos, and while I can't replicate it myself,
                trying a blind change that might fix it.</p>

20100630.127 -- <p>Finally pushing the new version out of plugin beta (<a
                href='http://regex.info/blog/2010-06-08/1539'>where it has been</a> for a couple of weeks), after eight
                months of oft-painful development. It's extremely complex under the hood, so now that it's getting wider
                user and additional bugs are shaken out, there will likely be frequent updates... please keep an eye on
                the version history when you update.</p>

                <p>Here are the update details from when it was in beta:</p>

                <div class='bg-B' style='padding:0.7em; font-size:94%'>

                   <p><b>20100616.120</b> &mdash; This version can be <a href='http://regex.info/blog/2010-06-08/1539'>registered in
                   Lightroom 3</a>. It can run in Lightroom 2 or Lightroom 3; it does not work in the Lr3 betas.</p>

                   <p>It uses my new registration system when run on Lightroom 3,
                   which avoids some of the silly issues of the old one. Please take care to note
                   the details on <a href='http://regex.info/blog/lightroom-goodies/register'>the registration
                   page</a>: use of this version (or later) of the plugin in Lightroom 3 requires a new
                   registration code, even if you had registered some older version of the plugin.</p>

                   <p>Lots and lots of changes under the hood, including <a
                   href='http://regex.info/blog/lightroom-goodies/picasaweb/publish'>publish
                   support</a> in Lr3.</p>

                   <p><b>20100624.121</b> &mdash; Lots of bug fixes, and lots of new debug logging.</p>

                   <p><b>20100624.122</b> &mdash; Discovered a nasty build bug; pushing a new version in case it affects this plugin.</p>

                   <p><b>20100625.123</b> &mdash; Yikes, shaking out some more build issues.</p>

                   <p><b>20100628.124</b> &mdash; Had broken auto destinations.</p>

                   <p><b>20100629.125</b> &mdash; Lots of changes. Bolstered the separation between Publish and non-Publish exports.</p>

                   <p><b>20100629.126</b> &mdash; Lots more changes, especially related to auto destinations and replacing images.
                   I sure wish Google would hire a few more PHDs to destupdify their photo API.
                   Identified that "Import Smart Collection Settings" does not work for Publish,
                   and corrupts things. Don't use it.</p>

              </div>

20100510.119 -- <p.Added "STORAGE_UNAVAIL" to the list of mysterious Google replies that get auto-retried.</p>

20100507.118 -- <p>Added an automatic retry for when Google returns its mysterious "SERVER_ERROR" error.</p>

                <p>Handled more gracefully a replace operation when the target photo no longer exists at PicasaWeb</p>

                <p>Added some options to the Twitter <b>&lt;dest <i>options</i>&gt;</b> special code: add <b>simple</b>
                as an option to have it become just the name without quotes or other adornment; add <b>short</b> to par
                down the gallery name to just the leaf name. They can be combined, e.g. <b>&lt;dest short
                simple&gt;</b>.</p>

                <p>Added some stuff to the <b>LUA</b> <a
                href='http://regex.info/blog/lightroom-goodies/template'>template token</a>: a version of the standard
                <b>os</b> table (with <i>date</i>, <i>difftime</i>, <i>getenv</i>, es and <i>time</i>), and the standard
                Lightroom STK tables <i>LrDate</i>, <i>LrPathUtils</i>, and <i>LrStringUtils</i>). Also added a new
                functions <b>TBL()</b> (returns an empty table), <b>ne(<i>item</i>)</b> (returns true if the item is not
                empty), and <b>nb(<i>item</i>)</b> (returns true if the item is not blank; " " is blank but not empty,
                while "" and nil are both blank and empty).</p>

20100323.117 -- <p>Removed some Lr3-related debugging stuff that's showing up now that <a
                href='http://regex.info/blog/2010-03-23/1479'>Lr3b2 is out</a>. All plugin-related things should work in
                Lr3b2 except Publish, which will likely change drasticly between now and when Lr3 is actually released.</p>

                <p>New when running Lr3b2 is a new "Snapshots on Export" section, which is basically a built-in
                version of <a href='http://regex.info/blog/lightroom-goodies/snapshot-on-export'>this new plugin</a>.</p>

                <p>Added new tokens to the templates used in my plugins: <b>IfKeyword</b> and
                <b>IfExportedKeyword</b> are supported for Lr2 and later. For Lr3b1 and later the very powerful
                <b>LUA</b> token, and for Lr3b2 and later, a bunch of new localized date/time tokens. See the <a
                href='http://regex.info/blog/lightroom-goodies/template'>templates page</a> for details.</p>

20100315.116 -- <p>Wholesale changes that attempt to honor the user's locale settings for numeric display (e.g. Europeans
                writing 3,14156 for pi). I've probably missed some spots, so let me know if you find some.</p>

                <p>Added three new tokens to the templates that my plugins use, <b>CameraName</b>,
                <b>IfGeoencoded</b>, and <b>Keywords</b>. See the <a
                href='http://regex.info/blog/lightroom-goodies/template'>templates page</a> for details.</p>

20100221.115 -- <p>Changed the semantics of the <tt>Places</tt> filter (in the tokens understood by the <a
                href='http://regex.info/blog/lightroom-goodies/template'>preset templates</a> of my plugins) in two
                ways: if applied to a string value rather than a number, it works on the first number found in the
                string. Another is that you can now use something like <tt>Places=-1</tt> to round to the 10s,
                <tt>Places=-2</tt> to round to the 100s, etc.</p>

	            <p>Title presets weren't getting saved across LR restarts in some cases (for definitions of "some"
                meaning "all", sorry).</p>

20100205.114 -- <p>Oops, the upload date/time custom metadata items were swapped. Doh! With this new version, each
                catalog will auto-update to correct the issue the first time it's loaded. The format used for the date
                and time are restricted in Lr2 to whatever I've chosen, but the first time you load the plugin in the
                real Lr3 (whenever it comes out), the catalog will update itself again to write the dates/times in your
                user-customized, localized format.</p>

                <p>Fixed the {GPSAltitude} template token so that it should now actually work.</p>

20100205.113 -- <p>Lots of updates to the Twitter support:</p>
                <ul>

                <li>Better tweet-size estimates in line with recent processing changes at Twitter.</li>

                <li>Added &lt;caption&gt; tag to the tweet-text template (it use the caption from the first image
                exported).</li>

                <li>Added the ability to geotag tweets with a static location, or with the geoencoded location of the
                first image. A static location can be specified with a <i>latitude, longitude</i> pair, a <a
                href='http://geohash.org/'>geohash</a>, or a url from a mapping service like Google, Yahoo, or Bing. On
                the encoded side, geodata embedded in the image can be used, or the geodata maintained by <a
                href='http://regex.info/blog/lightroom-goodies/gps'>my geoencoding-support plugin</a>).</li>

                <li>You can now configure the plugin to shorten URLs via your own <a href='http://bit.ly'>bit.ly</a>
                account, in case you want to track click-throughs yourself.</li>

                <li>You can now specify that you want <i>all</i> URLs shortened. The default remains to shorten them
                only when required to get under the 140-character limit. You might, for example, want to forcefully
                shorten them all in conjunction with your own bit.ly account, for click-through tracking.</li>

                <li><p>The plugin now goes to great lengths to report whether a tweet is accepted by Twitter. In their
                infinite wisdom, the folks at Twitter suddenly decided to start ignoring long tweets instead of
                truncating them, but (here's the brilliant part) <i>they still report back to the plugin that the tweet
                was successful</i>. Sigh.</p>

                <p>Furthermore, they might also ignore (yet report as successful) other kinds of tweets, such as those
                that are a repeat of a "too recent" tweet. Those crafty folks at Twitter implemented these changes more
                than three months ago, but in a truly cunning move, <i>they still detail the old behavior in their API
                documentation, making no mention whatsoever about how their service now actually works.</i></p>

                <p>Only by doing a bunch of extra work can the plugin detect whether a tweet was accepted or ignored. If
                ignored, there's no way for the plugin to know why, so at this point it merely reports that the tweet
                didn't go through.</p></li>

                <p>Added the ability to control whether to send a Twitter tweet with photo keywords.</p>

                </ul>

                <p>Completely changed how the one-click upgrade applies the newly-downloaded zip file, in the hopes that
                it'll work for more people. Rather than unzipping over the old copy, it now unzips to a temporary
                folder, then moves the old folder out of the way and the new folder into place. Prior versions' folders
                are now maintained (with the version number in the folder) in case you want to revert a version; you
                may want to clear them out from time to time. Of course, it won't take affect until you try to upgrade
                <i>after</i> having upgraded to or beyond this version.</p>

	            <p>Caught a few more Lr3b issues.</p>

20100118.112 -- Added two new <a href='http://regex.info/blog/lightroom-goodies/template'>template tokens</a>,
                <b>{<a href='http://regex.info/blog/lightroom-goodies/template#DaysSince'>DaysSince</a>}</b>
                and
                <b>{<a href='http://regex.info/blog/lightroom-goodies/template#PhotoDaysSince'>PhotoDaysSince</a>}</b>.
                They're a bit tricky, but could be useful.

20100111.111 -- <p>Added the ability to set the date of an album while creating it, comparable to the feature
                added in <b>v99</b> for automatic destinations. Also fixed a bug in that earlier code that
                made the minutes value of the album date wrong (though I don't think it really matters,
                because Google doesn't show the time-of-day on album dates.)</p>

                <p>And it seems that I screwed up the previous version naming, pushing it out as <b>20100130.110</b>
                instead of <b>20100109.110</b>, so the automatic version check for those running <b>v110</b> will be
                fooled for the next month into thinking that there are no updates. These binary-looking dates are
                making me feel dyslexic. Sorry.</p>
           
20100109.110 -- <p>For some reason, Google no longer seems to be pulling the photo-capture time from an uploaded image,
                thereby falling back to the upload time as the "photo date". Perhaps it's just a bug, but in any case,
                the plugin now forcefully sets the photo date during the upload, so it seems to be working again.</p>

                <p>I also figured out how to enable a "replace" function, so that you can update an image in place and not
                lose comments, etc.</p>

20091230.109 -- Added a "Repopulate URLs" button to the Plugin Extras dialog, to allow correcting for the bug fixed in
                the previous push, and to correct for photos uploaded with old versions of the plugin.

20091230.108 -- Sigh, it seems 30,000+ lines of code are getting to be hard to keep track of, and I unintentially removed the
                exported url from the custom metadata (from the 'At PicasaWeb' item) a few versions back. This should fix it,
                at least for images uploaded from now.

20091216.107 -- Figured out when the "AgExportSession.photoExportSequence is obsolete; use photoIdExportSequence
                instead" error was coming from. A bug in Lr3 beta. I had to disable the export filter for the beta to avoid this.

20091216.106 -- Got a runtime error in the face of network failures. Now should be a bit more graceful.

20091215.105 -- Allow changing the font size of list of upload destinations. Those with long names might want to choose
                a smaller size to allow more text to fit on each row.

20091214.104 -- Added the special <b>{NOJOINERS}</b> token to the <a
                href="http://regex.info/blog/lightroom-goodies/template">Template Language</a> understood by my plugins.

20091210.103 -- Actually get the feature added in v99 to work.

20091209.102 -- A few small fixes for Lr3b, and tweaks to the extra-keywords stuff do tidy up repeated keywords in the display.

20091205.101 -- Minor internal debugging tweaks.

20091203.100 -- Turns out that Google has a 500 photos-per-album limit, so the plugin now reports it more clearly when
                that error is reached. I also put in something to retry the upload if the REJECTED_USER_LIMIT error is
                hit. I never run into it myself, so it's a shot in the dark whether the new code will actually work, and
                it's still debatable just what "REJECTED_USER_LIMIT" actually means, since Google does not seem to
                document the errors they might send back. We'll see.

20091123.99 -- Added an option in the auto-destinations stuff to set the date of auto-created albums to the date of the
               first photo.

20091118.98 -- Added an <tt>{Altitude}</tt> item to the <a href='http://regex.info/blog/lightroom-goodies/template'>templates</a> understood
               by the plugin. It's the numeric altitude in meters, as opposed to the <tt>{GPSAltitude}</tt> item which is
               a description of the altitude along the lines of <span class='nobr'>&#8220;<b>32.7 m</b>&#8221</span>.
               Also updated the <tt>Places</tt> filter so that it can be used on fields that merely begin with a number.

20091023.97 -- A bunch of UI fixes for Lr3b, such as fixing the scrollbar and the token-examples dialog.

20091022.96 -- Added a <b>first draft</b> of some rudimentary support for <i>Lightroom 3 Beta</i>.
               See <a href='http://regex.info/blog/2009-10-22/1339' class='quiet'>this important note about
               plugin support in <i>Lightroom 3 Beta</i> and <i>Lightroom 3</i></a>, including future plans for
               features and my registration system.

20091014.95 -- Followup correction on yesterday's push.

20091013.94 -- Google seems to be having all kinds of troubles with their servers and the delete-photo operation.
               This push tries to work around them so that the "Delete copies previously uploaded" option doesn't
               cause the upload to abort.

20090916.93 -- Some UI tweaks earlier in the month had an unintended side effect of breaking the "choose destination
               at export time" feature. Sorry... fixed! Also, added some prose to make it more clear that the "create
               gallery" part of the choose-destination-at-export-time dialog is not part of the export process, but
               merely a tool placed there for the convenience of those wishing to create a new gallery just prior
               to exporting.

20090915.92 -- Fixed some keyword-related issues. First, due to a silly bug on my part, there had been an artificial
               limit on the number of keywords sent.  Second, also due to a bug on my part, the keyword order was
               scrambled. The plugin now sends them in the order Lightroom provides them (which seems to be alphabetic).
               (Sorry to everyone who couldn't contact my server for the last few days... it had "issues",
               that are now fixed.)

20090905.91 -- Turns out that Lightroom has a bug in its XML parser on OSX that was tickled by yesterday's push.
               I've worked around it in this one, and filed a bug with Adobe. Sorry for the hassles.

20090904.90 -- I'm back from <a href='http://regex.info/blog/2009-09-01/1305' class='quiet'>a long trip</a> and starting
               up the plugin machinery again. This push addresses a small issue <a
               href='http://regex.info/blog/lightroom-goodies/picasaweb#comment-36559' class='quiet'>reported today</a>
               that causes ampersands in your display name to show up incorrectly. I had been fairly sloppy in how
               the plugin processed user data from Google, but now I've done it in the Right and Proper way. Hopefully
               I didn't break anything along the way. :-) 

20090717.89 -- Fixed a "wrong number of arguments to insert" bug.

20090716.87 -- Sigh, Twitter engineers treat developers like a bunch of twits. Twitter just made a sudden, unannounced,
               and undocumented change to how they allow external applications like this plugin to connect to Twitter,
               breaking every external application out there. If a plugin follows the Twitter documentation, it will not
               work. I couldn't believe Twitter engineers could be so inexperienced or hostile (which?) the first time
               they pulled a stunt like this, but again? This is ridiculous... are there kids running the shop over
               there? If they do this again, I may just yank Twitter support from the plugins... it's not worth the
               frustration. For the time being, this push should fix things.

20090714.86 -- <p>Completely rewrote how the &#8220;extra tags to send...&#8221; line is parsed. It could sometimes be
               a bit wonky, especially when <a href='http://regex.info/blog/lightroom-goodies/template'
               class='quiet'>template tokens</a> were used, but hopefully it's more solid now.</p>

               <p>Speaking of the template tokens, I added a bunch more somewhat esoteric things, filling out all
               the metadata items available to the plugin. Something like &#8220;Workflow Job Identifier&#8221;
               might not be all that useful, but if you repurpose a field with my
               <a href='http://regex.info/blog/lightroom-goodies/metadata-presets' class='quiet'>metadata-viewer preset
               builder plugin</a>, these otherwise esoteric items may prove to be useful. For example, I've
               relabeled the Job Identifier field as &#8220;Blog Url&#8221; in my custom view, and can now use the
               <tt>{JobIdentifier}</tt> token to refer to it.</p>

               <p>I redid all the code on <a
               href='http://regex.info/blog/lightroom-goodies/template#joining'>squelching
               joining characters</a> to make more sense (I hope), and included <tt>&lt;br&gt;</tt> and friends (e.g.
               <tt>&lt;br/&gt;</tt>) as special joining characters that should magically do the right thing.
               Also added colon as a joining character.</p>

               <p>Enhanced the one-click upgrade stuff quite a bit, now
               detecting ahead of time when it will fail because the plugin is installed where Lightroom
               can't write (if Lightroom can't write to it, it can't update itself). I
               also added a progress bar, and now download in smaller chunks to avoid 'out
               of memory' errors on the larger plugins. Do remember that this new functionality becomes
               available <i>after</i> you upgrade to or past this version, when you then upgrade <i>with</i> it.</p>

               <p>Fixed that during an upload of a single image, the progress-bar status didn't reflect when the
               image was being uploaded (it said "rendering..." the whole time).</p>

               <p>Added a defensive error check: try to detect some of the weird error messages that the OS returns
               when a firewall blocks Lightroom from using the Internet. You'd be shocked to hear how much time I spend
               telling people "check your firewall and enable an exception for Lightroom...". Hopefully this'll stem
               that stream.</p>

20090616.85 -- Sigh, this upload-destination fiasco is a real pain. Maybe have it nailed down this time.

20090615.84 -- Some people are still having images uploaded to the wrong album, and I'm starting to think
               that it's a case of corrupt Lightroom preferences. I've looked at some logs and it seems to
               be a case of "this can't possibly happen" happening. I've added something in this version that
               kills some old information with prejudice.... if this doesn't take care of it, please send
               a log again (via the "Send to Jeffrey" button in the upper-right of the plugin manager), but I
               suspect my reply will be to ask you to blast your LR preferences file and start over.

20090614.83 -- <p>Sigh, it turns out that a few days ago, Twitter suddenly changed authentication methods in a
               way that was guaranteed to break every strong-authentication application (such as this plugin).
               <i>Sigh</i>.
               This update handles the new authentication style, and includes better error reporting
               for the next time they pull a stunt like this.</p>

   
               <p>Fixed progress bar during upload.</p>

               <p>Added a couple of new custom metadata fields, "PicasaWeb Upload Date", and "Upload Time". The former can
               be used in the Library Grid Filter to sort/select/filter by the date you uploaded to PicasaWeb.</p>

               <p>Because the new custom fields mean a change to the database, the first time you load this new
               version, Lightroom will pop up a dialog asking "Update catalog for plug-in?" to which you'll want
               to answer yes ("Update"). Then a progress bar will show up and, if you have a lot of photos in your
               catalog that had been uploaded to PicasaWeb, will just sit there for potentially several minutes,
               looking stuck. Just let it work. For my catalog with 48,000 photos, it took about 5 minutes.</p>
                
               <p>I'll add these to my <a href='http://regex.info/blog/lightroom-goodies/metadata-presets'
               class='quiet'>Metadata-Viewer Preset Editor plugin</a> soon, but for those maintaining their own viewer
               tagsets, these can be found at <tt>info.regex.lightroom.export.picasaweb2.uploadDate</tt> and
               ...<tt>.uploadTime</tt>.</p>


20090602.82 -- <p>Well, here's something new: Twitter support. It may be a bit iffy, mostly because I don't use Twitter
               myself, so perhaps I've missed something about the culture in which it's used, but I've added something
               that allows you to send a tweet after a successful upload, with a mini template language that allows you
               to include a photo url or destination-set url in the tweet.</p>

               <p>The plugin uses Twitter's new strong secure authentication, so you don't even have to tell the plugin
               your username or password. You authenticate
               at Twitter and grant the plugin application permission to send tweets on your behalf.</p>

               <p>A note to fellow developers, who will feel my pain: in order to get this strong-secure authentication
               support working, I had to code up <a href='http://en.wikipedia.org/wiki/SHA_hash_functions#SHA-0_and_SHA-1'
               class='quiet'>SHA-1 Secure Hash</a> computation from scratch, in pure Lua... a horrid language, I'll remind
               you, that has absolutely no bitwise operations, or even integer support. No masks, no bitwise xors, no way
               to test bits or shift words or any of that stuff. As I coded it, I felt as if I were chiseling NAND gates
               from rough blocks of silicon.</p>

               <p>I felt quite the achievement once I got it working, but only then realized that I also need to code
               up my own <a class='quiet' href='http://en.wikipedia.org/wiki/HMAC-SHA1'>HMAC-SHA1</a> secure signature
               routine. It's less involved than the original SHA-1 stuff, but again, filled with bytewise xors. Fun
               stuff, in a very old-school way.</p>


20090521.81 -- Sorry, another quick bugfix. It seems an internal change I made to try to get around a bug in Lightroom
               wasn't quite ready for prime time. Hope it is now.

20090521.80 -- <p>Fixed a "loadstring" error some users got.</p>

               <p>You can now use the scroll wheel with the scrollable lists (such as for the album list)...
               sort of. It works while the mouse is actually hovering over the scroll bar. That's the best I can figure
               out so far... it's better than nothing if you're a scroll-wheel user.</p>

               <p>Added some new <a href='http://regex.info/blog/lightroom-goodies/template#filters'>token filters</a>
               to the preset templates used for things like extra tags and image captions: They're listed in the
               docs, but include new items like <b>UCFirst</b> capitalize first character of the item, or <b>LC</b> to
               lower-case the entire item. For example, if you want to include the city as an extra tag, but prefer
               your tags to be all lower case, you might use <tt><b>{City:LC}</b></tt> in the extra-tag dialog.</p>

20090519.79 -- Fixed an album-creation bug I introduced recently, and added the hard-coded PicasaWeb's image-size
               limit of 20MB, so you'll be informed before upload that it's too big.

20090518.78 -- Somewhere along the way the plugin stopped updating the progress bar as it worked. I've restored it, so
               now you can see it inch along as the uploads complete. I also included some stuff to communicate with
               the next version of
               <a href='http://regex.info/blog/lightroom-goodies/metadata-wrangler' class='quiet'>my Metadata Wrangler
               plugin</a> help coordinate a canceled export. Unfortunately, if you cancel an export, Lightroom does not
               tell filters like the Metadata Wrangler, so it blindly continues trying to process images that will not
               show up. I've added some hooks here to help the next version of the Metadata Wrangler detect a canceled
               export and not complain. It's imperfect, but I'm hoping it'll help.

20090510.77 -- Added a link in the Plugin Manager to the plugin's update-log RSS feed.

20090509.76 -- <p>Added items to the title/description presets: <b>ZenfolioUrl</b>, <b>SmugMugUrl</b>, and <b>FlickrUrl</b>.
               If you have previously uploaded this image to one of those sites with my plugin that
               uploads to those sites, you can refer to that copy of the image by reference. Using the tag alone, e.g.
               <b>{ZenfolioUrl}</b>, it becomes the raw url, or nothing if the image wasn't previously uploaded. Using
               a <b>=<i>text</i></b> argument inside the tag turns it into a link with the given text, e.g.</p>
<pre>
    See the {ZenfolioUrl=photo at Zenfolio}.
</pre>

               <p>becomes:</p>
<pre>
    See the &lt;a href='...'&gt;photo at Zenfolio&lt;/a&gt;.
</pre>

               <p>if the url is known. If the url is not known, the tag is replaced with nothingness,
               so you might want to include an "<b>|...</b>" fallback section, such as:</p>

<pre>
    See the {ZenfolioUrl=photo at Zenfolio|<b>"photo at &lt;a href='http://myname.zenfolio.com'&gt;my Zenfolio site&lt;/a&gt;"</b>}.
</pre>

               <p>The entire double-quoted part after the "<b>|</b>" is used when what comes before ends up being empty.
               In this case, that double-quoted part is some text that includes a link to a Zenfolio user's home page
               (you'd want to put yours, of course). So, if the url isn't known, the entry becomes</p>

<pre>
    See the photo at &lt;a href='http://myname.zenfolio.com'&gt;my Zenfolio site&lt;/a&gt;.
</pre>


20090429.75 -- Fixed a bug that could potentially crashed the plugin while
               editing caption/title and auto-destination presets.

20090425.74 -- Tweaked how the plugin tries to update itself during the one-click upgrade process,
               to hopefully get things working for those few Windows users that have never had it work. Crossing
               fingers. We'll see.

20090422.73 -- Fixed the caption preset stuff to disallow editing of the built-in caption presets,
               and added a note to that effect in the preset editor. I also reset the 'None' preset to an empty
               value, just in case it had gotten edited in a prior version of the plugin. Sorry it took so long to
               get around to this fix.

20090422.72 -- A few minor housekeeping updates: the 'enable enhanced debugging' checkbox in the
               Plugin Manager now turns on logging of all web traffic. It'll be useful if I ask you to send a log,
               but you probably want to leave it turned off during general use. I also added an icon to the
               registration page to reinforce what plugin is being registered.

20090403.71 -- <p>Corrected the photo-date related items in the <a
               href='http://regex.info/blog/lightroom-goodies/template'>preset templates</a> to properly use the
               <b>dateTimeOriginal</b> metadata field, rather than the edit-time <b>dateTime</b> field. It now uses the
               first of the following that it finds with a value: <b>dateTimeOriginal</b>, <b>dateTimeDigitized</b>, and
               <b>dateTime</b>. This bug was reported to me long ago, but I let it slip through the cracks, sorry.</p>

20090402.70 -- Added scroll-one-line arrows to the top and bottom of the scrollbars, to allow fine-grained
               control of scrolling very long lists. (I've been programming for almost 30 years, but this
               is the first time I've ever built a graphical scrolling
               system from scratch, so I may be a bit slow on the uptake at times :-) )

20090329.69 -- <p>Turns out that there's a bug in Lightroom that causes login names to be rejected
               if they can't actually fit in the input box that's presented when trying to log into
               a second account. To get around this bug for the few who run into it, I've made the box as
               wide as I can... I hope it's sufficient.</p>

20090325.68 -- <p>Big UI changes in some areas. I've cobbled together a way to add
               what appears to be a real scrollbar, so I've replaced the kludgey
               scrolling solution I had before. It seems to work okay.</p>

               <p>I also changed the "Token Examples" dialog from paging to
               use the new scroll stuff.</p>

20090313.67 -- <p>It seems that PayPal doesn't give everyone a "Unique
               Transaction ID" in the registration confirmation mail; some people get a
               "Receipt Number". So, the registration dialog now accepts that as well.</p>

               <p>I also removed the "Resolution value to record in
               metadata" control in the Metadata Management section. That
               had dated back to a time when the resolution setting was not
               available in the standard "Image Sizing" section of the
               export dialog, and I forgot to remove my custom one when the
               standard setting appeared. It was sort of silly having two
               controls for the same thing, sorry.</p>

               <p>The resolution setting is still utterly meaningless
               unless you use it to actually compute the pixel size of the
               image (that is, if you have the "resize to" setting to
               something other than "pixels"). Once the image has been
               created, it's just a hint about how you intend it to be
               rendered when printed, but it has exactly zero impact on
               the quality that can or can't be achieved when printing.</p>



20090310.66 -- I've added a popup dialog that appears the first time you
               install this plugin that explains how to activate it from the Export
               Dialog. It's currently not very &#8220;discoverable&#8221; (in UI lingo),
               and it leaves a lot of people befuddled. I hope this helps to stem the flow
               of &#8220;I can't get it to work&#8221; messages I get each day. I've
               begged Adobe to tweak the UI to make it more clear in the future.

20090305.65 -- Fixed a bug that caused the plugin to crash (and stay
               crashed across Lightroom restarts, even!) when deleting the caption preset
               that was actually chosen for the caption.

20090303.64 -- If there's an error calculating the automatic destination
               for a photo, now actually reports that error instead of just crashing

20090302.63 -- Fixed a bug that could cause the plugin to crash when using the <b>File &gt; Plugin Extras</b>

20090228.62 -- Fixed a bug that caused a plugin crash if my server couldn't be reached during registration.

20090219.61 -- <p><b>NOTE: you may need to restart Lightroom after installing to this (or
               a later) version from the previous (or an earlier) version. Please try a
               restart if you get an error the first time you try to use the
               plugin.</b></p>

               <p>As per the ongoing discussion on my blog, with this version the plugin moves over to
               a "donationware" model, in which the plugin remains free, but registration eventually becomes
               required (and an eventual donation hoped for :-) ).</p>

               <p>For details, see <a class='quiet'
               href='http://regex.info/blog/2009-02-15/1148'><i>Lightroom Plugin
               Development: Now With Added Encouragement</i></a>. (For info about what
               drove this decision, see <a class='quiet'
               href='http://regex.info/blog/2009-02-03/1134'><i>What To Do When a Hobby
               Becomes Work?</i></a>)</p>
               
               <p>The plugin no longer expires, and correspondingly, I will not pay much attention to reports
               of bugs that have already been fixed, so please check your version and
               the version history before submitting bugs or feature requests.</p>

               <p>There was a lot of internal upheaval in the code, so I expect that some boo-boos my
               surface. If something breaks for you with this version, please let me know, but
               until I fix it, feel free to revert to <a
               href='http://regex.info/LightroomPlugins2/releases/picasaweb-20090129.60.zip'>the
               previous version</a>.</p>

               <p><b>Several fixes and enhancements in this release</b>: It can now track multiple PicasaWeb
               logins, and you can easily switch between and among them. There have been a lot of UI tweaks
               to make things look more natural (but Lightroom's plugin infrastructure still places great
               restrictions on what can be done, so it's not like it's smoothly polished yet). It now has
               more robust error reporting in the face of network problems.</p>


20090129.60 -- Small housekeeping update for the new locales supported by Lightroom 2.3.
               Added more info to the debugging log when an export operation begins, to help diagnose any
               subsequent problems with the export.

20090126.59 -- The new scrollable-list stuff didn't deal with ampersands very well... things should be better now. Also added tooltips to the list items so that the full text can be read even if the display is cut short, although ampersands may appear in duplicate (or quadruplicate, depending on the OS)... it just wasn't worth the effort to get ampersands right in the tooltip.

20090119.58 -- <p>Okay, so I spent the entire weekend working on my own scrollable-list control from scratch, because the built-in popup menu is just not very easy to work with when one has a lot of galleries. I didn't have much to work with, and the result is a bit wonky, but it's <i>much</i> more usable when the list is long, so I'm throwing it out there. If you don't have a long list of export destinations, you can revert back to the original via the "configure list appearance" button. With that button you can also change how much of the list is shown at once, to suit your personal preference.</p>

20090116.57 -- It turns out that the automatic upgrade stuff doesn't work if the plugin folder has been renamed from its original. That should generally not happen, but it's possible, so the plugin now checks its own location reports the issue to the user if it finds it.

20090115.56 -- Added more debugging-log stuff to the 'Upgrade Now' button action, to try to understand why it doesn't work for some people.

20090115.55 -- Added a 'click here to change the export destination' note to the masthead image, because some new users are confused how to change export destinations.

20090110.54 -- Added a checkbox in the Plugin Manager to turn on enhanced debugging (more stuff in the plugin's debugging log), and added a button in the same place that sends your log to me. Particularly for &#8220;the upgrade button doesn't work&#8221; and &#8220;error while uploading&#8221; type issues, this should be useful for debugging.

20081228.53 -- My preset dialog (for caption presets) was a bit wonky and didn't update itself when a preset was added. Fixed that. Also, in the export dialog proper, the example text next to the preset dropdown didn't auto-expand as the preset was changed. Fixed that, too.

20081224.52 -- The "Extras" item in the File menu had stopped working. Works now.

20081223.51 -- Bumping back the expiration date.

20081215.50 -- Small fix for some of the logging code.

20081208.49 -- Fixed a problem that sometimes caused errors during login/authentication, or after logging out.

20081204.48 -- Try to work around a fairly rare Lightroom bug that sometimes causes large exports to fail with the note <i>Whoa, exported image doesn't exist after waitForRender</i> by pausing for a few seconds to see whether the image shows up. If not, then you still get the error and the export fails.

20081128.47 -- Added the "auto destination" feature.

20081127.46 -- The counting of previous uploads (for the All/Update/New of the Upload Destination section) was not working right.

20081125.45 -- Another fix for a bug that had disabled plugin presets (for captions, etc.)

20081124.44 -- Perhaps fixed a problem whereby the "Upgrade Now" button didn't work for some Windows users. We'll see whether it works when those users upgrade from this version to whatever version is next.

20081123.43 -- Fixed a plugin crash when using the plugin's built-in preset system.

20081122.42 -- No problems from the upheaval recently, so pushing back the expiration a bit.

20081118.41 -- Fix album-creation bug.

20081117.40 -- Oops, wouldn't let you log in / authenticate if you weren't already. Doh. Fixed.

20081117.39 -- No new functionality in this version, but a huge upheaval in the underlying code to repair an unfortunate design choice I made early on
               in the development that had limiting consequences I'd not foreseen. There are likely bugs introduced in this version, and as such, it
               has a short expiration date to encourage updates as those bugs are reported and fixed. If you do run into an error, please send (via <a
               href='mailto:jfriedl@yahoo.com'>email</a>) the log referenced in the upper-right of the Plugin Manager. Thanks.

20081113.38 -- Fixed yet another list-of-upload-destinations bug. There are sure a lot of edge cases here.

20081111.37 -- Fixed a crash that happened sometimes when there are not yet any preexisting destinations at PicasaWeb.

20081104.36 -- Perhaps squelch a spurious error dialog

20081103.35 -- I don't know what's causing the slew of networking problems that have been reported, but I've gone ahead and added a retry mechanism. It'll retry operations that failed due to network problems indefinitely, but you can cancel out of the retries if you like. If the problems are some kind of flakiness on the machine (somehow introduced in Lr2.1???) this may allow operations to complete.

20081031.34 -- Now works properly with the shadow GPS data maintained by my <a href="http://regex.info/blog/lightroom-goodies/gps/">geoencoding plugin</a>.

20081024.33 -- Added an option to not add Lightroom keywords as metadata when uploading images. This allows you to not send any keywords if you also have them stripped from the image itself, such as when enabling the "Minimize Embedded Metadata" option, or when stripping keywords with my <a href="http://regex.info/blog/lightroom-goodies/metadata-wrangler/">Metadata Wrangler</a>.  This applies only to keywords in the Lightroom library that are marked for export; those not marked for export are never sent. (Also related, recall that due to a Lightroom bug, images in a catalog upgraded from Lightroom 1.x with Lightroom 2.0 lost the ability to export keywords until <a href="http://kb.adobe.com/selfservice/viewContent.do?externalId=kb405074&sliceId=2">a fix</a> is applied.)

20081022.32 -- Addressed (and perhaps even fixed) a bug introduced in the previous build.

20081021.31 -- Small update so that a stuck background version check does not disable the plugin.
               Added the ability to put the "select at time of export" item at the top of the destination list, as had been requested a few times.
               Added some items to the <a href='http://regex.info/blog/lightroom-goodies/template/'>template language</a> that had inexplicably been missing: {HH}, {MIN}, {hh}, {min}, {ss}.

20081015.30 -- Added back the ability to set the print size via DPI and inches/cm. I think it's more confusing than anything (because it has nothing to do with what size something gets printed at unless you take care to set the printer DPI the same), but someone asked for it and I should really leave it up to the user.
               The plugin now allows you to use any color space registered on your computer when generating images to upload. I don't think this will be useful for very many people, but perhaps it might be a benefit when combined with some printing services(?)

20081010.29 -- Changed the PicasaWeb login method to not exclude users of Google Apps (which, apparently, had been happening until now).
               Internal change to the user-agent string that the plugin sends when uploading, to better conform to web standards

20080924.28 -- <p>I created a "Metadata Management" section in the dialog, and moved some things into that from other sections.</p>
               <p>Fixed a race condition that sometimes caused the export destination to not appear in the synopsis of a closed "Upload Destination" dialog section.</p>
               <p>Removed the "replace" option, which had been inadvertently displayed (but disabled) for everyone. Google's "replace" operation requires
               HTTP support that Lightroom's plugin API doesn't provide.</p>
               <p>Moved the items in the "Upload Management" section into the "Upload Destination" section, since they are really quite related.</p>

20080923.27 -- Sigh, just realized that the "check for new version" stuff <i>did</i> break in 2.1. Totally my fault, sorry. Fixed.

20080921.26 -- Oops, the ability to use my template tokens in the 'extra keyword/tags' area, that I added last week, didn't actually recompute the tags on a per-image basis, applying the tags computed for the first image to all the others. That's now fixed, and tags are recomputed with each image.

20080920.25 -- Enhanced the <tt>{Rating}</tt> token to allow <tt>{Rating=*}</tt> to create "*****" through "". You can put most anything instead of the asterisk, so you might consider <tt class="nobr">{Rating=great&nbsp;}</tt> to end up with "great great great". Since these forms result in nothing for an unrated photo, you can use the "|" pipe to provide a default "when empty" value, such as "rating":   <tt>{Rating=*|"unrated"}</tt>

20080918.24 -- Added the ability to use template tokens like {Filename} in the "extra tags" input box.

20080916.23 -- Update an error message to reflect an apparent bug in LR that causes LR to hand off a file to my plugin for upload before the file is actually available. This seems to happen when using LR/Mogrify or other filters.
               Updated the url shown in the "status" section of the plugin manager

20080916.22 -- <i>Finally</i> have the upgrade button working on both Win and Mac. Since I <a href='http://regex.info/blog/2008-09-09/929'>returned home</a> last week, I now have access to both kinds of machine for the first time since Lr2 was released. I can sum up the 5 hours I spent wrestling with the unzip code in three word: <b>I hate Windows</b>. Microsoft owes me five hours of my life back.   Note that you may have to install this one by hand in order to get the newly working upgrade button... it's the <i>next</i> upgrade that should be easy-as-click.

20080914.21 -- Added a few more descriptive tooltips to the example-token dialog

20080914.20 -- Oops, fixed a boo-boo introduced in the previous version.

20080914.19 -- Remember (again) the upload-destination across exports. It used to work, and I'm not sure when it stopped working, but it must have been really annoying while it was broken, sorry.

20080914.18 -- Fixed tokens "OriginalWidth" and "OriginalHeight" in templates.
               Added a bunch of new <a href='http://regex.info/blog/lightroom-goodies/template/'>template tokens</a> and a
               new token filter. Added a token-examples button, which brings up a dialog listing all tokens and their value for
               an example photo (the first photo in the export list).

20080905.17 -- Fixed an "undefined global: DestinationSynopsis" error that could happen when using a preset with a "select at export time" upload-destination setting

20080831.16 -- Handle a race condition in the upgrade logic that sometimes results in a superfluous "You have version XYZ, but version XYZ is now available" message

20080829.15 -- Added a bunch of new items to the <a href="http://regex.info/blog/lightroom-goodies/template/">template language</a>.

20080829.14 -- Oops, left some debugging cruft that results in an "empty" dialog if the logged-in-user has no galleries or the like. Fixed.

20080828.13 -- Minor tweaks

20080828.12 -- A few more tweaks to report a failed upgrade attempt a bit more clearly

20080828.11 -- Whoo-hoo, finally figured out the "assert" problem that some people without albums were having.

               When upgrading, ignore a status of &#8220;50&#8221; (which means &#8220;out of
               disk space&#8221;) from the unzip the plugin performs. It seems Windows often
               reports this status even when there's plenty of disk space left, so until I
               can understand it better, I'll just ignore that code.

20080827.10 -- Fixed the Caption {Filetype} token (was broken for DNGs).
               Made some Layout tweaks in my preset dialogs.
               Added titles to the tools sections (were missing on OSX)

20080817.9 -- Lots of little tweaks as I cleaned things up. Added a bunch of stuff to the Plugin Manager, including
              a &#8220;What's New&#8221; button that shows up next to the &#8220;Upgrade Now&#8221; button when a new version is available.
              Removed the auto-destination stuff because I'm getting error-code 500 responses from Google with them. Will investigate.

20080814.8 -- Fixed infinite cycle of 'assert' messages one might get in odd situations

20080812.7 -- Fixes (I hope) a "bad argument #1 to '?' (table expected, got nil)" error

20080811.6 -- Moved and renamed the debugging logs to a temporary folder, and added log Show/Delete buttons to the plugin's custom section of the Plugin Manager.

20080806.5 -- Fixed {State} and {Rating} in <a href='http://regex.info/blog/lightroom-goodies/template/'>preset templates</a>.

20080805.4 -- Oops, the Windows versions had lost the ability to upgrade themselves. Once this version is installed manually, subsequent versions should be able to upgrade <a href='http://regex.info/blog/lightroom-goodies/plugin-installation/#upgrade'>as discussed here</a>.

20080804.3 -- Fixed "Access to undefined global: LrError" error that happens when trying to report a login-related problem.

20080804.2 -- Fixed a couple of internal errors related to the "choose destination at time of export" feature

20080729.1 -- Initial public release

--]]----------------------------------------------------------------------------
