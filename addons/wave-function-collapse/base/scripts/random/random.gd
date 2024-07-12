class_name RandomDist

# func _ready():
#     var probabilities = [0.1, 0.3, 0.4, 0.2]  # Example probabilities
#     var index = random_index_from_distribution(probabilities)
#     print("Selected index: ", index)

static func rand_dist(probabilities: Array):
    var cumulative_distribution = []
    var cumulative_sum = 0.0

    # Create cumulative distribution array
    for p in probabilities:
        cumulative_sum += p
        cumulative_distribution.append(cumulative_sum)

    # Generate a random number between 0 and 1
    var random_value = randf()

    # Find the index corresponding to the random value
    for i in range(cumulative_distribution.size()):
        if random_value < cumulative_distribution[i]:
            return i

    # Fallback in case of numerical issues (shouldn't normally reach here)
    return cumulative_distribution.size() - 1
