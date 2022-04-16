import mysql.connector as sql # for database
import tkinter as tk          # for GUI

def main():
    root = tk.Tk() # create a window
    root.title("MySQL Database") # set window title
    root.geometry("500x500") # set window size
    root.resizable(False, False) # disable window resizing
    root.mainloop() # start the GUI

if __name__ == '__main__':
    main()