$(document).ready(function() {

    const $hamburger = $("#hamburger");
    const $mainMenu = $(".main__menu");
    const $body = $("body"); // Usa jQuery per il body

    // --- Hamburger Menu Toggle ---
    $hamburger.click(function() {
        // Controlla la classe sul menu stesso, è più affidabile
        if ($mainMenu.hasClass("active")) {
            $hamburger.removeClass("hamburger-open");
            $mainMenu.removeClass("active");
            $body.removeClass("scroll_block"); // Usa $body.removeClass
        } else {
            $hamburger.addClass("hamburger-open");
            $mainMenu.addClass("active");
            $body.addClass("scroll_block"); // Usa $body.addClass
        }
    });

    // Chiudi il menu se si clicca fuori (sul contenuto principale)
    $('.main__content').on('click', function(e) {
        if ($mainMenu.hasClass("active")) {
             // Controlla se il click non è sull'hamburger stesso
             if (!$(e.target).closest('#hamburger').length) {
                 $hamburger.removeClass("hamburger-open");
                 $mainMenu.removeClass("active");
                 $body.removeClass("scroll_block");
             }
        }
    });


    // --- Accordion for Nav Titles (se necessario, altrimenti rimuovi) ---
    // $(".nav--title").click(function() {
    //     $(this).parent().toggleClass("active");
    // });

    // --- Image Preloader ---
    var $preloadOverlay = $('.preload');
    var $loadingText = $('#loadingText');
    var $images = $("img"); // Seleziona tutte le immagini
    var totalImages = $images.length;
    var imagesLoaded = 0;

    // Funzione per aggiornare il contatore e nascondere il preloader
    function imageLoaded() {
        imagesLoaded++;
        var percentage = totalImages > 0 ? Math.round((imagesLoaded / totalImages) * 100) : 100;
        $loadingText.text(percentage + '%');
        // console.log(`Loaded: ${imagesLoaded}/${totalImages} (${percentage}%)`); // Debug

        if (imagesLoaded >= totalImages) {
            // Aggiungi un piccolo ritardo prima di nascondere per mostrare il 100%
            setTimeout(function() {
                // $preloadOverlay.fadeOut(500); // Usa fadeOut di jQuery
                 $preloadOverlay.addClass('hidden'); // O usa classe per transizione CSS
            }, 300); // Ritardo di 300ms
        }
    }

    // Controlla immagini già caricate nella cache
    if (totalImages === 0) {
         // Nessuna immagine da caricare
         $loadingText.text('100%');
         setTimeout(function() { $preloadOverlay.addClass('hidden'); }, 100); // Nascondi subito
    } else {
         $images.each(function() {
             // Trucco per forzare il re-check dello stato 'complete'
             var $img = $(this);
             if (this.complete || (typeof this.naturalWidth !== "undefined" && this.naturalWidth > 0)) {
                 // Immagine già caricata (cache)
                 // console.log(`Image already loaded: ${this.src}`); // Debug
                 imageLoaded();
             } else {
                 // Aggiungi listener per 'load' e 'error'
                 $img.on('load', imageLoaded).on('error', function() {
                     console.error(`Could not load image: ${this.src}`);
                     imageLoaded(); // Conta anche le immagini fallite per non bloccare il preloader
                 });
             }
         });
    }


    // --- Instant Scroll Navigation & Close Mobile Menu ---
    const links = document.querySelectorAll("a.item-content[href^='#']"); // Seleziona solo link interni

    for (const link of links) {
        link.addEventListener("click", clickHandler);
    }

    function clickHandler(e) {
        e.preventDefault(); // Previene il comportamento di default del link

        // **MODIFICA: Usa this.hash per ottenere l'ID direttamente**
        const selector = this.hash; // Ottiene direttamente "#section_X"

        // Controlla se abbiamo un selettore valido (che inizia con #)
        if (selector && selector.startsWith('#')) {
            const targetElement = document.querySelector(selector);

            if (targetElement) {
                // Calcola la posizione considerando l'offset dell'header mobile (se visibile)
                let offset = 0;
                const mobileHeader = document.getElementById('mobile');
                // Controlla se l'header mobile è visibile (display non è 'none')
                if (window.getComputedStyle(mobileHeader).display !== 'none') {
                    offset = mobileHeader.offsetHeight; // Altezza dell'header mobile
                }
                offset += 20; // Aggiungi un piccolo spazio extra

                const elementPosition = targetElement.getBoundingClientRect().top + window.pageYOffset; // Posizione assoluta dell'elemento
                const offsetPosition = elementPosition - offset;

                // Esegui lo scroll ISTANTANEO
                window.scrollTo({
                    top: offsetPosition,
                    behavior: "auto" // Scorrimento immediato
                });

                // Aggiorna manualmente l'highlight subito dopo lo scroll istantaneo
                updateActiveLink();

            } else {
                console.warn("Target element not found for selector:", selector);
            }
        } else {
             console.error("Could not extract a valid selector (starting with #) from href:", this.href);
        }


        // Chiudi il menu mobile (se aperto) dopo il click
        if ($mainMenu.hasClass("active")) {
            $hamburger.removeClass("hamburger-open");
            $mainMenu.removeClass("active");
            $body.removeClass("scroll_block");
        }
    }


    // --- Scroll Highlighting ---
    var $menuLinks = $('.nav--list li a.item-content'); // Usa jQuery per i link
    var $sections = $('.section'); // Usa jQuery per le sezioni

    function updateActiveLink() {
        var scrollDistance = $(window).scrollTop();
        var windowHeight = $(window).height();
        var documentHeight = $(document).height();

        // Determina l'offset in base all'header mobile
        let highlightOffset = 20; // Offset base
        const mobileHeader = document.getElementById('mobile');
        if (window.getComputedStyle(mobileHeader).display !== 'none') {
            highlightOffset += mobileHeader.offsetHeight;
        }
        highlightOffset += 50; // Aggiungi margine extra per attivazione più in alto


        var activeSectionId = null;

        // **MODIFICA: Itera dal basso verso l'alto**
        for (let i = $sections.length - 1; i >= 0; i--) {
             const $section = $sections.eq(i); // Usa .eq() di jQuery
             const sectionTop = $section.offset().top; // Posizione top della sezione

             // Se la parte superiore della sezione è entrata nell'area di attivazione
             if (sectionTop <= scrollDistance + highlightOffset) {
                 activeSectionId = $section.attr('id'); // Ottieni l'ID della sezione attiva
                 // console.log("Active section found:", activeSectionId); // Debug
                 break; // Trovata la sezione attiva (la prima dal basso), esci dal loop
             }
         }

         // Caso speciale: Siamo molto vicini al fondo della pagina
         if (scrollDistance + windowHeight >= documentHeight - 20) { // 20px di tolleranza dal fondo
              const $lastSection = $sections.last();
              if ($lastSection.length) {
                 activeSectionId = $lastSection.attr('id'); // Forza l'ultima sezione come attiva
                 // console.log("Near bottom, forcing last section:", activeSectionId); // Debug
              }
         }

        // Rimuovi la classe 'active' da tutti i link e aggiungila a quello corrispondente
        $menuLinks.removeClass('active');
        if (activeSectionId) {
            // Trova il link il cui href termina con # + ID della sezione attiva
            $menuLinks.filter(`[href$='#${activeSectionId}']`).addClass('active');
        } else {
             // Se siamo sopra la prima sezione, potresti voler attivare il primo link
             // $menuLinks.first().addClass('active');
        }
    }

    // Lega la funzione all'evento scroll della finestra (con debounce per performance)
    var scrollTimeout;
    $(window).on('scroll', function() {
        clearTimeout(scrollTimeout);
        scrollTimeout = setTimeout(updateActiveLink, 50); // Esegui solo dopo 50ms di inattività scroll
    });

    // Esegui la funzione una volta al caricamento per impostare lo stato iniziale
    updateActiveLink();

}); // Fine di $(document).ready()