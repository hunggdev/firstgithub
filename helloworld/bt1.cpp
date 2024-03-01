#include <bits/stdc++.h>
using namespace std;

#define ll long long
#define db double
#define sz size
#define ios                           \
    ios_base::sync_with_stdio(false); \
    cin.tie(0)

void tasks()
{
    freopen("bt.inp", "r", stdin);
    freopen("bt.out", "w", stdout);
}

ll max(ll x1, ll x2){
    return x1>x2;
}

void solve(ll a, ll b, ll k)
{
    ll a1 = k / 2;
    ll b1 = a1;
    if (k % 2 != 0)
        a1++;
    cout<<max(0,a-a1)<<" "<<max(0,b-b1);
    
}

void ip()
{
    ll a, b, k;
    cin >> a >> b >> k;
    solve(a, b, k);
}

int main()
{
    ios;
    // tasks();
    #ifndef ONLINE_JUDGE
        freopen("test.inp","r",stdin);
    #endif
    ip();
    fclose;
    return 0;
}