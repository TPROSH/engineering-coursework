#include <stdio.h>

int main(){

    int a[8];
    for(int i=0 ; i<8 ; i++){
        printf("Enter a number to store in array = ");
        scanf("%d" , &a[i]);
    }
    int count = 0;
    for(int j=0 ; j<8 ; j++){
        for(int k=j+1 ; k<8 ; k++){
            if(a[j] == a[k]){
                count += 1;
            }
            else{
                continue;
            }
        }
    }

    printf("\nduplicate no. of elements in array = %d" , count);

return 0;
}
