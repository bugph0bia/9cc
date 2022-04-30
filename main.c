#include "9cc.h"

int main(int argc, char **argv) {
    if (argc != 2) {
        fprintf(stderr, "引数の個数が正しくありません\n");
        return 1;
    }

    // トークナイズ
    token = tokenize(argv[1]);
    // パース
    Node *node = expr();
    // コード生成
    codegen(node);

    return 0;
}
