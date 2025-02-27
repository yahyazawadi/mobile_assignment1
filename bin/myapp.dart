import 'package:myapp/myapp.dart' as myapp;


void main() {
  List<Map<String, dynamic>> library = [];
  
  
  AddBook(library, Title: "No Longer Human", Year: 1948, Author: "Osamu Dazai", Genre: "Fiction");
  AddBook(library, Title: "The Makioka Sisters", Year: 2022, Genre: "Historical");
  AddBook(library, Title: "The Moon Over the Mountain", Author: "Atsushi Nakajima", Genre: "Fiction");
  

  print("\nGetting info for 'No Longer Human':");
  print(GetBookInformation(library, Title: "No Longer Human"));
  
  print("\nGetting info for 'notreal':");
  print(GetBookInformation(library, Title: "not real")); 
  

  print("\nListing all books:");
  ListAllBooks(library);
  
  print("\nListing all books in 'Fiction' Genre:");
  ListAllBooks(library, Genre: "Fiction");
  
  print("\nListing books by Genre 'Historical':");
  ListBooksByGenre(library, Genre: "Historical");

  print("\nListing books by Genre 'none':");
  ListBooksByGenre(library, Genre: "none");


  print("\nRemoving book 'The Moon Over the Mountain':");
  RemoveBook(library, Title: "The Moon Over the Mountain"); 

  print("\nRemoving book 'Nonexistent Book':");
  RemoveBook(library, Title: "Nonexistent Book"); 
  print("\nListing all books after removals:");
  ListAllBooks(library);
}


void AddBook(List <Map<String, dynamic>> Books,
{required String Title, 
 int Year = -9999,
 String Author = "unknown",
 String Genre = "unknown",}) 
    {print('added book: $Title, Year: $Year, Author: $Author, Genre: $Genre');
Map <String,dynamic> Book=
{
"Title": Title,
"Year": Year,
"Author": Author,
"Genre": Genre,
};
  Books.add(Book);
  print("book $Title added succufully");
}


String GetBookInformation( List <Map<String, dynamic>> Books, {required String Title}) {
  String info = "book not found";
  Books.forEach((Book) {if (Book["Title"] == Title)
  info = "Author: ${Book["Author"]}, Year: ${Book["Year"]}, Genre: ${Book["Genre"]}";});
  return info;
}

void ListAllBooks(List <Map<String, dynamic>> Books, {String Genre = "none"}){
  if (Genre == "none"){
  Books.forEach((Book){
    print("Title: ${Book["Title"]}, Author: ${Book["Author"]}, Year: ${Book["Year"]}, Genre: ${Book["Genre"]}");
  });
  return;
  }
  else{
    print("for the gerne $Genre:");
    Books.forEach((Book){  if(Book["Genre"]==Genre)
    print("Title: ${Book["Title"]}, Author: ${Book["Author"]}, Year: ${Book["Year"]}");
  });
  }

}


void ListBooksByGenre(List <Map<String, dynamic>> Books, {required String Genre}){
  var BooksByGenre = Books.where((book) => book["Genre"]== Genre);
  if (BooksByGenre.isEmpty) {print("no books found for this Genre found"); return;}
  BooksByGenre.forEach((Book) {print("Title: ${Book["Title"]}, Author: ${Book["Author"]}, Year: ${Book["Year"]}");;
  });

}
 
void RemoveBook(List <Map<String, dynamic>> Books,  {required String Title}){
  int initialLength = Books.length;
  Books.removeWhere((Book) => Book["Title"] == Title);
  if (Books.length < initialLength) {
    print("Book removed successfully.");
  } else {
    print("Book not found.");
  }
}






/*
List <Map<String, dynamic>> GetBookInformation(List <Map<String, dynamic>> Books, String Title) {
  List <Map<String, dynamic>> BooksWithTheTitle = Books.where((Book) => Book["Title"]==Title).toList(); 
  return(BooksWithTheTitle);
}*/
/*
void RemoveBook(String Title){
  for (var Book in Library){
    if (Book["Title"]==Title){
    Library.remove(Book);
    print("removed Book");
    return ;
    }
  }
  print("Book not found");
}*/

/*
void ListAllBooks(){
  for (var Book in Library){
    print("Title: ${Book["Title"]}, Author: ${Book["Author"]}, Year: ${Book["Year"]}, Genre: ${Book["Genre"]}");
  }
}*/
/*String GetBookInformation(String Title){

  for (var Book in Library){
    if (Book["Title"] == Title) {
      return ("Title: ${Book["Title"]}, Author: ${Book["Author"]}, Year: ${Book["Year"]}, Genre: ${Book["Genre"]}");
      }
  }
  return ("not found");
}
String GetBookInformation(String Title){

  for (var Book in Library){
    if (Book["Title"] == Title) {
      return ("Title: ${Book["Title"]}, Author: ${Book["Author"]}, Year: ${Book["Year"]}, Genre: ${Book["Genre"]}");
      }
  }
  return ("not found");
}*/

