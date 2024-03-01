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

void ip()
{
    string s;
    while(getline(cin,s)){
        vector<string> v;
        stringstream ss(s);
        string s1;
        while(ss>>s1) v.push_back(s1);
        int ans=0;
        for(auto it: v){
            string x=it;
            int d=1,so=0;
            if(x[0]=='-'){
                d=-1;
                x.erase(x.begin());
            }
            bool ch=true;
            for(int i=0;i<x.size();i++){
                if(isalpha(x[i])){
                    ch=false;
                    break;
                }
                so=so*10+(x[i]-'0');
            }
            if(ch) ans+=so*d;
        }
        cout<<ans;
        en;
    }
}

int main()
{
    ios;
    tasks();
    ip();
    return 0;
}