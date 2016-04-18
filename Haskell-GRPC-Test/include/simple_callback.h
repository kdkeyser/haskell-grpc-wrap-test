
typedef void (funptr)(void);

void * callback(funptr *);
void wait_and_destroy(void * thread); 
