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
        int sum=0;
        for(auto it: s){
            if(int(it)>47 && int(it)<58){
                sum+=(it-'0');
            }
        }
        while(sum>11){
            int s1=0;
            while(sum){
                s1+=sum%10;
                sum/=10;
            }
            sum=s1;
        }


        stringstream ss(s);
        string s1;
        while(ss>>s1){
            v.push_back(s1);
        }
        string x;
        for(auto it: v) x+=it;
        cout<<x<<" "<<sum;
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