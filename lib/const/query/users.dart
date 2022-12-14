String userList = """
query userList(\$first:Int!,\$after: String!) {
	users(first: \$first, after: \$after) {
		totalCount
		pageInfo {
			endCursor
			hasNextPage
			hasPreviousPage
			endCursor
			startCursor
		}
		nodes{
			email
				id
				name
				email
				gender
				status
		}
	}
}
""";