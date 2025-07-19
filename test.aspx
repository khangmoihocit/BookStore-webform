<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="btl_laptrinhweb.test" %>

    <!DOCTYPE html>

    <html xmlns="http://www.w3.org/1999/xhtml">

    <head runat="server">
        <title></title>
    </head>

    <body>
        <form id="form1" runat="server">
            <div>
                <div class="form-group">
                    <label for="name">name</label>
                    <input name="name" id="name" type="text" />
                    <span id="messageError" value=""></span>
                    <button id="btn" type="button">button</button>
                </div>
            </div>
        </form>
    </body>

    <script>
        const inputName = document.getElementById("name");
        const btn = document.getElementById('btn');
        const isValid = () => {
            //(.[a-z]{2,})+  : đoạn này được lặp 1 hoặc nhiều lần
            let regex = /^[a-zA-Z0-9_]+@[a-zA-Z0-9_]+(.[a-z]{2,})+$/;
            return regex.test(inputName.value);
        }

        btn.addEventListener("click", () => {
            if (!isValid()) {
                document.getElementById('messageError').innerHTML = "sai định dạng";
            } else {
                document.getElementById('messageError').innerHTML = "đúng";
            }
        });


    </script>

    </html>