#include <pthread.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>

#include "simple_callback.h"

void* wait_and_call(void *data)
{
  sleep(2);
  ((funptr *)data)();
  printf("Callback called\n");
  return NULL;
}

void * callback(funptr * f)
{
  pthread_t * thread = malloc(sizeof(pthread_t));
  pthread_create(thread, NULL, wait_and_call, f);
  return (void *)thread;
}

void wait_and_destroy(void * thread) 
{
  pthread_join(*(pthread_t *)thread,NULL);
  free(thread);
}
