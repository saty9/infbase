<template>
	<a class="btn" v-if="courses">
		<badge v-for="course in all_courses" :type="courses.includes(course) ? 'success' : 'danger text-muted'">
			{{course}}
		</badge>
	</a>
</template>

<script>
	export default {
		props: {
			session: {
				type: Object,
				default: {},
				description: "Arrays of the session in this slot"
			}
		},
		data() {
			return {
				date: this.session.date,
				time: this.session.time,
				tutor: this.session.tutor,
				courses: this.session.tutor.courses,
				all_courses: ["CogSci", "DA", "OP", "Inf2B", "Inf2D"]
			}
		}
	}
</script>

<style>
	
</style>