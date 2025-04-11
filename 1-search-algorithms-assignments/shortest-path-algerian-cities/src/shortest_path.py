import osmnx as ox
import networkx as nx
import folium
import webbrowser
import json
import os


project_root = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

def load_map_data():
    
    print("Loading map data...")
    place = "Algiers, Algeria"  
    graph = ox.graph_from_place(place, network_type="drive")
    print("Map data loaded successfully!")
    
    return graph


def find_shortest_path(graph, start_node, goal_node):
    
    print("Finding shortest path...")
    shortest_path = nx.astar_path(graph, start_node, goal_node, weight="length")
    print("Shortest path found!")
    
    return shortest_path


def create_interactive_map():
    
    print("Creating interactive map for point selection...")
    map_template_path = os.path.join(project_root, "templates", "algeria_map.html")
    
    webbrowser.open(f"http://localhost:8000/templates/algeria_map.html")
    
    
def get_user_points():
    
    print("Please select the start and end points on the map.")
    input("After selecting the points, save the markers and press Enter to continue...")
    markers_path = os.path.join(project_root, "data", "markers.json")
    if not os.path.exists(markers_path):
        print("Error: markers.json not found. Did you save the markers and move them to the 'data' folder?")
        exit(1)
    with open(markers_path, "r") as f:
        markers = json.load(f)
    start_coords = (markers[0]["geometry"]["coordinates"][1], markers[0]["geometry"]["coordinates"][0])
    end_coords = (markers[1]["geometry"]["coordinates"][1], markers[1]["geometry"]["coordinates"][0])
    print(f"Start Point: {start_coords}")
    print(f"End Point: {end_coords}")
    
    return start_coords, end_coords

def find_nearest_nodes(graph, start_coords, end_coords):
    
    start_node = ox.distance.nearest_nodes(graph, start_coords[1], start_coords[0])
    end_node = ox.distance.nearest_nodes(graph, end_coords[1], end_coords[0])
    
    return start_node, end_node

def visualize_path_interactive(graph, shortest_path, start_coords, end_coords):
    
    print("Visualizing the shortest path on an interactive map...")
    m = folium.Map(location=[36.7525, 3.04197], zoom_start=12)  
    folium.Marker(start_coords, popup="Start").add_to(m)
    folium.Marker(end_coords, popup="End").add_to(m)
    path_coords = [(graph.nodes[node]['y'], graph.nodes[node]['x']) for node in shortest_path]
    folium.PolyLine(path_coords, color="blue", weight=2.5, opacity=1).add_to(m)
    results_path = os.path.join(project_root, "results", "shortest_path_map.html")
    m.save(results_path)
    print(f"Interactive map with the shortest path saved as '{results_path}'!")
    
    webbrowser.open(f"http://localhost:8000/results/shortest_path_map.html")
    
    
def main():
    
    graph = load_map_data()
    create_interactive_map()
    start_coords, end_coords = get_user_points()
    start_node, end_node = find_nearest_nodes(graph, start_coords, end_coords)
    shortest_path = find_shortest_path(graph, start_node, end_node)
    visualize_path_interactive(graph, shortest_path, start_coords, end_coords)
    
if __name__ == "__main__":
    main()