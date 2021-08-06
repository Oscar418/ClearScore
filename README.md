Approach
- Used postman to hit the API provided before actually creating a new xcode project
- Thought about what architectural pattern to use
- Thought what would be best to test so I meet the requirements
- Created a public repo
- Then started coding

Assumptions
- Before fully reading the requirements I thought I was going to use Alamofire to make API calls since I am so used to using that
- And also thought I would have to use Swinject
- Thought the Json would be more complicated

Decisions
- I started the project in VIPER but noticed it was over kill, so went with a simpler architectural pattern
- For once I decided to test IBOutlets, can't say how many times apps I have worked on crashed because of missing connections

What I would have done better
- If I had more time I would unit test API response instead of just using the json included in the project
- I would add a scrollview for the details screen
- Used stackviews instead of forcing width for labels on details screen
- Should have made the circle on the dashboard a more reusable nib