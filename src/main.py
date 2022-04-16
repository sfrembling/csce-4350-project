from tkinter import *
from tkinter.messagebox import showerror # import everything for GUI support
import mysql.connector as sql


screen = Tk()    # screen where text is drawn
connection: None # the active MySQL connection
name: str        # the database name
widgets = []     # maintains all the widgets
cursor: None

# the entry point where the user logs into the SQL server using their info
def login_screen():
    global screen
    global widgets
    global name
    screen.geometry("600x600")
    screen.title("Login to MySQL Server")
    screen.resizable(False, False)

    # holds the user's credentials
    host = StringVar()
    user = StringVar()
    port = StringVar()
    passwd = StringVar()
    name = StringVar()

    # host label and entry
    widgets.append(Label(screen, text="Host Address"))
    widgets.append(Entry(screen, textvariable=host))
    widgets[1].focus()

    # user label and entry
    widgets.append(Label(screen, text="Username"))
    widgets.append(Entry(screen, textvariable=user))

    # port label and entry
    widgets.append(Label(screen, text="Port Number"))
    widgets.append(Entry(screen, textvariable=port))

    # name label and entry
    widgets.append(Label(screen, text="Database Name"))
    widgets.append(Entry(screen, textvariable=name))


    # passwd label and entry
    widgets.append(Label(screen, text="Password"))
    widgets.append(Entry(screen, textvariable=passwd, show="*"))

    # submit button
    widgets.append(Button(screen, text="Submit Fields", width=10, height=1, bg="red", fg="white", command=(lambda: submit(host, user, port, passwd))))

    # pack the widgets
    for w in widgets:
        w.pack()

# attempt to connect to the server
def submit(host, user, port, passwd):
    global connection
    global name
    global cursor

    host = host.get()
    user = user.get()
    port = port.get()
    passwd = passwd.get()

    try:
        connection = sql.connect(
            host=host, user=user,
            port=port, passwd=passwd,
            auth_plugin="mysql_native_password"
        )
        cursor = connection.cursor()
        db_name = name.get()
        cursor.execute(f"USE {db_name}")
        perform_query()
    except sql.Error as e:
        showerror(title="Unable to Connect", message=e)

# allows the user to put in some SQL code
# and then see the result
# essentially the main loop of the program
def perform_query():
    global screen
    global widgets

    screen.title("Grocery Store DB")

    # clear the previous screen
    for w in widgets:
        w.destroy()

    widgets.clear()

    widgets.append(Label(screen, text="SQL Code")) 
    widgets.append(Text(screen, height=10)) # to get this text, use widgets[1]
    widgets.append(Button(screen, text="Run SQL Code", width=10, height=1, bg="blue", fg="white", command=(lambda: run_sql(widgets[1].get("1.0", END)))))
    widgets.append(Label(screen, text="Output")) 

    widgets.append(Text(screen, height=20)) # this is where the output should go - widgets[4]

    for w in widgets:
        w.pack()

# run the given native SQL code
def run_sql(code: str):
    global connection
    global widgets
    global name
    global cursor
    code = code.split(sep=";")
    code = [command.strip() for command in code]
    for command in code:
        cursor.execute(command)
    widgets[4].delete("1.0", "end")
    for line in cursor:
        widgets[4].insert(END, line)
        widgets[4].insert(END, "\n")
        print(line)

def main():
    login_screen()
    screen.mainloop()


if __name__ == '__main__':
    main()