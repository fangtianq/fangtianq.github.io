document.addEventListener("page:loaded",(()=>{document.querySelectorAll(".post-body :not(a) > img, .post-body > img").forEach((t=>{const a=$(t);const e=a.attr("data-src")||a.attr("src");const r=a.wrap(`<a class="fancybox fancybox.image" href="${e}" itemscope itemtype="http://schema.org/ImageObject" itemprop="url"></a>`).parent("a");if(a.is(".post-gallery img")){r.attr("data-fancybox","gallery").attr("rel","gallery")}else if(a.is(".group-picture img")){r.attr("data-fancybox","group").attr("rel","group")}else{r.attr("data-fancybox","default").attr("rel","default")}const o=a.attr("title")||a.attr("alt");if(o){if(!r.next("figcaption").length){r.append(`<p class="image-caption">${o}</p>`)}r.attr("title",o).attr("data-caption",o)}}));$.fancybox.defaults.hash=false;$(".fancybox").fancybox({loop:true,helpers:{overlay:{locked:false}}})}));