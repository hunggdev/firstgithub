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

int t;
string s;

void ip()
{
    while(cin>>s){
        s="*"+s;
        string ans="";
        for(int i=1;i<s.size();i++){
            if(s[i]!=s[i-1]){
                ans+=s[i];
                int j=i+1,d=1;
                while(s[i]==s[j]){
                    d++;
                    j++;
                }
                ans+=to_string(d);
                i=j-1;
            }
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