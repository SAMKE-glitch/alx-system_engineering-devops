 Web infrastructure design
DNS
Basics
DNS is, in simple words, the technology that translates human-adapted, text-based domain names to machine-adapted, numerical-based IP:

Learn everything about DNS in cartoon(https://howdns.works/)
Be sure to know the main DNS record types:
A(https://support.dnsimple.com/articles/a-record/)
CNAME(https://en.wikipedia.org/wiki/CNAME_record)
MX(https://en.wikipedia.org/wiki/MX_record)
TXT(https://en.wikipedia.org/wiki/TXT_record)
Advanced
Use DNS to scale with round-robin DNS(https://www.dnsknowledge.com/whatis/round-robin-dns/)
What’s an NS Record?(https://support.dnsimple.com/articles/ns-record/)
What’s an SOA Record?(https://support.dnsimple.com/articles/soa-record/)
The root domain and sub domain - differences
A root domain is the parent domain to a sub domain, and its name is not, and can not be divided by a dot.

While creating any domain at a website of domain provider, the provider system will always ask you to choose a domain name without a dot in the name. In other words, the address of the root domain may be mydomain.com but it can never be my.domain.com. Domain providers block the ability to create such a root domain until you type a name without the dot. Why?

The dot in the domain name delimits the sub domain name (the part of the name before the dot, eg. www.my.) and the root domain name ( the part after the dot, ie .domain.com). This means that the address my.domain.com is a sub domain of the root domain, whose name is domain.com

In an administrator panel at domain provider account, you can create any number of sub domains. This means that for the root domain called domain.com it is possible to create different sub domains eg. my.domain.com, your.domain.com, school.domain.com… Creating multiple sub domains is always free and does not require you to set up new accounts on a domain provider website.

As you can see, all of the domain addresses used as an example (above) do not start with the www prefix. www is also a sub domain. The www prefix always leads to the main domain. See: What’s the point in having www in a url?(https://serverfault.com/questions/145777/what-s-the-point-in-having-www-in-a-url)

MONITORING
Just as the heart monitor in a hospital that is making sure that a patient’s heart is beating and at the right beat, software monitoring will watch computer metrics, record them, and emit an alert if something is unusual or that could make the computer not work properly happens.

You cannot fix or improve what you cannot measure is a famous saying in the tech industry. In the age of the data-ism, monitoring how our software systems are doing is an important thing.

Web stack monitoring can be broken down into 2 categories:

Application monitoring: getting data about your running software and making sure it is behaving as expected
Server monitoring: getting data about your virtual or physical server and making sure they are not overloaded (could be CPU, memory, disk or network overload)
Here are few famous monitoring tools:
NewRelic
NewRelic requires you to add a piece of JavaScript to your website, this agent will collect information and send it back to the New Relic servers. It will give you a detailed analysis of how quickly your website loads in a browser, with a detailed analysis at every level of the stack. If the website is loading too slowly or users are experiencing error (500), there is a feature that allows you to trigger an alert. NewRelic now does much more than this, I’ll let you discover the rest.

DataDog
DataDog allows you to measure and monitor everything with graphs. It gathers performance data from all your application components. The service has a lot of integrations. You usually just need to properly configure your alert and you are good to go with solid monitoring coverage.

Uptime Robot
Uptime Robot is a simple service that will check that your website is responding from multiple locations in the world. This is the bare minimum when you host a website.

Nagios
Nagios is an open source project started in 1999, it is among the most widely used monitoring tools in the tech industry. It is, however, seen as outdated. Nagios had trouble adapting to the rise of the Cloud but is slowly trying to catch up.

WaveFront
Wavefront is a cutting edge monitoring service funded by great software engineers who’ve built monitoring tools for the best tech companies in Silicon Valley. The idea is to be able to analyze anything that can produce data points. A query language that looks like SQL allows users to apply mathematical operations to these data points to extract values or detect anomalies from the time series data. While it takes some time to get used to the tool, it’s the type of monitoring that the best companies are using. To my knowledge, LinkedIn, Facebook and DropBox are using a very similar tool for their monitoring needs.



WEB SERVER
Do not mix up web server and server.

A web server is a software that delivers web pages. A server is an actual computer.

But you might hear people referring to a web server using the word server. (Check out the server concept page to learn more about this.)

As mentioned above, a server is a physical machine, an actual computer, but in the Cloud era that could also be a virtual computer, generally called a VM (Virtual Machine)(https://en.wikipedia.org/wiki/Virtual_machine) or container.(https://www.cio.com/article/247005/what-are-containers-and-why-do-you-need-them.html)

Readme:
Wikipedia page about web server(https://en.wikipedia.org/wiki/Web_server)
Web server(https://developer.mozilla.org/en-US/docs/Learn/Common_questions/Web_mechanics/What_is_a_web_server)
What is a Web Server?(https://developer.mozilla.org/en-US/docs/Learn/Common_questions/Web_mechanics/What_is_a_web_server)

NETWORK BASICS
Networking is a big part of what made computers so powerful and why the Internet exists. It allows machines to communicate with each other.

What is a protocol(https://www.techtarget.com/searchnetworking/definition/protocol)
What is an IP address(https://computer.howstuffworks.com/internet/basics/what-is-an-ip-address.htm)
What is TCP/IP(https://www.avast.com/c-what-is-tcp-ip#)
What is an Internet Protocol (IP) port?(https://www.lifewire.com/port-numbers-on-computer-networks-817939)

LOAD BALANCER
Ever wonder how Facebook, Linkedin, Twitter and other web giants are handling such huge amounts of traffic? They don’t have just one server, but tens of thousands of them. In order to achieve this, web traffic needs to be distributed to these servers, and that is the role of a load-balancer.
Readme:
Load-balancing(https://www.thegeekstuff.com/2016/01/load-balancer-intro/)
Load-balancing algorithms(https://community.f5.com/t5/technical-articles/intro-to-load-balancing-for-developers-the-algorithms/ta-p/273759)

SERVER
Servers are located in datacenters which are buildings that host hundreds, or even thousands of computers (servers). You can think of a server as a computer without a keyboard, mouse, or screen, that is accessible only by a network. A server can be physical or virtual. A server runs an OS (operating system).

Read:

What is a server(https://en.wikipedia.org/wiki/Server_(computing)#Hardware_requirement)
Watch:

What is a server(https://www.youtube.com/watch?v=B1ANfsDyjeA&ab_channel=TechnologyProfession)
Where are servers hosted (data centers)(https://www.youtube.com/watch?t=33&v=iuqXFC_qIvA&feature=youtu.be&ab_channel=internet-class)
Do not mix up server and web server. (Check out the web server concept page to know more about this.)

What is a database(https://www.oracle.com/ke/database/what-is-database/)
What’s the difference between a web server and an app server?(https://www.infoworld.com/article/2077354/app-server-web-server-what-s-the-difference.html)
DNS record types(https://www.site24x7.com/learn/dns-record-types.html)
Single point of failure(https://avinetworks.com/glossary/single-point-of-failure/)
How to avoid downtime when deploying new code(https://softwareengineering.stackexchange.com/questions/35063/how-do-you-update-your-production-codebase-database-schema-without-causing-downt#answers-header)
High availability cluster (active-active/active-passive)(https://docs.oracle.com/cd/E17904_01/core.1111/e10106/intro.htm#ASHIA712)
What is HTTPS(https://www.instantssl.com/http-vs-https)
What is a firewall(https://www.webopedia.com/definitions/firewall/)









Requirements
General
A README.md file, at the root of the folder of the project, is mandatory
For each task, once you are done whiteboarding (on a whiteboard, piece of paper or software or your choice), take a picture/screenshot of your diagram
This project will be manually reviewed:
As each task is completed, the name of that task will turn green
Upload a screenshot, showing that you completed the required levels, to any image hosting service (I personally use imgur but feel free to use anything you want).
For the following tasks, insert the link from of your screenshot into the answer file
After pushing your answer file to GitHub, insert the GitHub file link into the URL box
You will also have to whiteboard each task in front of a mentor, staff or student - no computer or notes will be allowed during the whiteboarding session
Focus on what you are being asked:
Cover what the requirements mention, we will explore details in a later project
Keep in mind that you will have 30 minutes to perform the exercise, you will get points for what is asked in requirements
Similarly in a job interview, you should answer what the interviewer asked for, be careful about being too verbose - always ask the interviewer if going into details is necessary - speaking too much can play against you
In this project, again, avoid going in details if not asked
