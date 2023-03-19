#!/usr/bin/env python
"""
A script to automatically export bookmarks from Firefox's SQLite database.

There does not seem to be a programmatic way to get Firefox to export its bookmarks in
the conventional HTML format. However, you can access the bookmark information directly
in Firefox's internal database, which is what this script does.

Always be careful when working with the internal database! If you delete data, you will
likely not be able to recover it.

Author:  Ian Fisher (iafisher@protonmail.com)
Version: March 2019
"""
import os
import pprint
import shutil
import sqlite3
import tempfile
from collections import namedtuple


#FIREFOX_FOLDER = "/home/iafisher/.mozilla/firefox/5838am19.default"
FIREFOX_FOLDER = "/Users/rmcclain/Library/Application Support/Firefox/Profiles/nr3bgp1n.default-release"


# The `add_date` and `last_modified` fields are integer timestamps, which can be
# converted to human-readable strings by the time.ctime standard library functions.
# The `tags` field is a list of strings; all other fields are just strings.
Bookmark = namedtuple(
    "Bookmark", ["title", "url", "add_date", "last_modified", "tags", "parent"]
)


# Firefox acquires a lock on places.sqlite that prevents us from even reading the
# database file, so we need to copy it to a temporary directory first so that the script
# works even when Firefox is open.
tmpdir = tempfile.gettempdir()
shutil.copy(os.path.join(FIREFOX_FOLDER, "places.sqlite"), tmpdir)

conn = sqlite3.connect(os.path.join(tmpdir, "places.sqlite"))
cursor = conn.cursor()
cursor.execute("""
    SELECT
        moz_places.id, 
        moz_bookmarks.title, 
        moz_places.url, 
        moz_bookmarks.dateAdded,
        moz_bookmarks.lastModified,
        moz_bookmarks.parent
    FROM
        moz_bookmarks
    LEFT JOIN
        -- The actual URLs are stored in a separate moz_places table, which is pointed
        -- at by the moz_bookmarks.fk field.
        moz_places
    ON
        moz_bookmarks.fk = moz_places.id
    WHERE
        -- Type 1 is for bookmarks; type 2 is for folders and tags.
        moz_bookmarks.type = 1
    AND
        moz_bookmarks.title IS NOT NULL
    ;
""")
rows = cursor.fetchall()

# A loop to get the tags for each bookmark.
bookmarks = []
for place_id, title, url, date_added, last_modified, parent_id in rows:
    # A tag relationship is established by row in the moz_bookmarks table with NULL
    # title where parent is the tag ID (in moz_bookmarks) and fk is the URL.
    cursor.execute("""
        SELECT 
            A.title 
        FROM 
            moz_bookmarks A, moz_bookmarks B
        WHERE
            A.id <> B.id
        AND
            B.parent = A.id
        AND
            B.title IS NULL
        AND
            B.fk = ?;
    """, (place_id,))
    tag_names = [r[0] for r in cursor.fetchall()]
    cursor.execute("SELECT title FROM moz_bookmarks WHERE id=?", (parent_id,))
    parent = cursor.fetchone()[0]
    bookmarks.append(Bookmark(title, url, date_added, last_modified, tag_names, parent))

conn.close()


# Print out the bookmarks, or do whatever else you'd like with them.

for bookmark in bookmarks:
  print(bookmark.url, bookmark.title)


