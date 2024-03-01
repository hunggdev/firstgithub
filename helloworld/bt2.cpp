#include <bits/stdc++.h>
using namespace std;

#define ll long long
#define db double
#define sz size
#define en cout << "\n"
#define vec vector
#define pb push_back
#define ios                           \
    ios_base::sync_with_stdio(false); \

void tasks()
{
    freopen("bt.inp", "r", stdin);
    freopen("bt.out", "w", stdout);
}

int t,n;
vec<vec<int>> a,b;

bool check(int n){
    vec<vec<int>> ans(n,vec<int> (n));
    for(int i=0;i<n;i++){
        for(int z=0;z<n;z++){
            for(int j=0;j<n;j++){
                ans[i][z]+=a[i][j]*a[j][z];
            }
        }
    }

    vec<vec<int>> ans1(n,vec<int> (n));
    for(int i=0;i<n;i++){
        for(int z=0;z<n;z++){
            for(int j=0;j<n;j++){
                ans1[i][z]+=a[i][j]*ans[j][z];
            }
        }
    }
    bool ch=true;
    for(int i=0;i<n;i++){
        for(int j=0;j<n;j++){
            if(ans1[i][j]!=b[i][j]){
                ch=false;
                break;
            }
        }
    }
    
    if(ch) return 1;
    else return 0;
}

void ip()
{   
    cin>>t;
    while(t--){
        cin>>n;
        a.resize(n,vector<int> (n));
        b.resize(n,vector<int> (n));

        for(int i=0;i<n;i++){
            for(int j=0;j<n;j++) cin>>a[i][j];
        }

        for(int i=0;i<n;i++){
            for(int j=0;j<n;j++) cin>>b[i][j];
        }

        if(check(n)) cout<<"YES";
        else cout<<"NO";
        en;
    }
}

void solve()
{

}
int main()
{
    ios;
    tasks();
    ip();
    solve();
    return 0;
}