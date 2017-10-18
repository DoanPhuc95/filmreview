function auto_expand()
{
   const textarea = document.getElementById("description-txt");
   textarea.style.height = '77px';
   const contentHeight = document.getElementById("description-txt").scrollHeight;
   textarea.style.height = contentHeight + 'px';
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