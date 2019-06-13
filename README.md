# qbcps_flutter

A collection of utility classes that I wind up using in multiple projects.

None of these is particularly complicated, but in the interest of reuse I put
them in this library rather than copy them all over the place.

Probably the class with the most utility for other folks is `MapDB`, which
is just a map-backed database, as the name suggests. I wrote it as a stand-in
for Firebase so I could do offline development, and it comes in handy for
writing test cases.
