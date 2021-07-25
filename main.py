from flask import Flask,jsonify
from flask import request

app = Flask(__name__)


@app.route('/connect_node/', methods=['GET'])
def connect_node():
    drow_edge(request.args.get('from'), request.args.get('to'))
    return {'message': 'connected success'}


@app.route('/get_shortest_path/', methods=['GET'])
def get_shortest_path():
    return jsonify({'shortest-path': BFS_SP(graph, request.args.get('from'), request.args.get('to'))})


# Python implementation to find the
# shortest path in the graph using
# dictionaries

# Function to find the shortest
# path between two nodes of a graph
def BFS_SP(graph, start, goal):
    explored = []

    # Queue for traversing the
    # graph in the BFS
    queue = [[start]]

    # If the desired node is
    # reached
    if start == goal:
        print("Same Node")
        return

    # Loop to traverse the graph
    # with the help of the queue
    while queue:
        path = queue.pop(0)
        node = path[-1]

        # Condition to check if the
        # current node is not visited
        if node not in explored:
            neighbours = graph[node]

            # Loop to iterate over the
            # neighbours of the node
            for neighbour in neighbours:
                new_path = list(path)
                new_path.append(neighbour)
                queue.append(new_path)

                # Condition to check if the
                # neighbour node is the goal
                if neighbour == goal:
                    print("Shortest path = ", new_path)
                    return new_path
            explored.append(node)

    # Condition when the nodes
    # are not connected
    print("So sorry, but a connecting" \
          "path doesn't exist :(")
    return


def drow_edge(frm, to):
    if frm in graph:
        graph[frm] = graph[frm] + [to]
    else:
        graph[frm] = [to]


# Driver Code
if __name__ == "__main__":
    # Graph using dictionaries
    graph = {}
    app.run(host='0.0.0.0', port=105)
