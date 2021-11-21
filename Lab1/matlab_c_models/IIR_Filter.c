#include<stdio.h>
#include<stdlib.h>

#define N 2 /// order of the filter 
#define NB 7  /// number of bits

int b0 = 846; /// coefficient b0
int b[N]={1692, 846}; /// b array
int a[N]={-1514, 802}; /// a array

/// Perform fixed point filtering assuming direct form II
///\param x is the new input sample
///\return the new output sample
int myfilter(int x)
{
  static int sw[N]; /// w shift register
  static int first_run = 0; /// for cleaning the shift register
  int i; /// index
  int w; /// intermediate value (w)
  int y; /// output sample
  int fb, ff; /// feed-back and feed-forward results

  /// clean the buffer
  if (first_run == 0)
  {
    first_run = 1;
    for (i=0; i<N; i++)
      sw[i] = 0;
  }

  /// compute feed-back and feed-forward
  fb = 0;
  ff = 0;
  for (i=0; i<N; i++)
  {
    fb -= (sw[i]*a[i]) >> (NB-1);
    ff += (sw[i]*b[i]) >> (NB-1);
  }

  /// compute intermediate value (w) and output sample
  w = x + fb;
  y = (w*b0) >> (NB-1);
  y += ff;

  /// update the shift register
  for (i=N-1; i>0; i--){
    sw[i] = sw[i-1];
  }
  sw[0] = w;
 
  return y;
}

int main (int argc, char **argv)
{
  FILE *fp_in;
  FILE *fp_out;

  int x;
  int y;

  b0 >>= (13-NB);
  for(int i=0; i<N; i++){
    b[i] >>= (13-NB);
    a[i] >>= (13-NB);
  }
  printf("%d %d %d %d %d\n", b0, b[0], b[1], a[0], a[1]);

  /// check the command line
  if (argc != 3)
  {
    printf("Use: %s <input_file> <output_file>\n", argv[0]);
    exit(1);
  }

  /// open files
  fp_in = fopen(argv[1], "r");
  if (fp_in == NULL)
  {
    printf("Error: cannot open %s\n");
    exit(2);
  }
  fp_out = fopen(argv[2], "w");

  /// get samples and apply filter
  fscanf(fp_in, "%d", &x);
  do{
    x >>= (13-NB);
    y = myfilter(x);
    y <<= (13-NB);
    // printf("%d\n", y);
    fprintf(fp_out,"%d\n", y);
    fscanf(fp_in, "%d", &x);
  } while (!feof(fp_in));

  fclose(fp_in);
  fclose(fp_out);

  return 0;

}
