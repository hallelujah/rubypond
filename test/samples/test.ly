\version "2.12.3"


\relative c'
{
  <<
    \new Staff
  {
    \time 6/8
      \times 1/3{c8 d8 c8} \times 1/3 {e8 c8 a8} \times 1/3{c8 d8 a8}
  }

  \new Staff  {
    \time 3/4
      % r\maxima *1/8 c'\longa *1/4 c\breve*1/2 
      c2 a4 r8 cis4 ~ cis32 ~ cis128  r64. r16 
  }
  >>
}


