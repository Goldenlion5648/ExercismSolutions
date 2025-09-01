package birdwatcher

// TotalBirdCount return the total bird count by summing
// the individual day's counts.
func TotalBirdCount(birdsPerDay []int) int {
	ret := 0
	for i := 0; i < len(birdsPerDay); i++ {
		ret += birdsPerDay[i]
	}
	return ret
}

// BirdsInWeek returns the total bird count by summing
// only the items belonging to the given week.
func BirdsInWeek(birdsPerDay []int, week int) int {
	days_per_week := 7
	ret := 0
	for i := (week - 1) * days_per_week; i < week*days_per_week; i++ {
		ret += birdsPerDay[i]
	}
	return ret
}

// FixBirdCountLog returns the bird counts after correcting
// the bird counts for alternate days.
func FixBirdCountLog(birdsPerDay []int) []int {
	for i := 0; i < len(birdsPerDay); i+= 2 {
		birdsPerDay[i] += 1
	}
	return birdsPerDay
}
