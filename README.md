Ventrilo Server Status
======================

Ventrilo Server Status is basically a webscraper that scrapes the default ventrilo server status website (http://www.ventrilo.com/status.php) and it will collect information about a ventrilo server and return in a array of objects or print out in STDOUT.

Gem Installation
================

The following will build the gem to be used:

	gem build ./vent_status.gemspec

Then the following will install the gem to be used:

	gem install ./vent_status-0.0.1.gem

If installation fails please check version number (0.0.1 on the .gem file) and update accordingly.

Gem Usage
=========

First you have to install the gem so look above!

Now you can use the gem. Listed before is the simple usage of the gem.

	require 'vent_status'

	# Returns all information (Server and Players for now)
	Vent_Status.full_status('<hostname>', '<port>')

	# Returns Server Information
	Vent_Status.server('<hostname>', '<port>')

	# Returns Player Information
	Vent_Status.players('<hostname>', '<port>')

Example:

	require 'vent_status'

	# Returns all information (Server and Players for now)
	Vent_Status.full_status('notarealvent.typefrag.com', '55555')

	# Returns Server Information
	Vent_Status.server('notarealvent.typefrag.com', '55555')

	# Returns Player Information
	Vent_Status.players('notarealvent.typefrag.com', '55555')

Command Line Usage
==================

In a command line call the following line:

	ruby ./vent_status.rb <hostname> <port>

Example:

	ruby ./vent_status.rb notarealvent.typefrag.com 55555

The results will be printed in STDOUT

License
=======

See LICENSE for more information