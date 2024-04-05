#include <bits/stdc++.h>
using namespace std;

#define ll long long
#define fi first
#define se second
#define vc vector
#define pb push_back
#define str string;
#define en cout << '\n'

typedef struct node
{
    int data;
    node *next;
} node;

node *makenode(ll x)
{
    node *t = new (node);
    t->data = x;
    t->next = nullptr;
    return t;
}

void inserthead(node *&list, ll x)
{
    node *t = makenode(x);

    if (list == nullptr)
    {
        list = t;
    }
    else
    {
        t->next = list;
        list = t;
    }
    return;
}

void delhead(node *&list)
{
    node *t = list;
    if (list == nullptr)
        return;
    else
    {
        list = list->next;
        delete t;
    }
}

void reversenode(node *&list)
{
    if (list == nullptr)
        return;

    node *t = list;
    node *t2 = t->next;
    t->next = nullptr;

    while (t2 != nullptr)
    {
        node *t3 = t2->next;
        t2->next = t;
        t = t2;
        t2 = t3;
    }

    list = t;
}

void createlist(node *&list, string s)
{
    vc<ll> v;
    string x;
    stringstream ss(s);
    while (ss >> x)
    {
        v.pb(stoll(x));
    }

    int len = v.size();

    for (auto it : v)
    {
        inserthead(list, it);
    }
}

void showlist(node *list)
{
    node *l1 = list;
    while (l1 != nullptr)
    {
        cout << l1->data << " ";
        l1 = l1->next;
    }
    en;
}

int sizelist(node *list)
{
    node *l1 = list;
    int cnt = 0;
    while (l1 != nullptr)
    {
        cnt++;
    }
    return cnt;
}

void deletedata(node *&list, ll x)
{
    // if (list == nullptr)
    //     return;
    // while (list->data == x)
    //     delhead(list);
    // node *t = list;

    // if (t == nullptr)
    //     return;

    // while (t->next != nullptr)
    // {
    //     node *t1 = t->next;
    //     if (t1->data == x)
    //     {
    //         t->next = t1->next;
    //         delete t1;
    //     }
    //     else
    //         t = t->next;
    // }
    if (list == nullptr)
        return;
    node *t = list;
    while (t->next != nullptr)
    {
        node *t1 = t->next;
        if (t->data == x)
        {
            if (t->next != nullptr)
            {
                t->data = t1->data;
                t->next = t1->next;
            }
            else
                t->next = nullptr;
        }
        else
            t = t->next;
    }
}

void removeduplicatenote(node *&list)
{
    if (list == nullptr)
        return;
    node *l1 = list;
    while (l1 != nullptr)
    {
        node *t = list;
        ll x = l1->data, cnt = 0;
        if (t->data == x)
        {
            cnt++;
            t = t->next;
        }
        if (t == nullptr)
            return;
        while (t->next != nullptr)
        {
            node *t1 = t->next;
            if (t1->data == x && cnt != 0)
            {
                t->next = t1->next;
                delete t1;
            }
            else
                t = t->next;
        }

        l1 = l1->next;
    }
}

void ip()
{
    string s;
    getline(cin, s);
    node *list = nullptr;
    createlist(list, s);
    showlist(list);
    deletedata(list, 1);
    // deletedata(list, 2);
    // reversenode(list);
    // removeduplicatenote(list);
    showlist(list);
    // showlist(list);
    // while(s!="end"){
    //     cin>>s;

    // }
}

int main()
{
    ip();
    return 0;
}