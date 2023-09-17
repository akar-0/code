// https://www.codewars.com/kata/reviews/65018b8958a7230001babb28/groups/65054b401de3de00014d8289


#include <stddef.h>
#include <string.h>
#include <stdlib.h>

struct BST {
    int data;
    double sum;
    double length;
    struct BST* left;
    struct BST* right;
};

struct BST* createBST(int data, int i) {
    struct BST* node = malloc(sizeof(struct BST));
    node->data = data;
    node->sum = i;
    node->length = 1;
    node->left = node->right = NULL;
    return node;
}

void freeBST(struct BST* root) {
    if (root) {
        freeBST(root->left);
        freeBST(root->right);
        free(root);
    }
}

struct BST* insert(struct BST* root, int data, int i) {
    if (!root) { return createBST(data, i); }
    if (data < root->data) {
        root->left = insert(root->left, data, i);
    } else if (data > root->data) {
        root->right = insert(root->right, data, i);
    } else {
        root->sum += i;
        root->length++;
    }
    return root;
}

// https://www.codewars.com/kata/reviews/5fbf68526ed5a400018a81a7/groups/6506a2ce136b2400018f0a75
