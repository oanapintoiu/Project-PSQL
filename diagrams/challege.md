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
    participant ar as ____ class <br /> (in lib/____.rb)
    participant db_conn as ____ class in (in lib/____.rb)
    participant db as Postgres database

    Note left of t: Flow of time <br />⬇ <br /> ⬇ <br /> ⬇ 

    t->>app: Runs `ruby ____`
    app->>db_conn: Opens connection to database by calling ____ method on ____
    db_conn->>db_conn: Opens database connection using PG and stores the connection
    app->>ar: Calls ____ method on ____
    ar->>db_conn: Sends SQL query by calling ____ method on ____
    db_conn->>db: Sends query to database via the open database connection
    db->>db_conn: Returns an ____ of ____, one for each row of the ____ table

    db_conn->>ar: Returns an ____ of ____, one for each row of the ____ table
    loop 
        ar->>ar: Loops through ____ and creates a ____ object for every row
    end
    ar->>app: Returns ____ of ____ objects
    app->>t: Prints list of ____ to terminal

```
