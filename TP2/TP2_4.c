#include<stdio.h>
#include<stdlib.h>
#include<omp.h>

#define VINMIL 20000

int main(){
  double time = omp_get_wtime();

  
  const float K = 5.30;
  float * TAB1 = malloc(VINMIL*sizeof(float));
  float * TAB2 = malloc(VINMIL*sizeof(float));
  float * TAB3 = malloc(VINMIL*sizeof(float));
  
  for(int i=0; i<VINMIL; i++){
      TAB3[i] = TAB1[i] + TAB2[i]*K;
  }
  
  printf("Boucle: %f\n", TAB3[(int)K]);
  printf("time: %f\n", omp_get_wtime()-time);

}
