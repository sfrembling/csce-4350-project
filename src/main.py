import mysql.connector as sql # for database
import tkinter as tk          # for GUI
import tkinter.ttk as ttk
import tkinter.messagebox as msg
import database as db

# quit the program
def quit(root: tk.Tk):
    root.quit()

# setup the root window
def setup_root(title: str, size: int) -> tk.Tk:
    root = tk.Tk()
    root.title(title)
    root.geometry(f"{size}x{size}")
    root.resizable(False, False)
    root.protocol("WM_DELETE_WINDOW", quit(root))
    return root

def run(root: tk.Tk):
    root.mainloop()

# Prompts the user for the database information and passes that info to "entry"
def get_db_info(root: tk.Tk, entry: callable) -> db.DBInfo:
    host = tk.StringVar()
    user = tk.StringVar()
    port = tk.StringVar()
    passwd = tk.StringVar()

    host_entry = ttk.Entry(root, textvariable=host)
    user_entry = ttk.Entry(root, textvariable=user)
    port_entry = ttk.Entry(root, textvariable=port)
    passwd_entry = ttk.Entry(root, textvariable=passwd, show="*")
    
    host_entry.grid(row=0, column=1)
    user_entry.grid(row=1, column=1)
    port_entry.grid(row=2, column=1)
    passwd_entry.grid(row=3, column=1)

    ttk.Label(root, text="Host").grid(row=0, column=0)
    ttk.Label(root, text="User").grid(row=1, column=0)
    ttk.Label(root, text="Port").grid(row=2, column=0)
    ttk.Label(root, text="Password").grid(row=3, column=0)

    host_entry.focus()

    ttk.Button(root, text="Submit", command=lambda: entry(db.DBInfo(host.get(), user.get(), port.get(), passwd.get()))).grid(row=4, column=1)

# attempt to connect to the database using the info passed in
# if successful, return the connection
# if not, prompt the user for the database info again
def test_entry(info: db.DBInfo):
    try:
        database = sql.connect(
            host=info.host,
            user=info.user,
            port=info.port,
            passwd=info.passwd
        )
        return database
    except sql.Error as e:
        msg.showerror("Error", f"{e}")

def main():
    root = setup_root("Grocery Store DB", 500)

    # get database info then try to connect. 
    info = get_db_info(root, test_entry)


    run(root)


if __name__ == '__main__':
    main()