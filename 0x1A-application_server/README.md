Application server
DevOps
SysAdmin

Concepts
For this project, we expect you to look at these concepts:

Web Server(Web Server
Do not mix up web server and server.

A web server is a software that delivers web pages. A server is an actual computer.

But you might hear people referring to a web server using the word server. (Check out the server concept page to learn more about this.)

As mentioned above, a server is a physical machine, an actual computer, but in the Cloud era that could also be a virtual computer, generally called a VM (Virtual Machine) or container.

Readme:
Wikipedia page about web server
Web server
What is a Web Server)
Server(Server
Servers are located in datacenters which are buildings that host hundreds, or even thousands of computers (servers). You can think of a server as a computer without a keyboard, mouse, or screen, that is accessible only by a network. A server can be physical or virtual. A server runs an OS (operating system).

Read:

What is a server
Watch:

What is a server
Where are servers hosted (data centers)
Do not mix up server and web server. (Check out the web server concept page to know more about this.))
Web stack debugging(Web stack debugging
Intro
Debugging usually takes a big chunk of a software engineer’s time. The art of debugging is tough and it takes years, even decades to master, and that is why seasoned software engineers are the best at it… experience. They have seen lots of broken code, buggy systems, weird edge cases and race conditions.



Non-exhaustive guide to debugging
School specific
If you are struggling to get something right that is run on the checker, like a Bash script or a piece of code, keep in mind that you can simulate the flow by starting a Docker container with the distribution that is specified in the requirements and by running your code. Check the Docker concept page for more info.

Test and verify your assumptions
The idea is to ask a set of questions until you find the issue. For example, if you installed a web server and it isn’t serving a page when browsing the IP, here are some questions you can ask yourself to start debugging:

Is the web server started? - You can check using the service manager, also double check by checking process list.
On what port should it listen? - Check your web server configuration
Is it actually listening on this port? - netstat -lpdn - run as root or sudo so that you can see the process for each listening port
It is listening on the correct server IP? - netstat is also your friend here
Is there a firewall enabled?
Have you looked at logs? - usually in /var/log and tail -f is your friend
Can I connect to the HTTP port from the location I am browsing from? - curl is your friend
There is a good chance that at this point you will already have found part of the issue.

Get a quick overview of the machine state
Youtube video First 5 Commands When I Connect on a Linux Server

When you connect to a server/machine/computer/container you want to understand what’s happened recently and what’s happening now, and you can do this with 5 commands in a minute or less:

w
shows server uptime which is the time during which the server has been continuously running
shows which users are connected to the server
load average will give you a good sense of the server health - (read more about load here and here)
history
shows which commands were previously run by the user you are currently connected to
you can learn a lot about what type of work was previously performed on the machine, and what could have gone wrong with it
where you might want to start your debugging work
top
shows what is currently running on this server
order results by CPU, memory utilization and catch the ones that are resource intensive
df
shows disk utilization
netstat
what port and IP your server is listening on
what processes are using sockets
try netstat -lpn on a Ubuntu machine
Machine
Debugging is pretty much about verifying assumptions, in a perfect world the software or system we are working on would be working perfectly, the server is in perfect shape and everybody is happy. But actually, it NEVER goes this way, things ALWAYS fail (it’s tremendous!).

For the machine level, you want to ask yourself these questions:

Does the server have free disk space? - df
Is the server able to keep up with CPU load? - w, top, ps
Does the server have available memory? free
Are the server disk(s) able to keep up with read/write IO? - htop
If the answer is no for any of these questions, then that might be the reason why things are not going as expected. There are often 3 ways of solving the issue:

free up resources (stop process(es) or reduce their resource consumption)
increase the machine resources (adding memory, CPU, disk space…)
distributing the resource usage to other machines
Network issue
For the machine level, you want to ask yourself these questions:

Does the server have the expected network interfaces and IPs up and running? ifconfig
Does the server listen on the sockets that it is supposed to? netstat (netstat -lpd or netstat -lpn)
Can you connect from the location you want to connect from, to the socket you want to connect to? telnet to the IP + PORT (telnet 8.8.8.8 80)
Does the server have the correct firewall rules? iptables, ufw:
iptables -L
sudo ufw status
Process issue
If a piece of Software isn’t behaving as expected, it can obviously be because of above reasons… but the good news is that there is more to look into (there is ALWAYS more to look into actually).

Is the software started? init, init.d:
service NAME_OF_THE_SERVICE status
/etc/init.d/NAME_OF_THE_SERVICE status
Is the software process running? pgrep, ps:
pgrep -lf NAME_OF_THE_PROCESS
ps auxf
Is there anything interesting in the logs? look for log files in /var/log/ and tail -f is your friend
Debugging is fun
Debugging can be frustrating, but it will definitely be part of your job, it requires experience and methodology to become good at it. The good news is that bugs are never going away, and the more experienced you become, trickier bugs will be assigned to you! Good luck :))

