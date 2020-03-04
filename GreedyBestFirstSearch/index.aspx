<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="GreedyBestFirstSearch.index" %>

<!DOCTYPE html>

<html lang="en">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Greedy Best First Search</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel='shortcut icon' type='image/x-icon' href='images/favicon.ico' />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.9.0/css/all.css" integrity="sha384-i1LQnF23gykqWXg6jxC2ZbCbUMxyw5gLZY6UiUS98LYV5unm8GWmfkIS6jqJfb4E" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">

    <link rel="stylesheet" href="assets/css/cs-skin-elastic.css">
    <link rel="stylesheet" href="assets/css/style.css">

    <!-- Sweetalert CSS-->
    <link href="assets/sweetalert/sweetalert2.css" rel="stylesheet" />

    <!-- Script-->
    <script defer src="https://use.fontawesome.com/releases/v5.9.0/js/all.js" integrity="sha384-7Gk1S6elg570RSJJxILsRiq8o0CO99g1zjfOISrqjFUCjxHDn3TmaWoWOqt6eswF" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/790878a58b.js"></script>
    <script async defer src="https://buttons.github.io/buttons.js"></script>

    <!-- Sweetalert Script-->
    <script src="assets/sweetalert/sweetalert2.min.js"></script>

    <script type="text/javascript">
        function success(city) {
            swal.fire({
                title: 'ค้นหาระยะทางสำเร็จ',  //สิ่งที่เปลี่ยนได้ คือหัว
                text: 'เมืองต้นทาง ' + city + ' เมืองปลายทาง Bucharest',
                type: 'success', // อันนี้คือประเภทว่าจะให้เป็นแบบไหน
                timer: 2500  // หน่วงเวลา 
            })
        }
        function errorSouce() {
            swal.fire({
                title: 'กรุณาเลือกเมืองต้นทาง !',  //สิ่งที่เปลี่ยนได้ คือหัว
                type: 'warning', // อันนี้คือประเภทว่าจะให้เป็นแบบไหน
                timer: 2000
            })
        }
    </script>
