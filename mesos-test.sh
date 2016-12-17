#!/bin/bash -

# Change into build directory.
cd build

# Start mesos master (Ensure work directory exists and has proper permissions).
./bin/mesos-master.sh --ip=127.0.0.1 --work_dir=/var/lib/mesos

# Start mesos agent (Ensure work directory exists and has proper permissions).
./bin/mesos-agent.sh --master=127.0.0.1:5050 --work_dir=/var/lib/mesos

# Visit the mesos web page.
# http://127.0.0.1:5050

# Run C++ framework (Exits after successfully running some tasks.).
./src/test-framework --master=127.0.0.1:5050

# Run Java framework (Exits after successfully running some tasks.).
./src/examples/java/test-framework 127.0.0.1:5050

# Run Python framework (Exits after successfully running some tasks.).
./src/examples/python/test-framework 127.0.0.1:5050
