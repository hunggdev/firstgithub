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

vector<vector<int>> v;
int x,y;

void ip()
{
    v.resize(3,vector<int> (3));
    for(int i=0;i<3;i++){
        for(int j=0;j<3;j++) cin>>v[i][j];
    }
    cin>>x>>y;
}


void solve(){
    vector<int> v1;
    for(int i=0;i<3;i++){
        if(i!=x-1){
            for(int j=0;j<3;j++){
                if(j!=y-1) v1.push_back(v[i][j]);
            }
        }
    }
    int ans=v1[0]*v1[3]-v1[1]*v1[2];
    cout<<ans;
}

int main()
{
    ios;
    // tasks();
    ip();
    solve();
    return 0;
}