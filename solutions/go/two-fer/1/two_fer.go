
package twofer

import "fmt"
// outputs "One for <some_name>, one for me." if the name is known, and the word "you" otherwise
func ShareWith(name string) string {
	var word string = "you"
	if name != "" {
		word = name
	}
	
	return fmt.Sprintf("One for %s, one for me.", word)
}
