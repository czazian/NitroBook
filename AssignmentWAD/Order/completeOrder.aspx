<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="completeOrder.aspx.cs" Inherits="AssignmentWAD.Order.completeOrder" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href='https://fonts.googleapis.com/css?family=Poppins' rel='stylesheet'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css"
        integrity="sha512-YWzhKL2whUzgiheMoBFwW8CKV4qpHQAEuvilg9FAn5VJUDwKZZxkJNuGM4XkWuk94WCrrwslk8yWNGmY1EduTA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <link href="reset.css" rel="stylesheet">
    <link href="completeOrder.css" rel="stylesheet">
    <title>Checkout</title>
    <link rel="icon" type="image/x-icon" href="/image/window-logo.png">
</head>

<body>
    <div class="container-fluid">
        <div>
            <div class="animation">

                <div class="icon-animated icon-animated-tick" tabindex="-1" aria-hidden="true">
                    <svg class="circle" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100">
                        <circle cx="50" cy="50" r="50" />
                    </svg>

                    <div class="tick">
                        <svg class="tick-leg1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 25 52">
                            <polygon class="" points="1,41 0,48 25,52 25,45" />
                        </svg>
                        <svg class="tick-leg2" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 25 52">
                            <polygon class="" points="18,45 25,47 25,0 18,0" />
                        </svg>
                    </div>
                </div>

            </div>
        </div>
        <div class="thx">
            <div class="thank-msg">
                Thank You!
            </div>
            <div class="order-msg">
                Your order has been succesfully placed, and we have received your order.
            </div>
        </div>
        <form runat="server" id="form1" class="link">
        <div class="id">
            <div class="tran-title">
                Transaction ID: #
            </div>
            <div class="tran-id">
                &nbsp;<asp:Label ID="lblTraxID" runat="server" Text="MY100"></asp:Label>
            </div>
        </div>
        <div class="estimate">
            <div class="estimate-title">
                Estimated date to reach:&nbsp;
            </div>
            <div class="date">
                <asp:Label ID="lblDate" runat="server" Text="25/12/2023"></asp:Label>
            </div>
        </div>
            <asp:Button CssClass="btn" ID="btnCheckOrderStatus" runat="server" Text="Back to Homepage" OnClick="btnCheckOrderStatus_Click" />
        </form>
    </div>
</body>

<script type="text/javascript">
    const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]');
    const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl));
</script>

</html>
