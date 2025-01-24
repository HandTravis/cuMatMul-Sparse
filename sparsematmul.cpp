// testing sparse matrix multiplciation across different memory storage techniques in cuda: COO, CSR, CSC

#include <math.h>
#include <vector>
#include <iostream>

#include <cuda.h>
#include <cusparse.h>

int main() {
    int m = 0;
    int n = 0
    std::vector<double>(m * n);

    // next steps:
    /*
        - initialize random sparse matrices for COO, CSR, CSC, SELL
        - n trials

        - verify gpu device connectivity
        - correctly allocate mem space
        - need multiple event handles?

        - create timing variables and storage for computation times
        - output to textfile where python script will read from
            - could I do a wrapper inside cpp? prolly being extra here lol
        
    */

    int* g;
    cudaMalloc(&g, m * n * sizeof(double));

    cusparseHandle_t handle;
    cusparseCreate(&handle);

    // cudaDeviceSynchronize() 
    // call this to make sure computation is finished before proceeding
    
    return 0;
}