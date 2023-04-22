// /*jslint es6:true*/

const dragArea = document.querySelector('.drag-area');
const dragText = document.querySelector('.header');

let button = document.getElementById('bob');

let input = document.querySelector('input');

let file;


// button.onclick = () =>{    
//     input.click();
// };

$('.file-upload').on('click', function (e) {
    e.preventDefault();
    $('#file').trigger('click');
});
//when browse is clicked:

input.addEventListener('change', function () {
    file = this.files[0];
    dragArea.classList.add('active');
    displayFile();

})

//when file is inside the drag area
dragArea.addEventListener('dragover', (event) => {
    event.preventDefault();
    dragText.textContent = 'Release to Upload';
    dragArea.classList.add('active');
    console.log('File is inside the drag area');
});

//when file leaves drag area

dragArea.addEventListener('dragleave', () => {
    dragText.textContent = 'Drag & Drop';
    dragArea.classList.remove('active');
    //  console.log('File left the drag area');
});

//when the file is dropped
dragArea.addEventListener('drop', (event) => {
    event.preventDefault();
    file = event.dataTransfer.files[0];
    //console.log(file);
    displayFile();
});


function displayFile() {
    let filetype = file.type;
    let validExtensions = ['image/jpeg', 'image/jpg', 'image/png', 'application/pdf'];

    if (validExtensions.includes(filetype)) {
        let fileReader = new FileReader();
        fileReader.onload = () => {
            let fileURL = fileReader.result;
            let imgTag = `<img src = "${fileURL}" alt = "">`;
            dragArea.innerHTML = imgTag;
        };

        fileReader.readAsDataURL(file);
    }
    else {
        alert('This file is not an Image!');
        dragArea.classList.remove('active');

    }

}
//  console.log('File is dropped');





function generateBarCode() {
    var nric = $('#text').val();
    var url = 'https://api.qrserver.com/v1/create-qr-code/?data=' + nric + '&amp;size=50x50';
    $('#barcode').attr('src', url);
}

