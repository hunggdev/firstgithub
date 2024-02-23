#include <bits/stdc++.h>
using namespace std;

#define ll long long
#define db double
#define sz size
#define en cout<<"\n"
#define ios                           \
    ios_base::sync_with_stdio(false); \
    cin.tie(0)

void tasks()
{
    freopen("bt.inp", "r", stdin);
    freopen("bt.out", "w", stdout);
}

struct node{
    ll ri, qi, xi, yi;
};

void solve(ll a, ll b)
{
    cout<<a<<" "<<b;
    en; 
    vector<node> v;
    v.push_back({b,0,0,1});
    v.push_back({a,0,1,0});
    int i=1;
    while(v[i].ri){
        i++;
        ll r=v[i-2].ri%v[i-1].ri;
        ll q=v[i-2].ri/v[i-1].ri;
        ll x=v[i-2].xi-q*v[i-1].xi;
        ll y=v[i-2].yi-q*v[i-1].yi;
        cout<<r<<" "<<q<<" "<<x<<" "<<y; en;
        v.push_back({r,q,x,y});
    }
    cout<<v[i-1].xi;
}

void ip()
{   
    solve(550 ,1759);
}

int main()
{
    ios;
    // tasks();
    // ip();
     solve(550,1759);
    return 0;
}