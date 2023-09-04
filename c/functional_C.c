// by kiila
// https://www.codewars.com/kumite/64f5b721fa88ae1a3d751377?sel=64f5b7484bb18a0ee3d88faf

#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>

typedef struct list_t list_t;

struct list_t
{
    void   *elem;
    list_t *next;
};

list_t *LIST_EMPTY = &(list_t){0};

static list_t *list_cons(void *elem, list_t *list)
{
    list_t *res;

    res = calloc(1, sizeof(list_t));
    res->elem = elem;
    res->next = list;

    return res;
}

static int *make_int(int val)
{
    int *i;

    i = calloc(1, sizeof(int));

    *i = val;
    
    return i;
}

static list_t *range(int from, int to)
{
    if(from >= to)
        return LIST_EMPTY;
    return list_cons(make_int(from), range(from+1, to));
}

static int sum(list_t *list)
{
    return list->elem ? *(int *)list->elem + sum(list->next) : 0;
}

static int *mul(int *x, int *y)
{
    return make_int(*x * *y);
}

static list_t* filter(bool f(void *), list_t *list)
{
    if(!list->elem)
        return LIST_EMPTY;
    return f(list->elem) ? list_cons(list->elem, filter(f, list->next)) : filter(f, list->next);
}

static bool divBy3Or5(int *num)
{
    return !(*num % 3 && *num % 5);
}

int solution(int i)
{
    return sum(filter(divBy3Or5, range(0, i)));
}
