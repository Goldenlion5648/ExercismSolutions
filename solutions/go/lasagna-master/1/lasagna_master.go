package lasagna

// TODO: define the 'PreparationTime()' function
func PreparationTime(layers []string, prep_time int) (estimate int) {
	if prep_time == 0 {
		prep_time = 2
	}
	return prep_time * len(layers)
}

// TODO: define the 'Quantities()' function
func Quantities(layers []string) (noodles int, sauce float64) {
	for _, layer_name := range layers {
		switch layer_name {
		case "noodles":
			noodles += 50
		case "sauce":
			sauce += 0.2
		}
	}
	return noodles, sauce
}

// TODO: define the 'AddSecretIngredient()' function
func AddSecretIngredient(friendsList, mine []string) {
	mine[len(mine)-1] = friendsList[len(friendsList)-1]
}

// TODO: define the 'ScaleRecipe()' function
func ScaleRecipe(amounts []float64, portion_count int) ([]float64) {
	needed := make([]float64, len(amounts))
	for i := range amounts {
		needed[i] = amounts[i] * (float64(portion_count) / float64(2.0))
	}
	return needed 
}

// Your first steps could be to read through the tasks, and create
// these functions with their correct parameter lists and return types.
// The function body only needs to contain `panic("")`.
//
// This will make the tests compile, but they will fail.
// You can then implement the function logic one by one and see
// an increasing number of tests passing as you implement more
// functionality.
