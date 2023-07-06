Networking basics #0

OSI model(https://en.wikipedia.org/wiki/OSI_model)
Different types of network(https://www.lifewire.com/lans-wans-and-other-area-networks-817376)
LAN network(https://en.wikipedia.org/wiki/Local_area_network)
WAN network(https://en.wikipedia.org/wiki/Wide_area_network)
Internet(https://en.wikipedia.org/wiki/Internet)
MAC address(https://whatismyipaddress.com/mac-address)
What is an IP address(https://www.bleepingcomputer.com/tutorials/ip-addresses-explained/)
Private and public address(https://www.iplocation.net/public-vs-private-ip-address)
IPv4 and IPv6(https://www.webopedia.com/insights/ipv6-ipv4-difference/)
Localhost(https://en.wikipedia.org/wiki/Localhost)
TCP and UDP(https://www.howtogeek.com/190014/htg-explains-what-is-the-difference-between-tcp-and-udp/)
TCP/UDP ports List(https://en.wikipedia.org/wiki/List_of_TCP_and_UDP_port_numbers)
What is ping /ICMP(https://en.wikipedia.org/wiki/Ping_%28networking_utility%29)
Positional parameters(https://wiki.bash-hackers.org/scripting/posparams)

OSI Model
What it is
How many layers it has
How it is organized
What is a LAN
Typical usage
Typical geographical size
What is a WAN
Typical usage
Typical geographical size
What is the Internet
What is an IP address
What are the 2 types of IP address
What is localhost
What is a subnet
Why IPv6 was created
TCP/UDP
What are the 2 mainly used data transfer protocols for IP (transfer level on the OSI schema)
What is the main difference between TCP and UDP
What is a port
Memorize SSH, HTTP and HTTPS port numbers
What tool/protocol is often used to check if a device is connected to a network

The second line of all your Bash scripts should be a comment explaining what is the script doing

For multiple choice question type tasks, just type the number of the correct answer in your answer file, add a new line for every new answer, example:

What is the most important position in a software company?

Project manager
Backend developer
System administrator

0. OSI (Open Systems Interconnection) is an abstract model to describe layered communication and computer network design. The idea is to segregate the different parts of what make communication possible.

It is organized from the lowest level to the highest level:

The lowest level: layer 1 which is for transmission on physical layers with electrical impulse, light or radio signal
The highest level: layer 7 which is for application specific communication like SNMP for emails, HTTP for your web browser, etc
Keep in mind that the OSI model is a concept, it’s not even tangible. The OSI model doesn’t perform any functions in the networking process. It is a conceptual framework so we can better understand complex interactions that are happening. Most of the functionality in the OSI model exists in all communications systems.
In this project we will mainly focus on:

The Transport layer and especially TCP/UDP
On the Network layer with IP and ICMP
The image bellow describes more concretely how you can relate to every level.

Questions:

What is the OSI model?

Set of specifications that network hardware manufacturers must respect
The OSI model is a conceptual model that characterizes the communication functions of a telecommunication system without regard to their underlying internal structure and technology
The OSI model is a model that characterizes the communication functions of a telecommunication system with a strong regard for their underlying internal structure and technology
How is the OSI model organized?

Alphabetically
From the lowest to the highest level
Randomly

1. LAN connect local devices together, WAN connects LANs together, and WANs are operating over the Internet.

Questions:

What type of network a computer in local is connected to?

Internet
WAN
LAN
What type of network could connect an office in one building to another office in a building a few streets away?

Internet
WAN
LAN
What network do you use when you browse www.google.com from your smartphone (not connected to the Wifi)?

Internet
WAN
LAN

2. Questions:

What is a MAC address?

The name of a network interface
The unique identifier of a network interface
A network interface
What is an IP address?

Is to devices connected to a network what postal address is to houses
The unique identifier of a network interface
Is a number that network devices use to connect to networks

3. Let’s fill the empty parts in the drawing above.

Questions:

Which statement is correct for the TCP box:
It is a protocol that is transferring data in a slow way but surely
It is a protocol that is transferring data in a fast way and might loss data along in the process
Which statement is correct for the UDP box:
It is a protocol that is transferring data in a slow way but surely
It is a protocol that is transferring data in a fast way and might loss data along in the process
Which statement is correct for the TCP worker:
Have you received boxes x, y, z?
May I increase the rate at which I am sending you boxes?

4. Once packets have been sent to the right network device using IP using either UDP or TCP as a mode of transportation, it needs to actually enter the network device.

If we continue the comparison of a network device to your house, where IP address is like your postal address, UDP and TCP ports are like the windows and doors of your place. A TCP/UDP network device has 65535 ports. Some of them are officially reserved for a specific usage, some of them are known to be used for a specific usage (but nothing is officially declared) and the rest are free of use.

While the full list of ports should not be memorized, it is important to know the most used ports, let’s start by remembering 3 of them:

22 for SSH
80 for HTTP
443 for HTTPS
Note that a specific IP + port = socket.(https://stackoverflow.com/questions/152457/what-is-the-difference-between-a-port-and-a-socket)

Write a Bash script that displays listening ports:

That only shows listening sockets
That shows the PID and name of the program to which each socket belongs

5. The Internet Control Message Protocol (ICMP) is a protocol in the Internet protocol suite. It is used by network devices, to check if other network devices are available on the network. The command ping uses ICMP to make sure that a network device remains online or to troubleshoot issues on the network.

Write a Bash script that pings an IP address passed as an argument.

Requirements:

Accepts a string as an argument
Displays Usage: 5-is_the_host_on_the_network {IP_ADDRESS} if no argument passed
Ping the IP 5 times
