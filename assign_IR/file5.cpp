#include <iostream>

using namespace std;

class foo
{
public:
    int data;
    foo *next;
};

void func(foo **head_ref, int val)
{
    foo *new_node = new foo();
    new_node->data = val;
    new_node->next = (*head_ref);
    (*head_ref) = new_node;
}

int main()
{
    foo *head = NULL;

    func(&head, 1);
    func(&head, 2);
    func(&head, 3);
    func(&head, 4);
    func(&head, 5);
    func(&head, 6);
    
    foo *node = head;

    while (node != NULL) {
        cout << node->data << " ";
        node = node->next;
    }
    cout << "\n";
    return 0;
}
