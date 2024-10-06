abstract class Repository<T> {
  void addToList(T item);
  Map<String, T> getList();
  T getElementById(int id);
  void update(T item);
  void remove(int id);
}
