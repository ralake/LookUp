function show(elementID) {
  var element = document.getElementById(elementID);
  if (!element) {
    alert("no such element");
    return;
  }
  
  var pages = document.getElementsByClassName('page');
  for(var i = 0; i < pages.length; i++) {
    pages[i].style.display = 'none';
  }

  element.style.display = 'block';

}