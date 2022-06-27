let counter=0;
const catbtn= document.querySelector("#addCategory")
catbtn.addEventListener("click", addCategory())

function addCategory(event){
    event.preventDefault()
    const div= document.createElement("DIV")
    div.innerHTML= `<input type="text" value="Lifestyle" name="post[categories_attributes][${counter}][name]"
     id="post_categories_attributes_${counter}_name">`
     nestedFOrm=document.querySelector(".nested-form")
     nestedFOrm.append(div)
     counter++

}