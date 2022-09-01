# Body of topic
sage: var('a,s')
sage: eqns=[(20053/25448)*s - (2664/30346)*a == 17589,
            (-48/25448)*s + (21316/30346)*a == 21243]
sage: solve(eqns, s, a)

# Exercise 1a
var('s,a')
system = [(20053/25448)*s -  (2664/30346)*a == 17789,
            -(48/25448)*s + (21316/30346)*a == 21243]
solve(system, s,a)
n(2772443022712/106830469), n(6476439541923/213660938)
# Exercise 1b
var('s,a')
system = [(20053/25448)*s -  (2664/30346)*a == 17689,
            -(48/25448)*s + (21316/30346)*a == 21443]
solve(system, s,a)
# Exercise 1c
var('s,a')
system = [(20053/25448)*s -  (2664/30346)*a == 17789,
            -(48/25448)*s + (21316/30346)*a == 21443]
solve(system, s,a)


# Exercise 3a
var('s,a')
system = [(20053/25448)*s -  0.0500*a == 17589,
            -(48/25448)*s + (21316/30346)*a == 21243]
solve(system, s,a)

# Exercise 3b
var('s,a')
system = [(20053/25448)*s -  0.0500*a == 17589,
            -(48/25448)*s + (21316/30346)*a == 21500]
solve(system, s,a)




# Exercise 4
sage: var('a,s')
(a, s)
sage: eqns=[(11.79/18.69)*s - (1.28/14.27)*a == 10.51,
....:       (-0)*s         + (9.87/14.27)*a == 9.87]
sage: solve(eqns,s,a)
[[s == (1869/100), a == (1427/100)]]
sage: n(1869/100)
18.6900000000000
sage: n(1427/100)
14.2700000000000
sage: eqns=[(11.79/18.69)*s - (1.28/14.27)*a == 11.561,
....:       (-0)*s         + (9.87/14.27)*a == 11.3505]
sage: solve(eqns,s,a)
[[s == (8119559/393000), a == (32821/2000)]]
sage: n(8119559/393000)
20.6604554707379
sage: n(32821/2000)
16.4105000000000
sage: eqns=[(11.79/18.69)*s - (1.28/14.27)*a == 13.53,
....:       (-0)*s         + (9.87/14.27)*a == 16.34]
sage: solve(eqns,s,a)
[[s == (137466107/5541300), a == (1165859/49350)]]
sage: n(137466107/5541300)
24.8075554472777
sage: n(1165859/49350)
23.6242958459980
sage: 24.8075554472777*1.3
32.2498220814610
sage: 23.6242958459980*1.3
30.7115845997974
