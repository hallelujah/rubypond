\version "2.12.3"
\layout {
  \context {
    \Voice
      \remove "Note_heads_engraver"
      \consists "Completion_heads_engraver"
  }

}

\relative c'
{
  \time 3/4
    <<
    \new Staff   {
      c8 d8 c8 e8 c8 a8 c8 d8 a8
    }

  \new Staff  {
    % r\maxima *1/8 c'\longa *1/4 c\breve*1/2
      c2 r8 cis4 ~ cis32 ~ cis128 c8 a4 r64 r16
  }
  >>
}


