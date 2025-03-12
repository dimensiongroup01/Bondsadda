$('.tab-link').click( function() {
	
	var tabID = $(this).attr('data-tab');
	
	$(this).addClass('active').siblings().removeClass('active');
	
	$('#tab-'+tabID).addClass('active').siblings().removeClass('active');
});




// ============== toggle accordion =================//
let header = document.querySelectorAll(".accordion-header");

// ============= get all accoridon header =============//
header.forEach(
  (header) => {
    header.addEventListener("click", function (e) {
      let accordion = document.querySelectorAll(".accordion");
      let parentElm = header.parentElement;
      let siblings = this.nextElementSibling;

      // ============= remove accordion body height ==========//
      accordion.forEach((element) => {
        element.children[1].style.maxHeight = null;
      });

      // =========== toggle active class ==============//
      parentElm.classList.toggle("active");
      if (parentElm.classList.contains("active")) {
        // ============== remove active class from all the accordions ===//
        accordion.forEach((element) => {
          element.classList.remove("active");
        });
        // ============== toggle active class where we clicked ========//

    parentElm.classList.toggle("active");
        // ============= set max height ============//
        if (siblings.style.maxHeight) {
          siblings.style.maxHeight = null;
        } else {
          siblings.style.maxHeight = siblings.scrollHeight + "px";
        }
      }
    });
  }
);


window.onload = function(){
header[0].click();
}