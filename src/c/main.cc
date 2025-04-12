#include <iostream>
#include <fstream>
#include <sstream>
#include <cstdlib>
#include <cstring>
#include <stdint.h>   // For uintptr_t
#include <algorithm>  // For min/max
#include <cmath>      // For round()

// Beethoven FPGA header includes (commented out)
// #include <beethoven/fpga_handle.h>
// #include <beethoven_hardware.h>

using namespace std;
// using namespace beethoven;

// Beethoven FPGA helper functions (commented out)
/*
void dma_workaround_copy_to_fpga(remote_ptr &q) {
    int sz = q.getLen() / 4; // assuming 4 bytes per word
    auto *intar = (int*)q.getHostAddr();
    for (int i = 0; i < sz; ++i) {
        DMAHelper::memcmd(0, q + i * 4, intar[i], 1).get();
    }
}

void dma_workaround_copy_from_fpga(remote_ptr &q) {
    int sz = q.getLen() / 4;
    auto *intar = (int*)q.getHostAddr();
    for (int i = 0; i < sz; ++i) {
        intar[i] = DMAHelper::memcmd(0, q + i * 4, 0, 0).get().payload;
    }
}
*/

int main() {
    // Fixed parameters
    const int NUM_DIM = 128;           // Dimensions per vector
    const int NUM_PARTITIONS = 16;     // Number of partitions
    const int ALIGNMENT = 4096;        // 4KB alignment
    
    // First pass: count rows in the dataset
    ifstream countFile("out23.csv");
    if (!countFile.is_open()) {
        cerr << "Failed to open CSV file for counting: out23.csv" << endl;
        return -1;
    }
    string line;
    // Skip header
    if (!getline(countFile, line)) {
        cerr << "CSV file is empty." << endl;
        return -1;
    }
    int totalRows = 0;
    while (getline(countFile, line)) {
        totalRows++;
    }
    countFile.close();
    
    cout << "\nDataset information:" << endl;
    cout << "- Total rows detected: " << totalRows << endl;
    cout << "- Total data elements: " << (totalRows * NUM_DIM) << endl;
    
    // Determine how many rows each partition should contain (capacity) using ceiling division
    int rowsPerPartition = (totalRows + NUM_PARTITIONS - 1) / NUM_PARTITIONS;
    cout << "- Rows per partition (capacity): " << rowsPerPartition << endl;
    
    // Compute the number of integers per partition and then compute the byte size
    int partitionSizeInts = rowsPerPartition * NUM_DIM;
    size_t partitionSizeBytes = partitionSizeInts * sizeof(int);
    
    // Round up partition byte size to a multiple of ALIGNMENT (4KB)
    if (partitionSizeBytes % ALIGNMENT != 0) {
        partitionSizeBytes = ((partitionSizeBytes + ALIGNMENT - 1) / ALIGNMENT) * ALIGNMENT;
    }
    
    cout << "- Each partition allocation size: " << (partitionSizeBytes / 1024.0) << " KB" << endl;
    
    // Total allocation for all 16 partitions
    size_t totalAllocBytes = NUM_PARTITIONS * partitionSizeBytes;
    cout << "- Total allocation size: " << (totalAllocBytes / (1024.0 * 1024.0)) << " MB" << endl;
    
    // Allocate one large block of memory with extra room to adjust for alignment
    size_t extra = ALIGNMENT + sizeof(void*);
    void* raw_ptr = malloc(totalAllocBytes + extra);
    if (raw_ptr == NULL) {
        cerr << "Failed to allocate memory" << endl;
        return -1;
    }
    
    // Manually align the pointer (similar to posix_memalign)
    uintptr_t raw_addr = reinterpret_cast<uintptr_t>(raw_ptr);
    uintptr_t aligned_addr = (raw_addr + sizeof(void*) + ALIGNMENT - 1) & ~(ALIGNMENT - 1);
    // Store original pointer for later free (if needed)
    *((void**)aligned_addr - 1) = raw_ptr;
    
    int* datasetPtr = reinterpret_cast<int*>(aligned_addr);
    
    // Initialize the allocated memory to zero
    memset(datasetPtr, 0, totalAllocBytes);
    
    // Manually assign partition start addresses from the contiguous block.
    int* partitionAddresses[NUM_PARTITIONS];
    int intsPerPartition = partitionSizeBytes / sizeof(int);
    partitionAddresses[0]  = datasetPtr + 0 * intsPerPartition;
    partitionAddresses[1]  = datasetPtr + 1 * intsPerPartition;
    partitionAddresses[2]  = datasetPtr + 2 * intsPerPartition;
    partitionAddresses[3]  = datasetPtr + 3 * intsPerPartition;
    partitionAddresses[4]  = datasetPtr + 4 * intsPerPartition;
    partitionAddresses[5]  = datasetPtr + 5 * intsPerPartition;
    partitionAddresses[6]  = datasetPtr + 6 * intsPerPartition;
    partitionAddresses[7]  = datasetPtr + 7 * intsPerPartition;
    partitionAddresses[8]  = datasetPtr + 8 * intsPerPartition;
    partitionAddresses[9]  = datasetPtr + 9 * intsPerPartition;
    partitionAddresses[10] = datasetPtr + 10 * intsPerPartition;
    partitionAddresses[11] = datasetPtr + 11 * intsPerPartition;
    partitionAddresses[12] = datasetPtr + 12 * intsPerPartition;
    partitionAddresses[13] = datasetPtr + 13 * intsPerPartition;
    partitionAddresses[14] = datasetPtr + 14 * intsPerPartition;
    partitionAddresses[15] = datasetPtr + 15 * intsPerPartition;
    
    // Print out partition start addresses and verify 4KB alignment.
    cout << "\nPartition Start Addresses:" << endl;
    cout << "start_address_0 = 0x" << hex << reinterpret_cast<uintptr_t>(partitionAddresses[0]) << dec
         << " // 4K aligned: " << (((reinterpret_cast<uintptr_t>(partitionAddresses[0])) % ALIGNMENT == 0) ? "Yes" : "No") << endl;
    cout << "start_address_1 = 0x" << hex << reinterpret_cast<uintptr_t>(partitionAddresses[1]) << dec
         << " // 4K aligned: " << (((reinterpret_cast<uintptr_t>(partitionAddresses[1])) % ALIGNMENT == 0) ? "Yes" : "No") << endl;
    cout << "start_address_2 = 0x" << hex << reinterpret_cast<uintptr_t>(partitionAddresses[2]) << dec
         << " // 4K aligned: " << (((reinterpret_cast<uintptr_t>(partitionAddresses[2])) % ALIGNMENT == 0) ? "Yes" : "No") << endl;
    cout << "start_address_3 = 0x" << hex << reinterpret_cast<uintptr_t>(partitionAddresses[3]) << dec
         << " // 4K aligned: " << (((reinterpret_cast<uintptr_t>(partitionAddresses[3])) % ALIGNMENT == 0) ? "Yes" : "No") << endl;
    cout << "start_address_4 = 0x" << hex << reinterpret_cast<uintptr_t>(partitionAddresses[4]) << dec
         << " // 4K aligned: " << (((reinterpret_cast<uintptr_t>(partitionAddresses[4])) % ALIGNMENT == 0) ? "Yes" : "No") << endl;
    cout << "start_address_5 = 0x" << hex << reinterpret_cast<uintptr_t>(partitionAddresses[5]) << dec
         << " // 4K aligned: " << (((reinterpret_cast<uintptr_t>(partitionAddresses[5])) % ALIGNMENT == 0) ? "Yes" : "No") << endl;
    cout << "start_address_6 = 0x" << hex << reinterpret_cast<uintptr_t>(partitionAddresses[6]) << dec
         << " // 4K aligned: " << (((reinterpret_cast<uintptr_t>(partitionAddresses[6])) % ALIGNMENT == 0) ? "Yes" : "No") << endl;
    cout << "start_address_7 = 0x" << hex << reinterpret_cast<uintptr_t>(partitionAddresses[7]) << dec
         << " // 4K aligned: " << (((reinterpret_cast<uintptr_t>(partitionAddresses[7])) % ALIGNMENT == 0) ? "Yes" : "No") << endl;
    cout << "start_address_8 = 0x" << hex << reinterpret_cast<uintptr_t>(partitionAddresses[8]) << dec
         << " // 4K aligned: " << (((reinterpret_cast<uintptr_t>(partitionAddresses[8])) % ALIGNMENT == 0) ? "Yes" : "No") << endl;
    cout << "start_address_9 = 0x" << hex << reinterpret_cast<uintptr_t>(partitionAddresses[9]) << dec
         << " // 4K aligned: " << (((reinterpret_cast<uintptr_t>(partitionAddresses[9])) % ALIGNMENT == 0) ? "Yes" : "No") << endl;
    cout << "start_address_10 = 0x" << hex << reinterpret_cast<uintptr_t>(partitionAddresses[10]) << dec
         << " // 4K aligned: " << (((reinterpret_cast<uintptr_t>(partitionAddresses[10])) % ALIGNMENT == 0) ? "Yes" : "No") << endl;
    cout << "start_address_11 = 0x" << hex << reinterpret_cast<uintptr_t>(partitionAddresses[11]) << dec
         << " // 4K aligned: " << (((reinterpret_cast<uintptr_t>(partitionAddresses[11])) % ALIGNMENT == 0) ? "Yes" : "No") << endl;
    cout << "start_address_12 = 0x" << hex << reinterpret_cast<uintptr_t>(partitionAddresses[12]) << dec
         << " // 4K aligned: " << (((reinterpret_cast<uintptr_t>(partitionAddresses[12])) % ALIGNMENT == 0) ? "Yes" : "No") << endl;
    cout << "start_address_13 = 0x" << hex << reinterpret_cast<uintptr_t>(partitionAddresses[13]) << dec
         << " // 4K aligned: " << (((reinterpret_cast<uintptr_t>(partitionAddresses[13])) % ALIGNMENT == 0) ? "Yes" : "No") << endl;
    cout << "start_address_14 = 0x" << hex << reinterpret_cast<uintptr_t>(partitionAddresses[14]) << dec
         << " // 4K aligned: " << (((reinterpret_cast<uintptr_t>(partitionAddresses[14])) % ALIGNMENT == 0) ? "Yes" : "No") << endl;
    cout << "start_address_15 = 0x" << hex << reinterpret_cast<uintptr_t>(partitionAddresses[15]) << dec
         << " // 4K aligned: " << (((reinterpret_cast<uintptr_t>(partitionAddresses[15])) % ALIGNMENT == 0) ? "Yes" : "No") << endl;
    
    // Open CSV file for processing
    ifstream dataFile("out23.csv");
    if (!dataFile.is_open()) {
        cerr << "Failed to open CSV file for processing: out23.csv" << endl;
        free(raw_ptr);
        return -1;
    }
    
    // Skip header
    if (!getline(dataFile, line)) {
        cerr << "CSV file is empty." << endl;
        free(raw_ptr);
        return -1;
    }
    cout << "\nProcessing CSV header: " << line << endl;
    
    // Array to keep track of how many rows were written to each partition
    int partitionRowCount[NUM_PARTITIONS] = {0};
    
    int totalRowsProcessed = 0;
    
    while (getline(dataFile, line)) {
        stringstream ss(line);
        string token;
        
        // Skip first two columns (id and meta)
        if (!getline(ss, token, ',')) continue;
        if (!getline(ss, token, ',')) continue;
        
        int row_data[NUM_DIM];
        int col;
        for (col = 0; col < NUM_DIM; col++) {
            if (!getline(ss, token, ',')) {
                cout << "Row " << totalRowsProcessed + 1 << " ended unexpectedly at column " << col << endl;
                break;
            }
            try {
                row_data[col] = stoi(token);
            } catch (std::exception &e) {
                cerr << "Error processing row " << totalRowsProcessed + 1 
                     << ", column " << col << ": " << token << endl;
                row_data[col] = 0;
            }
        }
        if (col < NUM_DIM) {
            cout << "Row " << totalRowsProcessed + 1 
                 << " did not contain " << NUM_DIM << " vector values. Skipping row." << endl;
            continue;
        }
        
        // Determine partition index and offset within that partition based on row index
        int partitionIndex = totalRowsProcessed / rowsPerPartition;
        if (partitionIndex >= NUM_PARTITIONS)
            partitionIndex = NUM_PARTITIONS - 1;  // Place any extra rows in the last partition
        
        int rowOffsetInPartition = partitionRowCount[partitionIndex];
        int* writeLocation = partitionAddresses[partitionIndex];
        memcpy(writeLocation + rowOffsetInPartition * NUM_DIM, row_data, NUM_DIM * sizeof(int));
        
        partitionRowCount[partitionIndex]++;
        totalRowsProcessed++;
        
        // Optionally, print progress every 10,000 rows.
        if (totalRowsProcessed % 10000 == 0) {
            cout << "Processed " << totalRowsProcessed << " rows." << endl;
        }
    }
    dataFile.close();
    
    cout << "\nTotal rows processed: " << totalRowsProcessed << " out of " << totalRows << endl;
    
    // Print a summary of how many rows are stored in each partition.
    cout << "\nRows stored in each partition:" << endl;
    for (int p = 0; p < NUM_PARTITIONS; p++) {
        cout << "Partition " << p << ": " << partitionRowCount[p] << " rows" << endl;
    }
    
    // Print sample data from all partitions (first 128 elements from each partition)
    cout << "\nSample data from all partitions (first 128 elements):" << endl;
    for (int p = 0; p < NUM_PARTITIONS; p++) {
        cout << "\nPartition " << p << ":\n";
        // Print 128 integers formatted in 8 rows of 16 numbers each for readability
        for (int j = 0; j < NUM_DIM; j++) {
            cout << partitionAddresses[p][j] << "\t";
            if ((j + 1) % 16 == 0)
                cout << "\n";
        }
    }
    
    cout << "\nReady to process all partitions with FPGA" << endl;
    
    // Allocate a query vector for one query (128 fixed-point numbers)
    int* queryVector = (int*)malloc(NUM_DIM * sizeof(int));
    if (queryVector == NULL) {
        cerr << "Failed to allocate query vector" << endl;
        free(raw_ptr);
        return -1;
    }
    
    // Initialize query vector with 128 fixed-point integers in Q1.15 format.
    // Here we generate 128 real values uniformly in [-1, 1] and then convert them.
      double query_min = -0.02;
      double query_max = 0.02;
      for (int i = 0; i < NUM_DIM; i++) {
    // Compute a real value between query_min and query_max:
        double real_value = query_min + (query_max - query_min) * i / (NUM_DIM - 1);
    // Convert to Q1.15 fixed-point:
        queryVector[i] = static_cast<int>(round(real_value * 32768.0));
}  
    // Print  query vector
    cout << "\nQuery vector (128 Q1.15 fixed-point values):" << endl;
    for (int i = 0; i < NUM_DIM; i++) {
        cout << "q" << i << ": " << queryVector[i] << "\t";
        if ((i + 1) % 8 == 0)
            cout << "\n";
    }
    
    // Beethoven FPGA code (commented out)
    /*
    fpga_handle_t handle;
    // Allocate FPGA memory for all partitions (each of size 'partitionSizeBytes')
    remote_ptr total_alloc = handle.malloc(NUM_PARTITIONS * partitionSizeBytes);
    int *host_alloc = (int*) total_alloc.getHostAddr();
    
    // Copy all partitioned data to FPGA memory
    memcpy(host_alloc, datasetPtr, NUM_PARTITIONS * partitionSizeBytes);
    
    // Allocate FPGA memory for the query vector (128 integers)
    remote_ptr query_alloc = handle.malloc(NUM_DIM * sizeof(int));
    int *fpga_query = (int*) query_alloc.getHostAddr();
    
    // Copy the query vector from host memory to FPGA memory
    memcpy(fpga_query, queryVector, NUM_DIM * sizeof(int));
    
    // Transfer data to FPGA
    dma_workaround_copy_to_fpga(total_alloc);
    dma_workaround_copy_to_fpga(query_alloc);
    
    // Execute FPGA operation
    // [... FPGA processing code ...]
    
    // Retrieve results from FPGA, if needed
    dma_workaround_copy_from_fpga(total_alloc);
    
    // Free FPGA memory
    handle.free(total_alloc);
    handle.free(query_alloc);
    */
    
    // Free allocated memory using the originally allocated pointer
    free(queryVector);
    free(raw_ptr);
    return 0;
}
