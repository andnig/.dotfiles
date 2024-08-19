#! /usr/bin/env sh

osascript -e 'set targetFolder to POSIX file "$HOME"

tell application "Finder"
    open targetFolder
    activate
end tell'
