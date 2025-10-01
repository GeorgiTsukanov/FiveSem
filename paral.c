#include <mpi.h>
#include <stdio.h>
#include <stdlib.h>

#define N 100

void task1(int rank, int size)
{
    //При количестве процессов больше 2
    //Для процессов с номером >1 не выполнится ни одно условие из if (rank == 0), if (rank == 1)
    //Они пропустят весь код между MPI_Comm_rank и MPI_Finalize() и завершат свою работу
    int dest, src, rc, tag = 1;
    char inmsg, outmsg = 'x';
    MPI_Status Stat;

    if (rank == 0) {
        dest = 1;
        src = 1;
        rc = MPI_Send(&outmsg, 1, MPI_CHAR, dest, tag,
            MPI_COMM_WORLD);
        rc = MPI_Recv(&inmsg, 1, MPI_CHAR, src, tag,
            MPI_COMM_WORLD, &Stat);
        printf("Rank 0 received: %c\n", inmsg);
    }
    else
        if (rank == 1) {
            dest = 0;
            src = 0;
            rc = MPI_Recv(&inmsg, 1, MPI_CHAR, src, tag,
                MPI_COMM_WORLD, &Stat);
            rc = MPI_Send(&outmsg, 1, MPI_CHAR, dest, tag,
                MPI_COMM_WORLD);
            printf("Rank 1 received: %c\n", inmsg);
        }
}

void task2(int rank, int size) {
    int SOME_TAG = 0;
    int send_data, recv_data;
    MPI_Status status;

    send_data = rank * 100;

    if ((rank % 2) == 0) {
        if ((rank + 1) < size) {
            MPI_Send(&send_data, 1, MPI_INT, rank + 1, SOME_TAG, MPI_COMM_WORLD);
            printf("Process %d sent data %d to process %d\n", rank, send_data, rank + 1);
        }
        else {
            printf("Process %d (last even) has no one to send to\n", rank);
        }
    }
    else {
        MPI_Recv(&recv_data, 1, MPI_INT, rank - 1, SOME_TAG, MPI_COMM_WORLD, &status);
        printf("Process %d received data %d from process %d\n", rank, recv_data, rank - 1);
    }
}