</head>
<body>
    <form id="mainform" runat="server">
        <div class="page-wrapper">
        <!-- Page -->
        <div id="right-panel" class="right-panel">
            <!-- Header-->
            <header id="header" class="header topbar">
                <div class="row">
                    <div class="col-lg-6 col-md-8 col-sm-10">
                        <img src="images/rmuti.ico" width="40px" class="Logo" />
                        <span class="TextHead">RAJAMANGALA UNIVERSITY OF TECHNOLOGY ISAN</span>
                    </div>
                    <div class="col-lg-6 col-md-4 col-sm-2  colHead">
                        <div class="user-area dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <img class="user-avatar rounded-circle TextGroup" src="images/Source Code_48px.png"><span class="TextGroup" data-toggle="tooltip" data-placement="top" title="เกี่ยวกับเรา">&ensp; CPE.59241 / GROUP</span>
                            </a>
                            <div class="user-menu dropdown-menu">
                                <a class="Textlink" href="https://www.facebook.com/tharanattim" target="_blank" data-toggle="tooltip" data-placement="right" title="59172110240-5"><i class="fab fa-facebook-square"></i>&ensp;นายธรณัส หิรัญอร</a>
                                <a class="Textlink" href="https://www.facebook.com/pipatpong.sutamwichitr" target="_blank" data-toggle="tooltip" data-placement="right" title="59172110410-9"><i class="fab fa-facebook-square"></i>&ensp;นายพิพัฒพงศ์ สุธรรมวิจิตร</a>
                                <a class="Textlink" href="https://www.facebook.com/profile.php?id=100005518995640" target="_blank" data-toggle="tooltip" data-placement="right" title="59172110525-6"><i class="fab fa-facebook-square"></i>&ensp;นายธีรพล ขอสินกลาง</a>
                            </div>
                        </div>

                    </div>
                </div>
            </header>
            <!-- /#header -->
            <!-- Content -->
            <asp:ScriptManager ID="ScriptManager1" runat="server" />
            <asp:Timer ID="Timer1" runat="server" Enabled="False" OnTick="Timer1_Tick" />
            <asp:UpdatePanel ID="greedypanal" runat="server" UpdateMode="Conditional">
                <Triggers>
                    <asp:PostBackTrigger ControlID="Timer1" />
                </Triggers>
                <ContentTemplate>
                    <div class="content">
                        <!-- Animated -->
                        <div class="animated fadeIn">
                            <!-- Topic -->
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12">
                                    <h4><b style="color: #0E3424;">GREEDY BEST FIRST SEARCH</b></h4>
                                    <span style="color: #0E3424;">ARTIFICIAL INTERLIGENCE </span>
                                    <br>
                                    &nbsp;
                                </div>
                            </div>
                            <!-- /#Topic -->
                            <!--  Main  -->
                            <div class="row">
                                <!--  Garhp  -->
                                <div class="col-lg-6">
                                    <div class="card ">
                                        <div class="card-body">
                                            <h4 class="box-title" id="lbl_path" runat="server">PATH : </h4>
                                            <asp:Image ID="imgGr" CssClass="" runat="server" ImageUrl="images/GP.png"></asp:Image>
                                        </div>
                                    </div>
                                </div>
                                <!--  /#Garhp  -->
                                <!--  RightPanel  -->
                                <div class="col-lg-6">
                                    <div class="row">
                                        <!--  Map  -->
                                        <div class="col-lg-12">
                                            <div class="card ">
                                                <div class="card-body ">
                                                    <asp:Image ID="imgMap" CssClass="mapPic"  runat="server" ImageUrl="images/MAP.png"></asp:Image>
                                                </div>
                                            </div>
                                        </div>
                                        <!--  /#Map  -->
                                        <!--  Menu  -->
                                        <div class="col-lg-12">
                                            <div class="row">
                                                <!--  Soure City  -->
                                                <div class="col-lg-6 col-md-6 col-sm-6">
                                                    <div class="card">
                                                        <div class="card-body">
                                                            <center>
                                                         <div class="row form-group" style="margin-top:14px;">
                                                            <div class="col col-md-3"><label class="form-control-label" style="margin-top:8px;">Source</label></div>
                                                            <div class="col-12 col-md-9">
                                                                <div class="input-group">
                                                             <div class="input-group-addon"><i class="fas fa-map-marked-alt"></i></div>
                                                        <asp:DropDownList runat="server" ID="ddl_Source" CssClass="form-control" data-toggle="tooltip" data-placement="bottom" title="เมืองต้นทาง">
                                                            <asp:ListItem Value="0">Select City</asp:ListItem>
                                                            <asp:ListItem Value="a">Arad</asp:ListItem>
                                                            <asp:ListItem Value="c">Craiova</asp:ListItem>
                                                            <asp:ListItem Value="d">Dobreta</asp:ListItem>
                                                            <asp:ListItem Value="e">Eforie</asp:ListItem>
                                                            <asp:ListItem Value="f">Fagaras</asp:ListItem>
                                                            <asp:ListItem Value="g">Giurgiu</asp:ListItem>
                                                            <asp:ListItem Value="h">Hirsova</asp:ListItem>
                                                            <asp:ListItem Value="i">Iasi</asp:ListItem>
                                                            <asp:ListItem Value="l">Lugoj</asp:ListItem>
                                                            <asp:ListItem Value="m">Mehadia</asp:ListItem>
                                                            <asp:ListItem Value="n">Neamt</asp:ListItem>
                                                            <asp:ListItem Value="o">Oradea</asp:ListItem>
                                                            <asp:ListItem Value="p">Pitesti</asp:ListItem>
                                                            <asp:ListItem Value="r">Rimnicu Vilcea</asp:ListItem>
                                                            <asp:ListItem Value="s">Sibu</asp:ListItem>
                                                            <asp:ListItem Value="t">Timisoara</asp:ListItem>
                                                            <asp:ListItem Value="u">Urziceni</asp:ListItem>
                                                            <asp:ListItem Value="v">Vaslui</asp:ListItem>
                                                            <asp:ListItem Value="z">Zerind</asp:ListItem>                                                      
                                                        </asp:DropDownList>
                                                            </div>
                                                            </div>
                                                        </div>
                                                    </center>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!--  /#Soure City  -->
                                                <!--  Dest City  -->
                                                <div class="col-lg-6 col-md-6 col-sm-6">
                                                    <div class="card">
                                                        <div class="card-body">
                                                            <center>
                                                         <div class="row form-group" style="margin-top:14px;">
                                                            <div class="col col-md-4"><label class="form-control-label" style="margin-top:8px;">Destination</label></div>
                                                            <div class="col-12 col-md-8">
                                                                <span data-toggle="tooltip" data-placement="bottom" title="เมืองปลายทาง">
                                                                <div class="input-group">
                                                             <div class="input-group-addon"><i class="fas fa-flag"></i></div>
                                                                <input  placeholder="Bucharest" disabled="" class="form-control">         
                                                            </div>
                                                                    </span> 
                                                            </div>
                                                        </div>
                                                    </center>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!--  /#Dest City  -->
                                                <!--  Start  -->
                                                <div class="col-lg-6 col-md-6 col-sm-6">
                                                    <div class="card">
                                                        <div class="card-body">
                                                            <center>
                                                        <div class="slidecontainer">
                                                                  <input runat="server" ID="myRange" type="range" min="250" max="3000" value="700" class="slider" >
                                                                    <p style="margin-bottom:0px;" data-toggle="tooltip" data-placement="bottom" title="ความเร็วการค้นหา">Times : <span ID="lbl_ms" runat="server"></span> ms</p>
                                                        </div>
                                                    </center>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!--  /#Start  -->
                                                <!--  Reset  -->
                                                <div class="col-lg-6 col-md-6 col-sm-6">
                                                    <div class="card" style="height: 85px;">
                                                        <div class="card-body">
                                                            <center>
                                                           <asp:Button runat="server" ID="btn_Start" OnClick="btn_Strat_ServerClick"  CssClass="btn btn-success btn-pill" Text="&ensp; Start &ensp;" data-toggle="tooltip" data-placement="top" title="เริ่มทำงาน"></asp:Button>
                                                            <asp:Button runat="server" ID="btn_Reset" OnClick="btn_Reset_ServerClick" CssClass="btn btn-danger btn-pill" Text="&ensp; Reset &ensp;" data-toggle="tooltip" data-placement="top" title="เริ่มใหม่"></asp:Button>
                                                    </center>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!--  /#Reset  -->
                                            </div>
                                        </div>
                                        <!-- /#Menu  -->
                                    </div>
                                </div>
                                <!--  /#RightPanel  -->
                            </div>
                            <!--  /Main -->
                        </div>
                        <!-- .animated -->
                    </div>
                    <!-- /.content -->
                </ContentTemplate>
            </asp:UpdatePanel>
            <div class="clearfix"></div>
            <!-- Footer -->
            <footer class="site-footer">
                <div class="footer-inner topbar">
                    <div class="row">
                        <div class="col-sm-6 TextFoot">
                            Copyright <span class="TextCoppy">&copy;</span> 2019
                        </div>
                        <div class="col-sm-6 text-right TextFoot">
                            Create By Generation1Studio Inc, CPE<span class="TextCoppy">#</span>8 RMUTI Korat.
                        </div>
                    </div>
                </div>
            </footer>
            <!-- /.site-footer -->
        </div>

        </div>
        <!-- /#Page -->
        <!-- Scripts -->

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>


        <script type="text/javascript">
            jQuery(document).ready(function () {
                jQuery('[data-toggle="tooltip"]').tooltip({ trigger: "hover" });
                jQuery('[data-toggle="tooltip"]').click(function () {
                    jQuery('[data-toggle="tooltip"]').tooltip("hide");
                });

                var slider = document.getElementById("myRange");
                var output = document.getElementById("lbl_ms");
                output.innerHTML = slider.value;
                slider.oninput = function () {
                    output.innerHTML = this.value;
                }
            });
        </script>
        <script type="text/javascript">
            jQuery(document).ready(function () {
                var ddl = document.getElementById('ddl_Source');
                var imgmap = document.getElementById('imgMap');

                // When a new <option> is selected
                ddl.addEventListener('change', function () {
                    var index = ddl.selectedIndex;
                    var x = ddl.value;
                    if (index == 0) {
                        imgmap.src = "images/MAP.png";
                    } else {
                        imgmap.src = "images/City/" + x + "/0.png";
                    }
                })
            });
        </script>
    </form>
</body>
</html>
