#include <assert.h>
#include <stdio.h>
#include <stdlib.h>

#define L 16  //number of states
#define R  4  //L = 2 ^ R, R in N
#define m  3  //size of an alphabet

#define p0 (3.0 / L)
#define p1 (8.0 / L)
#define p2 (5.0 / L)


static char alphabet[] = {'0', '1', '2'};
static int Ls[] = {3, 8, 5};  //number of occurences of given symbols normalized to L


struct decoding_table {
    int nb_bits;
    int new_x;
    char symbol;
};


/*** Helper functions ***/

/* Greatest common divisor */
int GCD(int a, int b)
{
    int temp;
    while (b != 0) {
        temp = b;
        b = a % b;
        a = temp;
    }
    return a;
}

void parse_char_to_binary(char c, char* result)
{
    for (int i = 7; i >= 0; i--)
        result[i] = (c & (1 << i)) ? '1' : '0';
}

void print_binary_char(char c)
{
    for (int i = 7; i >= 0; --i)
        putchar( (c & (1 << i)) ? '1' : '0' );
    putchar('\n');
}


/*** tANS preparation functions ***/
/** prepare_encoding, prepare_decoding -> ASCII alphabet **/

void spread(char* symbol)
{
    extern char alphabet[];

    int X = 0;  //initial state
    int step = (5.0 / 8.0) * L + 3;

    while (GCD(step, L) != 1)
        step++;

    for (int i = 0; i < m; i++) {  //For every symbol...
        for (int j = 1; j <= Ls[i]; j++) {  //properly normalized in a table do...
            symbol[X] = alphabet[i];
            X = (X + step) % L;
        }
    }
    symbol[L] = '/0';
}

void prepare_encoding(char* symbol, int* nb, int* start, int* encoding_table)
{
    extern int Ls[];
    int r = R + 1;

    int sum[m];  //sum of occurences of elements smaller than the given one
    sum[0] = 0;
    for (int i = 1; i < m; i++)
        sum[i] = Ls[i-1];
    for (int i = 2; i < m; i++)
        sum[i] += sum[i-1];

    //nb_bits = k[s] or k[s] - 1 (more precisely R - (int)log2(Ls) or R - (int)log2(2Ls-1))
    //nb_bits = (X + nb[i]) >> r
    //X >> nbBits ("crossing off" the specified number of bits) gives the rigth x_temp (in {Ls, ..., 2 * Ls - 1})
    int k[m], next[m];
    for (int i = 0; i < m; i++) {
        k[i] = R - (int)log2((double)Ls[i]);
        nb[i] = (k[i] << r) - (Ls[i] << k[i]);
        start[i] = sum[i] - Ls[i];
        next[i] = Ls[i];
    }

    //encoding_table = {18, 22, 25, 16, 17, 21, 24, 27 ,29, 30, 31, 19, 20, 23, 26, 28};
    //values sequentially for: '0' -> 3, 4, 5; '1' -> 8, ..., 15; '2' -> 5, ..., 9
    for(int x = L; x < 2 * L; x++) {
        char s = symbol[x-L];
        encoding_table[start[s - '0'] + (next[s - '0']++)] = x;
    }
}

void prepare_decoding(char* symbol, struct decoding_table* decoding_table)
{
    extern int Ls[];

    int next[m];  //next occurence of a symbol -> x_temp
    for (int i = 0; i < m; i++)
        next[i] = Ls[i];
    next[m] = '\0';

    for (int X = 0; X < L; X++) {
        decoding_table[X].symbol = symbol[X];
        int x = next[decoding_table[X].symbol - '0']++;  //actualization of the next occurence of a symbol (x_temp)
        decoding_table[X].nb_bits = R - (int)log2((double)x);
        decoding_table[X].new_x = (x << decoding_table[X].nb_bits) - L;  //the smallest possible new state
        printf("%c -> %c|%d|%d\n",
                  symbol[X], decoding_table[X].symbol, decoding_table[X].nb_bits, decoding_table[X].new_x);
    }
}


/*** Tables' preparation functions ***/

void write_nb_table(int* nb)
{
    FILE* fp = fopen("nb.txt", "w");
    for (int i = 0; i < m; i++) {
        char binary[m];
        parse_char_to_binary((char)(nb[i]), binary);
        for (int i = 7; i >= 0; --i)
            fputc(binary[i], fp);
        fputc('\n', fp);
    }
    fclose(fp);
}


void write_start_table(int* start)
{
    //7 bits + 1 for sign (the oldest); 1 - negative, 0 - positive
    FILE* fp = fopen("start.txt", "w");
    for (int i = 0; i < m; i++) {
        char binary[m];
        parse_char_to_binary((char)(start[i]), binary);
        for (int i = 7; i >= 0; --i)
            fputc(binary[i], fp);
        fputc('\n', fp);
    }
    fclose(fp);
}


void write_encoding_table(int* encoding_table)
{
    FILE* fp = fopen("encoding.txt", "w");
    for (int i = 0; i < L; i++) {
        char binary[8];
        parse_char_to_binary((char)(encoding_table[i]), binary);
        for (int i = 7; i >= 0; --i)
            fputc(binary[i], fp);
        fputc('\n', fp);
    }
    fclose(fp);
}

void write_decoding_table(struct decoding_table *decoding_table)
{
    FILE* fp = fopen("decoding.txt", "w");
    for (int X = 0; X < L; X++) {
        char binary[8];
        parse_char_to_binary(decoding_table[X].symbol, binary);
        for (int i = 7; i >= 0; --i)
            fputc(binary[i], fp);

        parse_char_to_binary((char)(decoding_table[X].nb_bits), binary);
        for(int i = 7; i >= 0; --i)
            fputc(binary[i], fp);

        parse_char_to_binary((char)(decoding_table[X].new_x), binary);
        for(int i = 7; i >= 0; --i)
            fputc(binary[i], fp);

        fputc('\n', fp);
    }
    fclose(fp);
}


int main()
{
    char symbol[] = {'1', '1', '0', '2', '2', '1', '0', '2', '1', '0', '2', '1', '2', '1', '1', '1'};

    /*spread(symbol);
    for (int i  = 0; i < L; i++)
        printf("%c ", symbol[i]);
    printf("\n");*/

    struct decoding_table decoding_table[L];
    prepare_decoding(symbol, decoding_table);

    int nb[m], start[m], encoding_table[L];
    prepare_encoding(symbol, nb, start, encoding_table);

    for(int i = 0; i < m; i++)
        printf("%d ", start[i]);

    write_decoding_table(decoding_table);
    write_nb_table(nb);
    write_start_table(start);
    write_encoding_table(encoding_table);

    return 0;
}
