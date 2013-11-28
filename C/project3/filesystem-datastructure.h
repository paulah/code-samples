typedef struct fileline {
  char *line;
  struct fileline *next;
} Fileline;

typedef struct file {
  char *name;
  Fileline *content;
  struct file *next;
} File;

typedef struct dir {
  char *name;
  struct dir *parent;
  struct dir *subdir;
  struct dir *next;
  File *files;
} Dir;

typedef struct filesys {
  Dir *root;
  Dir *currdir;
} Filesystem;
