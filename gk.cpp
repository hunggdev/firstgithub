#include <bits/stdc++.h>
using namespace std;

#define ll long long
#define db double
#define fi first
#define se second
#define en cout << '\n'
#define pr pair<string, int>
#define vc vector
#define ios                           \
    ios_base::sync_with_stdio(false); \
    cin.tie(0);                       \
    cout.tie(0)

const int maxn = 1e6 + 5;

void iof()
{
    freopen("test.inp", "r", stdin);
    freopen("test.out", "w", stdout);
}

vc<int> a, b, dt;
vc<bool> vt, vt1;
int t;

void ip()
{
    cin >> t;
    while (t--)
    {
        int n, m, k;
        cin >> n >> m >> k;
        a.resize(n);
        b.resize(m);
        vt.resize(maxn, false);
        vt1.resize(maxn, false);
        dt.resize(maxn, 0);
        for (auto &x : a)
            cin >> x;
        for (auto &x : b)
        {
            cin >> x;
            vt[x] = true;
            vt1[x] = true;
        }

        deque<int> dq;
        int cnt = 0, ans = 0, x = 0;
        for (int i = 0; i < n; i++)
        {
            x++;
            dq.push_back(a[i]);
            if (vt[a[i]])
            {
                cnt++;
                vt[a[i]] = false;
            }
            if (vt1[a[i]])
                dt[a[i]]++;
            if (x == m)
            {
                if (cnt >= k)
                    ans++;
                int y = dq.front();
                if (vt1[y])
                {
                    cnt--;
                    dt[y]--;
                    if (dt[y] > 0)
                        cnt++;
                    else
                        vt[y] = true;
                }
                dq.pop_front();
                x--;
            }
        }
        cout << ans;
        en;
        vt.clear();
        vt1.clear();
        dt.clear();
        a.clear();
        b.clear();
    }
}

int main()
{
    ios;
    iof();
    ip();
    return 0;
}