void task3(int rank, int size) {
    int vector[N];
    int sum_pr = 0;
    int total_sum = 0;

    if (rank == 0) {
        for (int i = 0; i < N; i++) {
            vector[i] = i;
        }
    }
    MPI_Bcast(vector, N, MPI_INT, 0, MPI_COMM_WORLD);

    int block_size = (N + size - 1) / size;
    int start = rank * block_size;
    int end = start + block_size;
    if (end > N) end = N;

    for (int i = start; i < end; i++) {
        sum_pr += vector[i];
    }

    if (rank == 0) {
        total_sum = sum_pr;
        for (int i = 1; i < size; i++) {
            int recv_sum;
            MPI_Recv(&recv_sum, 1, MPI_INT, i, 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
            printf("partial sum of process %d = %d\n", i, recv_sum);
            total_sum += recv_sum;
        }

        printf("Total sum = %d\n", total_sum);
    }
    else {
        MPI_Send(&sum_pr, 1, MPI_INT, 0, 0, MPI_COMM_WORLD);
    }
}

void task4(int rank, int size) {
    int vector[N];
    int sum_pr = 0;
    int total_sum = 0;

    if (rank == 0) {
        for (int i = 0; i < N; i++) {
            vector[i] = i;
        }
    }
    MPI_Bcast(vector, N, MPI_INT, 0, MPI_COMM_WORLD);

    for (int i = rank; i < N; i += size) {
        sum_pr += vector[i];
    }

    if (rank == 0) {
        total_sum = sum_pr;
        for (int i = 1; i < size; i++) {
            int recv_sum;
            MPI_Recv(&recv_sum, 1, MPI_INT, i, 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
            printf("partial sum of process %d = %d\n", i, recv_sum);
            total_sum += recv_sum;
        }

        printf("Total sum = %d\n", total_sum);
    }
    else {
        MPI_Send(&sum_pr, 1, MPI_INT, 0, 0, MPI_COMM_WORLD);
    }
}



void task5_1(int rank, int size) {
    int vector[N];
    int sum_pr = 0;
    int total_sum = 0;

    double start_time, end_time, local_time;
    MPI_Barrier(MPI_COMM_WORLD);
    start_time = MPI_Wtime();

    if (rank == 0) {
        for (int i = 0; i < N; i++) {
            vector[i] = i;
        }
    }
    MPI_Bcast(vector, N, MPI_INT, 0, MPI_COMM_WORLD);

    int block_size = (N + size - 1) / size;
    int start = rank * block_size;
    int end = start + block_size;
    if (end > N) end = N;

    for (int i = start; i < end; i++) {
        sum_pr += vector[i];
    }
if (rank == 0) {
        total_sum = sum_pr;
        for (int i = 1; i < size; i++) {
            int recv_sum;
            MPI_Recv(&recv_sum, 1, MPI_INT, i, 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
            total_sum += recv_sum;
        }
    }
    else {
        MPI_Send(&sum_pr, 1, MPI_INT, 0, 0, MPI_COMM_WORLD);
    }

    end_time = MPI_Wtime();
    local_time = end_time - start_time;
    if (rank == 0) {
        double max_time = local_time;
        double min_time = local_time;
        double avg_time = local_time;

        for (int i = 1; i < size; i++) {
            double proc_time;
            MPI_Recv(&proc_time, 1, MPI_DOUBLE, i, 1, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
            if (proc_time > max_time) max_time = proc_time;
            if (proc_time < min_time) min_time = proc_time;
            avg_time += proc_time;
        }
        avg_time /= size;

        printf("\nBlock distribution:\n");
        printf("Min time: %.6f seconds\n", min_time);
        printf("Max time: %.6f seconds\n", max_time);
        printf("Average time: %.6f seconds\n", avg_time);
    }
    else {
        MPI_Send(&local_time, 1, MPI_DOUBLE, 0, 1, MPI_COMM_WORLD);
    }

}

void task5_2(int rank, int size) {
    int vector[N];
    int sum_pr = 0;
    int total_sum = 0;

    double start_time, end_time, local_time;
    MPI_Barrier(MPI_COMM_WORLD);
    start_time = MPI_Wtime();

    if (rank == 0) {
        for (int i = 0; i < N; i++) {
            vector[i] = i;
        }
    }
    MPI_Bcast(vector, N, MPI_INT, 0, MPI_COMM_WORLD);

    for (int i = rank; i < N; i += size) {
        sum_pr += vector[i];
    }

    if (rank == 0) {
        total_sum = sum_pr;
        for (int i = 1; i < size; i++) {
            int recv_sum;
            MPI_Recv(&recv_sum, 1, MPI_INT, i, 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
            total_sum += recv_sum;
        }
    }
    else {
        MPI_Send(&sum_pr, 1, MPI_INT, 0, 0, MPI_COMM_WORLD);
    }

    end_time = MPI_Wtime();
    local_time = end_time - start_time;
    if (rank == 0) {
        double max_time = local_time;
        double min_time = local_time;
        double avg_time = local_time;

        for (int i = 1; i < size; i++) {
            double proc_time;
            MPI_Recv(&proc_time, 1, MPI_DOUBLE, i, 1, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
            if (proc_time > max_time) max_time = proc_time;
            if (proc_time < min_time) min_time = proc_time;
            avg_time += proc_time;
        }
        avg_time /= size;

        printf("\nCyclic distribution:\n");
        printf("Min time: %.6f seconds\n", min_time);
        printf("Max time: %.6f seconds\n", max_time);
        printf("Average time: %.6f seconds\n", avg_time);
    }
    else {
        MPI_Send(&local_time, 1, MPI_DOUBLE, 0, 1, MPI_COMM_WORLD);
    }
    
}
void task5(int rank, int size) {
    task5_1(rank, size);
    task5_2(rank, size);
}

int main(int argc, char** argv) {
    MPI_Init(&argc, &argv);
    int rank, size, task_number;
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    MPI_Comm_size(MPI_COMM_WORLD, &size);

    if (argc > 1 || argc <= 3) {
        task_number = atoi(argv[1]);
    }
    else {
        printf("Unknown task number\n");
        return 0;
    }

    switch (task_number) {
    case 1:
        task1(rank, size);
        break;
    case 2:
        task2(rank, size);
        break;
    case 3:
        task3(rank, size);
        break;
    case 4:
        task4(rank, size);
        break;
    case 5:
        task5(rank, size);
        break;
    }
    MPI_Finalize();
    return 0;
}
