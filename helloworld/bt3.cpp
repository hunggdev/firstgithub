#include <bits/stdc++.h>
using namespace std;

#define ll long long
#define db double
#define sz size
#define en cout << "\n"
#define ios                           \
    ios_base::sync_with_stdio(false); \

void tasks()
{
    freopen("bt.inp", "r", stdin);
    freopen("bt.out", "w", stdout);
}

bool chprime(int x){
    if(x<2) return 0;
    if(x==2) return 1;
    for(int j=2;j<=sqrt(x);j++){
        if(x%j==0) return 0;
    }
    return 1;
}

int m,n;
vector<vector<int>> v;

void ip()
{
    cin>>m>>n;
    // v.resize(m,vector<int> (n));
    int x;
    map<int, int> mp;
    for(int i=0;i<m;i++){
        for(int j=0;j<n;j++){
            cin>>x;
            if(mp[x]!=0) continue;
            else if(chprime(x)) mp[x]++;
        }
    }
        
    for(auto it: mp){
        if(it.second!=0) cout<<it.first<<" ";
    }
}

int main()
{
    ios;
    tasks();
    ip();
    return 0;
}