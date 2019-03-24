#include <stdio.h>
#include <omp.h>

int main(){
	omp_set_num_threads(4);
	int i=0;
	#pragma omp parallel for
	for(int i =0;i<50;i++){
		
		printf("%d, %d\n",i,omp_get_thread_num());
	} 
	
}
