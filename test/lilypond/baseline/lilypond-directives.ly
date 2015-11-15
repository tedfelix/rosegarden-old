% This LilyPond file was generated by Rosegarden 15.12
\include "nederlands.ly"
\version "2.12.0"
\header {
    composer = "D. Michael McIntyre"
    copyright =  \markup { "Copyright "\char ##x00A9" 2006 D. Michael McIntyre" }
    subtitle = "demonstrating assorted exportable directives"
    title = "Lilypond Export Demo #2"
    tagline = "Created using Rosegarden 15.12 and LilyPond"
}
#(set-global-staff-size 18)
#(set-default-paper-size "a4")
global = { 
    \time 4/4
    \skip 1*7 
}
globalTempo = {
    \override Score.MetronomeMark #'transparent = ##t
    \tempo 4 = 130  
}
\score {
    << % common
        % Force offset of colliding notes in chords:
        \override Score.NoteColumn #'force-hshift = #1.0
        % Allow fingerings inside the staff (configured from export options):
        \override Score.Fingering #'staff-padding = #'()

        \context Staff = "track 1, LilyPond" << 
            \set Staff.instrumentName = \markup { \center-column { "LilyPond " } }
            \set Staff.midiInstrument = "Acoustic Grand Piano"
            \set Score.skipBars = ##t
            \set Staff.printKeyCancellation = ##f
            \new Voice \global
            \new Voice \globalTempo

            \context Voice = "voice 1" {
                % Segment: Acoustic Grand Piano
                \override Voice.TextScript #'padding = #2.0
                \override MultiMeasureRest #'expand-limit = 1

                \clef "treble"
                R1 \bar "||" 
                R1 \bar "|." 
                r4 r r r\tiny  \bar ":" 
                g 4 \glissando d'' d'' \glissando g  |
%% 5
                r4\normalsize  r < c' e' g' c'' e'' g'' c''' > 2 \arpeggio  |
                r2^\markup { \musicglyph #"scripts.segno" }  r^\markup { \musicglyph #"scripts.coda" }   |
                s4\small  s^\markup { \bold "To" }  s^\markup { \musicglyph #"scripts.coda" }  s  |
                \bar "|."
            } % Voice
        >> % Staff (final) ends

    >> % notes

    \layout {
        indent = 3.0\cm
        short-indent = 1.5\cm
        \context { \Staff \RemoveEmptyStaves }
        \context { \GrandStaff \accepts "Lyrics" }
    }
%     uncomment to enable generating midi file from the lilypond source
%         \midi {
%         } 
} % score