Background Context


Your web infrastructure is already serving web pages via Nginx that you installed in your first web stack project. While a web server can also serve dynamic content, this task is usually given to an application server. In this project you will add this piece to your infrastructure, plug it to your Nginx and make is serve your Airbnb clone project.


Resources
Read or watch:

Application server vs web server(https://www.nginx.com/resources/glossary/application-server-vs-web-server/)
How to Serve a Flask Application with Gunicorn and Nginx on Ubuntu 16.04 (As mentioned in the video, do not install Gunicorn using virtualenv, just install everything globally)(https://www.digitalocean.com/community/tutorials/how-to-serve-flask-applications-with-gunicorn-and-nginx-on-ubuntu-16-04)
Running Gunicorn(https://docs.gunicorn.org/en/latest/run.html)
Be careful with the way Flask manages slash in route - strict_slashes(https://werkzeug.palletsprojects.com/en/0.14.x/routing/)
Upstart documentation(https://doc.ubuntu-fr.org/upstart)

0. Let’s serve what you built for AirBnB clone v2 - Web framework on web-01. This task is an exercise in setting up your development environment, which is used for testing and debugging your code before deploying it to production.

Requirements:

Make sure that task #3 of your SSH project is completed for web-01. The checker will connect to your servers.
Install the net-tools package on your server: sudo apt install -y net-tools
Git clone your AirBnB_clone_v2 on your web-01 server.
Configure the file web_flask/0-hello_route.py to serve its content from the route /airbnb-onepage/ on port 5000.
Your Flask application object must be named app (This will allow us to run and check your code).
Example:

Window 1:
ubuntu@229-web-01:~/AirBnB_clone_v2$ python3 -m web_flask.0-hello_route
 * Serving Flask app "0-hello_route" (lazy loading)
 * Environment: production
   WARNING: Do not use the development server in a production environment.
   Use a production WSGI server instead.
 * Debug mode: off
 * Running on http://0.0.0.0:5000/ (Press CTRL+C to quit)
35.231.193.217 - - [02/May/2019 22:19:42] "GET /airbnb-onepage/ HTTP/1.1" 200 -
Window 2:
ubuntu@229-web-01:~/AirBnB_clone_v2$ curl 127.0.0.1:5000/airbnb-onepage/
Hello HBNB!ubuntu@229-web-01:~/AirBnB_clone_v2$

1. Now that you have your development environment set up, let’s get your production application server set up with Gunicorn on web-01, port 5000. You’ll need to install Gunicorn and any libraries required by your application. Your Flask application object will serve as a WSGI entry point into your application. This will be your production environment. As you can see we want the production and development of your application to use the same port, so the conditions for serving your dynamic content are the same in both environments.

Requirements:

Install Gunicorn and any other libraries required by your application.
The Flask application object should be called app. (This will allow us to run and check your code)
You will serve the same content from the same route as in the previous task. You can verify that it’s working by binding a Gunicorn instance to localhost listening on port 5000 with your application object as the entry point.
In order to check your code, the checker will bind a Gunicorn instance to port 6000, so make sure nothing is listening on that port.
Example:

Terminal 1:
ubuntu@229-web-01:~/AirBnB_clone_v2$ gunicorn --bind 0.0.0.0:5000 web_flask.0-hello_route:app
[2019-05-03 20:47:20 +0000] [3595] [INFO] Starting gunicorn 19.9.0
[2019-05-03 20:47:20 +0000] [3595] [INFO] Listening at: http://0.0.0.0:5000 (3595)
[2019-05-03 20:47:20 +0000] [3595] [INFO] Using worker: sync
[2019-05-03 20:47:20 +0000] [3598] [INFO] Booting worker with pid: 3598
Terminal 2:
ubuntu@229-web-01:~$ curl 127.0.0.1:5000/airbnb-onepage/
Hello HBNB!ubuntu@229-web-01:~$

2. Building on your work in the previous tasks, configure Nginx to serve your page from the route /airbnb-onepage/

Requirements:

Nginx must serve this page both locally and on its public IP on port 80.
Nginx should proxy requests to the process listening on port 5000.
Include your Nginx config file as 2-app_server-nginx_config.
Notes:

In order to test this you’ll have to spin up either your production or development application server (listening on port 5000)
In an actual production environment the application server will be configured to start upon startup in a system initialization script. This will be covered in the advanced tasks.
You will probably need to reboot your server (by using the command $ sudo reboot) to have Nginx publicly accessible
Example:

On my server:
Window 1:
ubuntu@229-web-01:~/AirBnB_clone_v2$ gunicorn --bind 0.0.0.0:5000 web_flask.0-hello_route:app
[2019-05-06 20:43:57 +0000] [14026] [INFO] Starting gunicorn 19.9.0
[2019-05-06 20:43:57 +0000] [14026] [INFO] Listening at: http://0.0.0.0:5000 (14026)
[2019-05-06 20:43:57 +0000] [14026] [INFO] Using worker: sync
[2019-05-06 20:43:57 +0000] [14029] [INFO] Booting worker with pid: 14029
Window 2:
ubuntu@229-web-01:~/AirBnB_clone_v2$ curl 127.0.0.1/airbnb-onepage/
Hello HBNB!ubuntu@229-web-01:~/AirBnB_clone_v2$
On my local terminal:
vagrant@ubuntu-xenial:~$ curl -sI 35.231.193.217/airbnb-onepage/
HTTP/1.1 200 OK
Server: nginx/1.10.3 (Ubuntu)
Date: Mon, 06 May 2019 20:44:55 GMT
Content-Type: text/html; charset=utf-8
Content-Length: 11
Connection: keep-alive
X-Served-By: 229-web-01

vagrant@ubuntu-xenial:~$ curl 35.231.193.217/airbnb-onepage/
Hello HBNB!vagrant@ubuntu-xenial:~$

3. Building on what you did in the previous tasks, let’s expand our web application by adding another service for Gunicorn to handle. In AirBnB_clone_v2/web_flask/6-number_odd_or_even, the route /number_odd_or_even/<int:n> should already be defined to render a page telling you whether an integer is odd or even. You’ll need to configure Nginx to proxy HTTP requests to the route /airbnb-dynamic/number_odd_or_even/(any integer) to a Gunicorn instance listening on port 5001. The key to this exercise is getting Nginx configured to proxy requests to processes listening on two different ports. You are not expected to keep your application server processes running. If you want to know how to run multiple instances of Gunicorn without having multiple terminals open, see tips below.

Requirements:

Nginx must serve this page both locally and on its public IP on port 80.
Nginx should proxy requests to the route /airbnb-dynamic/number_odd_or_even/(any integer) the process listening on port 5001.
Include your Nginx config file as 3-app_server-nginx_config.
Tips:

Check out these articles/docs for clues on how to configure Nginx: Understanding Nginx Server and Location Block Selection Algorithms, Understanding Nginx Location Blocks Rewrite Rules, Nginx Reverse Proxy.
In order to spin up a Gunicorn instance as a detached process you can use the terminal multiplexer utility tmux. Enter the command tmux new-session -d 'gunicorn --bind 0.0.0.0:5001 web_flask.6-number_odd_or_even:app' and if successful you should see no output to the screen. You can verify that the process has been created by running pgrep gunicorn to see its PID. Once you’re ready to end the process you can either run tmux a to reattach to the processes, or you can run kill <PID> to terminate the background process by ID.
Example:

Terminal 1:
ubuntu@229-web-01:~/AirBnB_clone_v2$ tmux new-session -d 'gunicorn --bind 0.0.0.0:5000 web_flask.0-hello_route:app'
ubuntu@229-web-01:~/AirBnB_clone_v2$ pgrep gunicorn
1661
1665
ubuntu@229-web-01:~/AirBnB_clone_v2$ tmux new-session -d 'gunicorn --bind 0.0.0.0:5001 web_flask.6-number_odd_or_even:app'
ubuntu@229-web-01:~/AirBnB_clone_v2$ pgrep gunicorn
1661
1665
1684
1688

ubuntu@229-web-01:~/AirBnB_clone_v2$ curl 127.0.0.1:5000/airbnb-onepage/
Hello HBNB!ubuntu@229-web-01:~/AirBnB_clone_v2$

ubuntu@229-web-01:~/AirBnB_clone_v2$ curl 127.0.0.1:5001/number_odd_or_even/6
<!DOCTYPE html>
<HTML lang="en">
  <HEAD>
    <TITLE>HBNB</TITLE>
  </HEAD>
  <BODY><H1>Number: 6 is even</H1></BODY>
</HTML>ubuntu@229-web-01:~/AirBnB_clone_v2
ubuntu@229-web-01:~$ 
ubuntu@229-web-01:~/AirBnB_clone_v2$ curl 127.0.0.1/airbnb-dynamic/number_odd_or_even/5
<!DOCTYPE html>
<HTML lang="en">
  <HEAD>
    <TITLE>HBNB</TITLE>
  </HEAD>
  <BODY><H1>Number: 5 is odd</H1></BODY>
</HTML>ubuntu@229-web-01:~/AirBnB_clone_v2$
Local machine:
vagrant@ubuntu-xenial:~$ curl 35.231.193.217/airbnb-dynamic/number_odd_or_even/6<!DOCTYPE html>
<HTML lang="en">
  <HEAD>
    <TITLE>HBNB</TITLE>
  </HEAD>
  <BODY><H1>Number: 6 is even</H1></BODY>
</HTML>vagrant@ubuntu-xenial:~$

4. Let’s serve what you built for AirBnB clone v3 - RESTful API on web-01.

Requirements:

Git clone your AirBnB_clone_v3
Setup Nginx so that the route /api/ points to a Gunicorn instance listening on port 5002
Nginx must serve this page both locally and on its public IP on port 80
To test your setup you should bind Gunicorn to api/v1/app.py
It may be helpful to import your data (and environment variables) from this project
Upload your Nginx config file as 4-app_server-nginx_config
Example:

Terminal 1:
ubuntu@229-web-01:~/AirBnB_clone_v3$ tmux new-session -d 'gunicorn --bind 0.0.0.0:5002 api.v1.app:app'
ubuntu@229-web-01:~/AirBnB_clone_v3$ curl 127.0.0.1:5002/api/v1/states
[{"__class__":"State","created_at":"2019-05-10T00:39:27.032802","id":"7512f664-4951-4231-8de9-b18d940cc912","name":"California","updated_at":"2019-05-10T00:39:27.032965"},{"__class__":"State","created_at":"2019-05-10T00:39:36.021219","id":"b25625c8-8a7a-4c1f-8afc-257bf9f76bc8","name":"Arizona","updated_at":"2019-05-10T00:39:36.021281"}]
ubuntu@229-web-01:~/AirBnB_clone_v3$
ubuntu@229-web-01:~/AirBnB_clone_v3$ curl 127.0.0.1/api/v1/states
[{"__class__":"State","created_at":"2019-05-10T00:39:27.032802","id":"7512f664-4951-4231-8de9-b18d940cc912","name":"California","updated_at":"2019-05-10T00:39:27.032965"},{"__class__":"State","created_at":"2019-05-10T00:39:36.021219","id":"b25625c8-8a7a-4c1f-8afc-257bf9f76bc8","name":"Arizona","updated_at":"2019-05-10T00:39:36.021281"}]
ubuntu@229-web-01:~/AirBnB_clone_v3$
Local Terminal:
vagrant@ubuntu-xenial:~$ curl 35.231.193.217/api/v1/states
[{"__class__":"State","created_at":"2019-05-10T00:39:27.032802","id":"7512f664-4951-4231-8de9-b18d940cc912","name":"California","updated_at":"2019-05-10T00:39:27.032965"},{"__class__":"State","created_at":"2019-05-10T00:39:36.021219","id":"b25625c8-8a7a-4c1f-8afc-257bf9f76bc8","name":"Arizona","updated_at":"2019-05-10T00:39:36.021281"}]
vagrant@ubuntu-xenial:~$

5. Let’s serve what you built for AirBnB clone - Web dynamic on web-01.

Requirements:

Git clone your AirBnB_clone_v4
Your Gunicorn instance should serve content from web_dynamic/2-hbnb.py on port 5003
Setup Nginx so that the route / points to your Gunicorn instance
Setup Nginx so that it properly serves the static assets found in web_dynamic/static/ (this is essential for your page to render properly)
For your website to be fully functional, you will need to reconfigure web_dynamic/static/scripts/2-hbnb.js to the correct IP
Nginx must serve this page both locally and on its public IP and port 5003
Make sure to pull up your Developer Tools on your favorite browser to verify that you have no errors
Upload your Nginx config as 5-app_server-nginx_config
After loading, your website should look like this:

6. Once you’ve got your application server configured, you want to set it up to run by default when Linux is booted. This way when your server inevitably requires downtime (you have to shut it down or restart it for one reason or another), your Gunicorn process(es) will start up as part of the system initialization process, freeing you from having to manually restart them. For this we will use systemd. You can read more about systemd in the documentation posted at the top of this project but to put it succinctly, it is a system initialization daemon for the Linux OS (amongst other things). For this task you will write a systemd script which will start your application server for you. As mentioned in the video at the top of the project, you do not need to create a Unix socket to bind the process to.

Requirements:

Write a systemd script which starts a Gunicorn process to serve the same content as the previous task (web_dynamic/2-hbnb.py)
The Gunicorn process should spawn 3 worker processes
The process should log errors in /tmp/airbnb-error.log
The process should log access in /tmp/airbnb-access.log
The process should be bound to port 5003
Your systemd script should be stored in the appropriate directory on web-01
Make sure that you start the systemd service and leave it running
Upload gunicorn.service to GitHub
bob@dylan:~$ curl -s 127.0.0.1:5003/2-hbnb | tail -5
    </div>
    <footer>
      <p>Holberton School</p>
    </footer>
  </body>
</html>
bob@dylan:~$ 
bob@dylan:~$ curl -s 12.13.14.15/ | tail -5
    </div>
    <footer>
      <p>Holberton School</p>
    </footer>
  </body>
</html>
bob@dylan:~$ 

7. One of the most important metrics for any Internet-based business is its uptime. It is the percentage of the time over a given period that the service/product is accessible to customers. Let’s pick the example of Amazon.com, for every minute of downtime (which is the opposite of uptime), it costs the company $2M. Yet, application servers often need to restart to update with the new version of the code or new configuration, when doing this operation, an application server cannot serve traffic, which meant downtime.

To avoid this; application servers are designed with a master/workers infrastructure. The master is in charge of:

Receiving requests
Managing workers (starting, stopping)
Distributing requests to workers
Workers are the actual ones processing the query by generation dynamic content by processing the application code.

To update an application without downtime, the master will proceed with a progressive rollout of the update. It will gracefully shut down some workers ( meaning that it will tell workers to finish processing the request they are working on, but will not send them new requests, once the worker is done, it’s will be shutdown) and start new ones with the new application code or configuration, then move on to the other old workers until it has renewed the whole pool.

Write a simple Bash script to reload Gunicorn in a graceful way.

Example:

sylvain@ubuntu$ ps auxf | grep gunicorn
vagrant   9376  2.2  3.6  58068 18320 pts/3    S+   19:25   0:00  |   \_ /home/vagrant/AirBnB_clone_v4/bin/python3 /home/vagrant/AirBnB_clone_v4/bin/gunicorn --bind 0.0.0.0:8001 --workers 4 web_flask.0-hello_route:app
vagrant   9379  2.6  4.6  82800 23116 pts/3    S+   19:25   0:00  |       \_ /home/vagrant/AirBnB_clone_v4/bin/python3 /home/vagrant/AirBnB_clone_v4/bin/gunicorn --bind 0.0.0.0:8001 --workers 4 web_flask.0-hello_route:app
vagrant   9380  2.6  4.6  82804 23120 pts/3    S+   19:25   0:00  |       \_ /home/vagrant/AirBnB_clone_v4/bin/python3 /home/vagrant/AirBnB_clone_v4/bin/gunicorn --bind 0.0.0.0:8001 --workers 4 web_flask.0-hello_route:app
vagrant   9381  2.4  4.6  82808 23128 pts/3    S+   19:25   0:00  |       \_ /home/vagrant/AirBnB_clone_v4/bin/python3 /home/vagrant/AirBnB_clone_v4/bin/gunicorn --bind 0.0.0.0:8001 --workers 4 web_flask.0-hello_route:app
vagrant   9383  2.4  4.6  82816 23136 pts/3    S+   19:25   0:00  |       \_ /home/vagrant/AirBnB_clone_v4/bin/python3 /home/vagrant/AirBnB_clone_v4/bin/gunicorn --bind 0.0.0.0:8001 --workers 4 web_flask.0-hello_route:app
vagrant   9388  0.0  0.1  10460   940 pts/2    S+   19:25   0:00      \_ grep --color=auto gunicorn
sylvain@ubuntu$ ./4-reload_gunicorn_no_downtime
sylvain@ubuntu$ ps auxf | grep gunicorn
vagrant   9376  1.0  3.6  58068 18368 pts/3    S+   19:25   0:00  |   \_ /home/vagrant/AirBnB_clone_v4/bin/python3 /home/vagrant/AirBnB_clone_v4/bin/gunicorn --bind 0.0.0.0:8001 --workers 4 web_flask.0-hello_route:app
vagrant   9393  6.5  4.6  82832 23168 pts/3    S+   19:25   0:00  |       \_ /home/vagrant/AirBnB_clone_v4/bin/python3 /home/vagrant/AirBnB_clone_v4/bin/gunicorn --bind 0.0.0.0:8001 --workers 4 web_flask.0-hello_route:app
vagrant   9394  6.5  4.6  82832 23172 pts/3    S+   19:25   0:00  |       \_ /home/vagrant/AirBnB_clone_v4/bin/python3 /home/vagrant/AirBnB_clone_v4/bin/gunicorn --bind 0.0.0.0:8001 --workers 4 web_flask.0-hello_route:app
vagrant   9395  6.0  4.6  82840 23180 pts/3    S+   19:25   0:00  |       \_ /home/vagrant/AirBnB_clone_v4/bin/python3 /home/vagrant/AirBnB_clone_v4/bin/gunicorn --bind 0.0.0.0:8001 --workers 4 web_flask.0-hello_route:app
vagrant   9396  7.0  4.6  82844 23188 pts/3    S+   19:25   0:00  |       \_ /home/vagrant/AirBnB_clone_v4/bin/python3 /home/vagrant/AirBnB_clone_v4/bin/gunicorn --bind 0.0.0.0:8001 --workers 4 web_flask.0-hello_route:app
vagrant   9402  0.0  0.1  10460   936 pts/2    S+   19:25   0:00      \_ grep --color=auto gunicorn
sylvain@ubuntu$
In this example, you can see that my Bash script tells the master Gunicorn renewed all the workers.

For testing it, please use the command $ sudo reboot to reboot your server (not shutdown!!)


