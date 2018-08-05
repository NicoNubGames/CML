Using these scripts, we can have unlimited remote desktop sessions that never lose their "graphical context", allowing,
for example, autohotkey scripts to work remotely, even when we aren't connected from a different computer.

Here, we have user accounts 0, 1, 2, 3, 4, and 5.  0 is a master 'console' session, that never loses graphical
context as long as you run "disconnect_master" as admin from inside the remote desktop to disconnect.  This converts the
current remote session into a "console" session (Which means it's actually on the desktop at the remote computer,
and a user is currently "logged in" in the truest sense)

From user 0, we can run remote desktop instances to users 1-5 in sequence.  Since user 0 will never "deactivate",
neither will these nested sessions.

BEFORE THIS WORKS: You might have to run "rdpwrap" (You can find on Github) and customize RDP.  It might take some
fiddling to get multiple RDP sessions working in the first place.

You will also need to change the server names, depending on what the "computer name" of the remote computer is set to

For extra swag, you can use the desktop backgrounds in the "backgrounds" folder

RECAP:
Place shortcut to "connect_master" on local desktop
Place shortcut to "disconnect_master" on 0 desktop and set "run as administrator" in advanced properties
Place shortcut to 1, 2, 3, 4 and 5 on 0 desktop

To run, do "connect_master", then on 0 run 1 - 5 (or less), then do "disconnect_master"



NOTE:
If you have one physical machine, you can also utilize this by connecting to different local
accounts from your main account.  Then, you can simply minimize those remote sessions and
continue using your machine as normal.

The reason I don't do this is that using a remote dedicated machine (i.e. server) means
that I don't need to keep my main working laptop always on and at home.



ADDITIONAL:
I include batch scripts that run a autohotkey script on different users, but you require RunInSession (which does just that)
For my purposes a central controller on 0 runs ahk scripts on different sessions on certain events.  These batch scripts
need to be run as administrator (you can use the shortcut trick as well).

So, place shortcut to rs_mc_1 - rs_mc_5 on Desktop if you're going to use it

You should also do the following in this case:

HKEY_CURRENT_USER\Software\Microsoft\Terminal Server Client

Create a DWORD value named RemoteDesktop_SuppressWhenMinimized and set it to 2.