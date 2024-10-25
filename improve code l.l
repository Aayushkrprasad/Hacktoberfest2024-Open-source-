#include <iostream>
#include <memory>

// Node structure using shared_ptr
struct Node {
    int data;
    std::shared_ptr<Node> next;

    Node(int value) : data(value), next(nullptr) {}
};

// Linked List class
class LinkedList {
private:
    std::shared_ptr<Node> head;

public:
    LinkedList() : head(nullptr) {}

    // Insert at the beginning
    void insert(int value) {
        auto newNode = std::make_shared<Node>(value);
        newNode->next = head;
        head = newNode;
    }

    // Display the list
    void display() {
        auto temp = head;
        while (temp != nullptr) {
            std::cout << temp->data << " -> ";
            temp = temp->next;
        }
        std::cout << "null" << std::endl;
    }

    // Search for a value
    bool search(int value) {
        auto temp = head;
        while (temp != nullptr) {
            if (temp->data == value) {
                return true;
            }
            temp = temp->next;
        }
        return false;
    }

    // Delete the first occurrence of a value
    void deleteValue(int value) {
        if (!head) return;

        if (head->data == value) {
            head = head->next;
            return;
        }

        auto temp = head;
        while (temp->next != nullptr && temp->next->data != value) {
            temp = temp->next;
        }

        if (temp->next) {
            temp->next = temp->next->next;
        }
    }
};

int main() {
    LinkedList list;

    // Insert values
    list.insert(10);
    list.insert(20);
    list.insert(30);
    list.display();

    // Search for a value
    int searchValue = 20;
    if (list.search(searchValue)) {
        std::cout << searchValue << " found in the list." << std::endl;
    } else {
        std::cout << searchValue << " not found in the list." << std::endl;
    }

    // Delete a value
    list.deleteValue(20);
    list.display();

    return 0;
}
