#include <stdio.h>
#include <omp.h>

int main(){
	omp_set_num_threads(4);
  int var1 = 1000;
	#pragma omp parallel private(var1)
  {
    var1++;
    printf("coeur : %d\n", omp_get_thread_num());
    printf("var 1 : %d\n",var1);
  }
}
