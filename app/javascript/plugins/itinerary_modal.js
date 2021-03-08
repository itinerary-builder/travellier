const itineraryModal = () => {
	const triggers = document.querySelectorAll(".modal-trigger")

	triggers.forEach(trigger => {
		trigger.addEventListener("click", e => {
			const id = e.target.dataset.placeId;
			const photo = e.target.dataset.photoKey;
			const description = e.target.dataset.description;
			const place_name = e.target.dataset.placeName;
			const place_link = e.target.dataset.placeUrl;
			document.querySelector("#modal-place-name").innerHTML = place_name;
			document.querySelector("#modal-img").src = photo;
			document.querySelector("#modal-place-description").innerHTML = description;
			document.querySelector("#modal-place-id").value = id;
			document.querySelector("#modal-place-url").href = place_link;
		})

	})
};

export default itineraryModal;