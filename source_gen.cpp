#include <bits/stdc++.h>
using namespace std;

#define ll long long
#define db double
#define fi first
#define se second
#define en cout << '\n'
#define pr pair<string, int>
#define ios                           \
    ios_base::sync_with_stdio(false); \
    cin.tie(0);                       \
    cout.tie(0)

void iof()
{
    freopen("test.inp", "w", stdout);
}

ll randll(ll l, ll r){
    ll res=0;
    for(int i=0;i<4;i++) res=(res<<15)^(rand() &((1<<15)-1));
    return l+res%(r-l+1);
}

void ip()
{
}

void solve()
{
}

int main(void)
{
    ios;
    srand(time(nullptr));
    iof();
    ip();
    solve();
    return 0;
}