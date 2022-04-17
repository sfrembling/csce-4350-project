import mysql.connector as sql            # SQL functionality
import tkinter as tk                     # GUI toolbox
from tkinter import ttk                  # 
from tkinter.messagebox import showerror # for displaying errors


# Allows user to login to the server using their information
class LoginScreen:
    # setup the login screen
    def __init__(self, master: tk.Tk) -> None:
        self.master = master
        self.frame = tk.Frame(self.master)

        self.master.title("MySQL Login")
        self.master.geometry("300x300")
        self.master.resizable(False, False)

        # login fields - username, passwd, host address, port number, database to use
        self.username = tk.StringVar()
        self.passwd   = tk.StringVar()
        self.host     = tk.StringVar()
        self.port     = tk.StringVar()
        self.database = tk.StringVar()

        # label and entry fields
        self.labels = {}
        self.entries = {}

        self.labels["username"]  = tk.Label(self.frame, text="Username")
        self.labels["passwd"]    = tk.Label(self.frame, text="Password")
        self.labels["host"]      = tk.Label(self.frame, text="Host Address")
        self.labels["port"]      = tk.Label(self.frame, text="Port Number")
        self.labels["database"]  = tk.Label(self.frame, text="Database")

        self.entries["username"] = tk.Entry(self.frame, textvariable=self.username)
        self.entries["passwd"]   = tk.Entry(self.frame, textvariable=self.passwd, show="*")
        self.entries["host"]     = tk.Entry(self.frame, textvariable=self.host)
        self.entries["port"]     = tk.Entry(self.frame, textvariable=self.port)
        self.entries["database"] = tk.Entry(self.frame, textvariable=self.database)


        first = True 
        for label in self.labels: # add all of the elements to the screen
            self.labels[label].pack()
            self.entries[label].pack()
            if first: # place focus on the first entry
                self.entries[label].focus()
                first = False
        
        self.enter_button = tk.Button(self.frame, text="Login", bg="green", fg="white", 
            command=(lambda: self.attempt_login()))
        
        self.enter_button.pack()

        self.frame.pack()
    
    # attempt a login
    def attempt_login(self) -> None:
        try:
            # pass sql all the information from the user
            # first, test the connection
            connection = sql.connect(
                host=self.host.get(), user=self.username.get(),
                port=int(self.port.get()), passwd=self.passwd.get(),
                auth_plugin="mysql_native_password"
            )
            # next, test the database
            connection.cursor().execute(f"USE {self.database.get()}")

            # all good at this point, destroy current screen and launch app
            self.frame.destroy()
            self.main = MainScreen(self.master, connection, self.database.get())
        except sql.Error as e:
            showerror(title="Unable to Connect", message=e)


# As the name suggests, main screen of the app after login
# Lets the user input SQL code and see the results
class MainScreen:
    def __init__(self, master: tk.Tk, connection, db_name: str) -> None:
        self.connection = connection
        self.db_name = db_name

        self.master = master
        self.frame = tk.Frame(self.master)

        self.master.title("Grocery Store DB")
        self.master.geometry("700x700")
        self.master.resizable(True, True)

        # Input text box
        self.labels = dict()
        self.entries = dict()

        self.labels["sql_input"]  = tk.Label(self.frame, text="Input SQL Code")

        self.entries["sql_input"] = tk.Text(self.frame, height=10, width=60)

        first = True
        for label in self.labels:
            self.labels[label].pack()
            self.entries[label].pack()
            if first:
                self.entries[label].focus()
                first = False
        
        # run button
        
        self.enter_button = tk.Button(self.frame, text="Run Code", bg="cyan", fg="black",
            command=(lambda: self.run_sql()))
        
        self.enter_button.pack()

        # logout button

        self.logout_button = tk.Button(self.frame, text="Log Out", bg="red", fg="white",
            command=(lambda: self.logout()))

        self.logout_button.pack()

        # tabular output

        self.output = ttk.Treeview(self.frame, columns=('', '', ''), show='headings', selectmode="browse", height=20)
        self.output.pack(side="left")

        self.output_scroll = ttk.Scrollbar(self.frame, orient="vertical", command=self.output.yview)
        self.output_scroll.pack(side="right", fill="y")
        self.output.configure(yscrollcommand=self.output_scroll.set)

        self.frame.pack()
    
    # runs the provided SQL code and shows output
    def run_sql(self) -> None:
        try:
            code = self.entries["sql_input"].get("1.0", tk.END)
            code = code.split(sep=";")
            code = [command.strip() for command in code]

            cursor = self.connection.cursor()
            print(code, self.db_name)
            cursor.execute(f"USE {self.db_name}")

            for command in code:
                print(command)
                cursor.execute(command)

            columns = tuple([column[0] for column in cursor.description])

            self.output.destroy()
            self.output = ttk.Treeview(self.frame, columns=columns, show='headings', selectmode="browse", height=20)
            self.output.pack(side="left")

            for heading in columns:
                self.output.heading(heading, text=heading)
            
            for value in cursor:
                self.output.insert('', tk.END, values=value)
        except sql.Error as e:
            showerror(title="Unable to Run", message=e)
    
    # Log the user out, return to login screen
    def logout(self) -> None:
        self.frame.destroy()
        self.main = LoginScreen(self.master)


def main():
    root = tk.Tk()
    _ = LoginScreen(root)
    root.mainloop()

if __name__ == '__main__':
    main()