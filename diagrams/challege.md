Challenge
This is a process feedback challenge. That means you should record yourself doing it and submit that recording to your coach for feedback. How do I do this?

Note: For this challenge, record yourself as you talk through your finished diagram (there is no need to record yourself as you create the diagram). As part of your submission, please upload an image file with your diagram as well as your recording.

Create a similar sequence diagram to the one above for the. Make sure your diagram includes all of the challenge you completed in the previous section. Make sure your diagram includes the following:

The terminal
The main program (app.rb)
The repository class
The database connection class
The database
You can create these diagrams in the diagramming tool of your choice but a nice one for creating sequence diagrams specifically is diagram.codes.

```mermaid
sequenceDiagram
    participant t as terminal
    participant app as Main program (in app.rb)
    participant ar as BooksRepository class <br /> (in lib/books_repository.rb)
    participant db_conn as DatabaseConnection class in (in lib/database_connection.rb)
    participant db as Postgres database

    Note left of t: Flow of time <br />⬇ <br /> ⬇ <br /> ⬇ 

    t->>app: Runs `ruby app.rb`
    app->>db_conn: Opens connection to database by calling 'connect' method on DatabaseConnection
    db_conn->>db_conn: Opens database connection using PG and stores the connection
    app->>ar: Calls 'all' method on BookRepository
    ar->>db_conn: Sends SQL query by calling 'exec params' method on DatabaseConnection
    db_conn->>db: Sends query to database via the open database connection
    db->>db_conn: Returns an array of hashes, one for each row of the books table

    db_conn->>ar: Returns an array of hashes, one for each row of the books table
    loop 
        ar->>ar: Loops through ____ and creates a ____ object for every row
    end
    ar->>app: Returns ____ of ____ objects
    app->>t: Prints list of ____ to terminal

```
