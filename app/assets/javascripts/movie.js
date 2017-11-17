function auto_expand()
{
   const textarea = document.getElementById("description-txt");
   if(textarea != null)
   {
      textarea.style.height = '77px';
      const contentHeight = document.getElementById("description-txt").scrollHeight;
      textarea.style.height = contentHeight + 'px';
      $(document).scrollTop($(document).height());
   }
}

function choose_movie_image() 
{
   event.preventDefault();
   $("#movie_image").trigger("click");   
}

function show_image()
{
   if(event.target.files && event.target.files[0])
   {
      const reader = new FileReader();
      reader.onload = function() {
         $("#img_movie").attr('src', event.target.result);
      }
      reader.readAsDataURL(event.target.files[0]);
   }
}

function show_menu()
{
   $("#menu").toggle();
}

$( document ).on('turbolinks:load', function() {
 auto_expand();
 $(document).scrollTop(0);
})