abstract class CounterEvents {}

class Increment extends CounterEvents{
  int value;
  Increment({required this.value});
}
class Decrement extends CounterEvents{
  int value;
  Decrement({required this.value});
}
