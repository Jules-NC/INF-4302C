#include<stdio.h>
#include<stdlib.h>
#include<omp.h>


int main() {
  for(int threads=1; threads<=16; threads++){
    omp_set_num_threads(threads);
    double time = omp_get_wtime();
    static long nb_pas = 1000000000;
    double pas;
    int i; double x, pi, som = 0.0;
    pas = 1.0 / (double)nb_pas;
    #pragma omp parallel for reduction(+:som) firstprivate(x,pas)
    for (i = 0; i < nb_pas; i++) {
        x = (i + 0.5)*pas;
        som = som + 4.0 / (1.0 + x * x);
    }

    pi = pas * som;
    printf("THREADS: %d\n", threads);
    printf("PI=%.20f\n", pi);
    printf("time: %f\n", omp_get_wtime()-time);
  }
	return 0;
}
