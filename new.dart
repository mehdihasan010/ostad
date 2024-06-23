class NewDart {
  int sumfun(int a, int b){
    return a+b;
  }
}

void main(){
  NewDart a = NewDart();
  int sum = a.sumfun(5, 20);
  print(sum);
}
