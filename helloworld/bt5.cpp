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
        while(ss>>s1){
            v.push_back(s1);
        }
        for(auto it: v){
            string x=it;
            x[0]=toupper(x[0]);
            for(int i=1;i<x.size();i++) x[i]=tolower(x[i]);
            cout<<x<<" ";
        }
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