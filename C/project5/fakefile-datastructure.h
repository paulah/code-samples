/* Paula Huang
 * TerpConnect: phuang
 * UID: 112419189
 * CMSC216 Section 0202
 *
 * I pledge on my honor that I have neither given nor
 * received any unauthorized assistance on this assignment.
 */

#if !defined(FAKEFILE_DATASTRUCTURE_H)
#define FAKEFILE_DATASTRUCTURE_H

typedef char * String;

typedef struct dep {
  String name;
  struct dep *next;
} Dependency;

typedef struct comm {
  String name;
  struct comm *next;
} Command;

typedef struct node {
  String target;
  Dependency *dependency;
  Command *command;
  struct node *next;
} Node;

typedef struct fakefile {
  Node *head;
} Fakefile;

#endif
