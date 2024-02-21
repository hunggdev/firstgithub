#include <bits/stdc++.h>
using namespace std;

#define ll long long
#define db double
#define fi first
#define se second
#define en cout << '\n'
#define pr pair<string, int>
#define IOS                           \
    ios_base::sync_with_stdio(false); \
    cin.tie(0);                       \
    cout.tie(0)

int main()
{
    vector<ll> v(18);
    v[0] = 45;
    for (int i = 1; i < 17; i++)
    {
        v[i] = v[i - 1] * 9 + (pow(10, i) * 45);
    }
    for (auto it : v)
        cout << it << endl;
    return 0;
}
// 1 2 3 4 5 6 7 8 9 = 45
// => 45 A
// 10 11 12 13 14 15 16 17 18 19 = 45 +10
// 20 21 22 23 24 25 26 27 28 29 ...= 45+20
// 90 92 .. 99 = 45 + 9*10
// => A*9 +(10*45);B

// 100 ... 109 = 45 +10

// (100-199): 45*9+..+100*1
// (200-299): 45*9+..+100*2
// ..
// (900-999): 45*9+..+100*9
// => B*9+(100*45);C

// 1000-1999
// 9000-9999
// => C*9+(1000*45);

// 9 13
// 1784

// 1000 1700: A+B+7*B+(100*28)
// 700 780: A+A*8+(10*36)
// 80 84: 10

// 1723 1784 -> 23 -> 84

// 15632784623
// 10000000000
// 15000000000

// 23 5641
// 30-5640

// 23-29: 7*2+12*7/2
// 30-99: 10*(12*7/2) +45*7
// 100-4999: 9*B+(100*45)+1000*(4*4/2)+C*5;
// 5000-5641: 5*642+(A+B+(B*6+(100*7*6/2)+A*4+10*(5*4/2)+9))

// 145 188
// 100-145: 46+A+4*A+(10*5*4/2)+6*4+5*6/2;
// 100-188: 89+A+8*A+(10*8*8/2)+9*8+8*9/2;
