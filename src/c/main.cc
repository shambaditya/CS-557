#include <iostream>
#include <fstream>
#include <sstream>
#include <cstdlib>
#include <cmath>
#include <cstring>
#include <vector>

// #include <beethoven/fpga_handle.h>
// #include <beethoven_hardware.h>

using namespace std;
// using namespace beethoven;

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


bool fillSuperblock(ifstream &infile, int *superblock, int NUM_PARTITIONS, 
                   int ROWS_PER_PARTITION, int num_elements_per_partition, 
                   int &total_rows_processed, bool &moreData) {
    int current_partition = 0;
    int rowInCurrentPartition = 0;
    bool filledAny = false;
    
    string line;
    while (getline(infile, line)) {
        total_rows_processed++;
        filledAny = true;
        
        // Process the row data 
        stringstream ss(line);
        string token;
        
        // Skip first two non-vector columns ("id" and "$meta")
        if (!getline(ss, token, ',')) continue;  // id
        if (!getline(ss, token, ',')) continue;  // $meta
        
        // Prepare to store 128 integers for this row
        int row_data[128];
        int col;
        for (col = 0; col < 128; col++) {
            if (!getline(ss, token, ',')) {
                cout << "Row " << total_rows_processed << " ended unexpectedly at column " << col << endl;
                break;
            }
            try {
                row_data[col] = stoi(token);
            } catch (std::exception &e) {
                cerr << "Error processing row " << total_rows_processed << ", column " << col << ": " << token << endl;
                row_data[col] = 0;
            }
        }
        
        if (col < 128) {
            cout << "Row " << total_rows_processed << " did not contain 128 vector values. Skipping row." << endl;
            continue;
        }
        
        
        int partition_base = current_partition * num_elements_per_partition;
        int row_offset = rowInCurrentPartition * 128;
        
        
        for (int i = 0; i < 128; i++) {
            superblock[partition_base + row_offset + i] = row_data[i];
        }
        
        
        rowInCurrentPartition++;
        
        
        if (rowInCurrentPartition == ROWS_PER_PARTITION) {
            current_partition++;
            rowInCurrentPartition = 0;
            
            
            if (current_partition >= NUM_PARTITIONS) {
                moreData = true;
                return true; // Superblock completely filled
            }
        }
    }
    
    // If we got here, we've reached EOF
    moreData = false;
    return filledAny; // Return whether we filled anything at all
}

// Function to process a superblock (would contain FPGA code in the future)
void processSuperblock(int *superblock, int NUM_PARTITIONS, int PAGE_SIZE, int num_elements_per_partition, int superblockNumber) {
    cout << "\nProcessing Superblock #" << superblockNumber << endl;
    

    cout << "First element of each partition in Superblock #" << superblockNumber << ":" << endl;
    for (int part = 0; part < NUM_PARTITIONS; part++) {
        int start_index = part * num_elements_per_partition;
        cout << "Partition " << part << " first element: " << superblock[start_index] << endl;
    }
    
    
    if (superblockNumber == 0) {
        // Print all 128 elements from row 0 in partition 0 (similar to original code)
        cout << "\nRow 0 (from partition 0) data in Superblock #0:" << endl;
        int *base_partition0 = superblock; // Partition 0 base
        // Row 0 starts at offset 0 in partition 0
        for (int i = 0; i < 384; i++) {
            cout << "v" << i << ": " << base_partition0[i] << "\t";
            if ((i + 1) % 8 == 0)
                cout << endl;
        }
        cout << endl;
    }
    
    // add FPGA processing code in the future
    /*
    // Allocate FPGA memory for the superblock
    fpga_handle_t handle;
    remote_ptr total_alloc = handle.malloc(NUM_PARTITIONS * PAGE_SIZE);
    int *host_alloc = (int*) total_alloc.getHostAddr();
    
    // Copy data to FPGA memory
    memcpy(host_alloc, superblock, NUM_PARTITIONS * PAGE_SIZE);
    
    //DMA transfer
    dma_workaround_copy_to_fpga(total_alloc);
    
    // Execute FPGA operation over here
   
    
    // Retrieve results if needed
    dma_workaround_copy_from_fpga(total_alloc);
    
    // Process or store results
    
    
    // Free FPGA memory
    handle.free(total_alloc);
    */
}


void processLargeDataset(const string& filename) {
    // Parameters for partitioning - SAME AS ORIGINAL CODE
    const int NUM_PARTITIONS = 16;
    const int PAGE_SIZE = 4096; // bytes per partition
    const int num_elements_per_partition = 1024;  // (4096 bytes / 4 bytes per int)
    const int ROWS_PER_PARTITION = num_elements_per_partition / 128; // 8 rows
    
    // Open the CSV file 
    ifstream infile(filename);
    if (!infile.is_open()) {
        cerr << "Failed to open CSV file: " << filename << endl;
        return;
    }
    
    // Skip header 
    string line;
    if (!getline(infile, line)) {
        cerr << "CSV file is empty." << endl;
        return;
    }
    cout << "Header: " << line << endl;
    
    int totalSuperBlocksProcessed = 0;
    int total_rows_processed = 0;
    bool moreData = true;
    
    while (moreData) {
        // Allocate memory for exactly 16 partitions (one superblock)
        int total_elements = NUM_PARTITIONS * num_elements_per_partition;
        int *superblock = new int[total_elements];
        memset(superblock, 0, total_elements * sizeof(int));
        
        // Fill the superblock with data from the CSV
        bool superblockFilled = fillSuperblock(infile, superblock, NUM_PARTITIONS, 
                                              ROWS_PER_PARTITION, num_elements_per_partition,
                                              total_rows_processed, moreData);
        
        if (superblockFilled) {
            // Process this superblock (future FPGA integration point)
            processSuperblock(superblock, NUM_PARTITIONS, PAGE_SIZE, 
                             num_elements_per_partition, totalSuperBlocksProcessed);
            totalSuperBlocksProcessed++;
        }
        
        
        delete[] superblock;
        
        
        if (!superblockFilled) {
            break;
        }
    }
    
    
    cout << "\nTotal rows processed: " << total_rows_processed << endl;
    cout << "Processed " << totalSuperBlocksProcessed << " superblocks." << endl;
    cout << "Total partitions processed: " << (totalSuperBlocksProcessed * NUM_PARTITIONS) << endl;
}

int main() {
    
    processLargeDataset("out_9.csv");
    
    return 0;
}