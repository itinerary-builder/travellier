const itineraryModal = () => {
	const triggers = document.querySelectorAll(".modal-trigger")

	triggers.forEach(trigger => {
		trigger.addEventListener("click", e => {
			const id = e.currentTarget.dataset.placeId;
			const photo = e.currentTarget.dataset.photoKey;
			const description = e.currentTarget.dataset.description;
			const place_name = e.currentTarget.dataset.placeName;
			const place_link = e.currentTarget.dataset.placeUrl;
			document.querySelector("#modal-place-name").innerHTML = place_name;
			document.querySelector("#modal-img").src = photo;
			document.querySelector("#modal-place-description").innerHTML = description;
			document.querySelector("#modal-place-id").value = id;
			document.querySelector("#modal-place-url").href = place_link;
		})

	})
};

export default itineraryModal;