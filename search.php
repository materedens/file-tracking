<?php
session_start();
error_reporting(0);
include('inc/config.php');
require_once 'inc/functions.php';

if (isset($_REQUEST["search"])) {
    // Prepare a select statement
    $sql = "SELECT * FROM files WHERE fileNo LIKE ?";

    if ($stmt = $con->prepare($sql)) {
        // Bind variables to the prepared statement as parameters
        $stmt->bind_param("s", $param_term);

        // Set parameters
        $param_term = '%' . $_REQUEST["search"] . '%';

        // Attempt to execute the prepared statement
        if ($stmt->execute()) {
            $result = $stmt->get_result();

            // Check number of rows in the result set
            if ($result->num_rows > 0) {
                // Fetch result rows as an associative array
                while ($row = $result->fetch_array(MYSQLI_ASSOC)) {
                    echo "<p>" . $row["fileNo"] . "</p>";
                }
            } else {
                echo "<p>No matches found</p>";
            }
        } else {
            echo "ERROR: Could not able to execute $sql. " . mysqli_error($link);
        }
    }

    // Close statement
    $stmt->close();
}

// Close connection
$con->close();

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="au theme template">
    <meta name="author" content="Hau Nguyen">
    <meta name="keywords" content="au theme template">

    <!-- Title Page-->
    <title>Search Files</title>

    <!-- Fontfaces CSS-->
    <link href="css/font-face.css" rel="stylesheet" media="all">
    <link href="vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <link href="vendor/font-awesome-5/css/fontawesome-all.min.css" rel="stylesheet" media="all">
    <link href="vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">

    <!-- Bootstrap CSS-->
    <link href="vendor/bootstrap-4.1/bootstrap.min.css" rel="stylesheet" media="all">

    <!-- Vendor CSS-->
    <link href="vendor/animsition/animsition.min.css" rel="stylesheet" media="all">
    <link href="vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet" media="all">
    <link href="vendor/wow/animate.css" rel="stylesheet" media="all">
    <link href="vendor/css-hamburgers/hamburgers.min.css" rel="stylesheet" media="all">
    <link href="vendor/slick/slick.css" rel="stylesheet" media="all">
    <link href="vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="vendor/perfect-scrollbar/perfect-scrollbar.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="css/custom.css" rel="stylesheet" media="all">
    <!--add icon link -->
    <link rel="shortcut icon" type="image/x-icon" href="./images/logo.jpg">

</head>

<body class="animsition">
    <div class="page-wrapper">
        <!-- MENU SIDEBAR-->
        <aside class="menu-sidebar d-none d-lg-block">
            <div class="logo">

                <h2>FTS</h2>
            </div>
            <div class="menu-sidebar__content js-scrollbar1">
                <nav class="navbar-sidebar">
                    <ul class="list-unstyled navbar__list">
                        <li>
                            <a href="user.php" style="color: blue">
                                <i class="fas fa-tachometer-alt"></i>Dashboard</a>
                        </li>
                        <li>
                            <a href="user.php" style="color: blue">
                                <i class="fa fa-file"></i>Add Files</a>
                        </li>
                        <li>
                            <a href="files.php" style="color: blue">
                                <i class="fa fa-file"></i>View Files</a>
                        </li>

                        <li>
                            <a href="search.php" style="color: blue">
                                <i class="fas fa-search"></i>Search</a>
                        </li>
                        <li>
                            <a href="logout.php" style="color: blue">
                                <i class="fas fa-sign-out-alt"></i>Logout</a>
                        </li>

                    </ul>
                </nav>
            </div>
        </aside>
        <!-- END MENU SIDEBAR-->

        <!-- PAGE CONTAINER-->
        <div class="page-container">
            <!-- HEADER DESKTOP-->
            <header class="header-desktop">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                        <div class="header-wrap">
                            <form class="form-header" name="search" action="search-visitor.php" method="post">

                            </form>
                            <div class="header-button">
                                <div class="noti-wrap">
                                    <?php
                                    $role = $_SESSION['role'];
                                    $ret = mysqli_query($con, "select fullName from user where role='$role'");
                                    $row = mysqli_fetch_array($ret);
                                    $name = $row['fullName'];

                                    ?>

                                </div>
                                <div class="account-wrap">
                                    <div class="account-item clearfix js-item-menu">
                                        <div class="image">
                                            <img src="./images/logo.jpg" alt="FTS" />
                                        </div>
                                        <div class="content">
                                            <a class="js-acc-btn" href="#"><b> Welcome: &nbsp;</b><?php echo $name; ?></a>
                                        </div>
                                        <div class="account-dropdown js-dropdown">
                                            <div class="info clearfix">
                                                <div class="image">
                                                    <div class="image">
                                                        <img src="./images/logo.jpg" alt="FTS" />
                                                    </div>
                                                </div>
                                                <div class="content">
                                                    <h5 class="name">
                                                        <a href="#"><b> Welcome: &nbsp;</b><?php echo $name; ?></a>
                                                    </h5>

                                                </div>
                                            </div>
                                            <div class="account-dropdown__body">
                                                <!-- <div class="account-dropdown__item">
                                        <a href="profile.php">
                                            <i class="zmdi zmdi-account"></i>Profile</a>
                                    </div> -->
                                                <div class="account-dropdown__item">
                                                    <a href="changepassword.php">
                                                        <i class="zmdi zmdi-settings"></i>Change Password</a>
                                                </div>

                                            </div>
                                            <div class="account-dropdown__footer">
                                                <a href="logout.php">
                                                    <i class="zmdi zmdi-power"></i>Logout</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </header>
            <!-- HEADER DESKTOP-->

            <!-- MAIN CONTENT-->
            <div class="main-content">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-8 offset-md-2">
                                <div class="card">
                                    <div class="card-header">Search Files</div>
                                    <p style="padding-left: 1%; color: green">
                                        <?php if ($msg) {
                                            echo htmlentities($msg);
                                        } ?>
                                    </p>
                                    <p style="padding-left:4%; padding-top:2%;  color:red">
                                        <?php if ($errormsg) {
                                            echo $errormsg;
                                        } ?></p>
                                    <div class="card-body card-block">
                                        <form action="" method="POST" name="search">
                                            <div class="form-group">

                                                <input type="text" name="search" placeholder="File Number" class="form-control" required>
                                            </div>

                                            <br>
                                            <div class="form-actions form-group">
                                                <button type="submit" name="search" class="btn btn-lg btn-info btn-block">Search</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <?php include_once('inc/footer.php'); ?>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Jquery JS-->
    <script src="vendor/jquery-3.2.1.min.js"></script>
    <!-- Bootstrap JS-->
    <script src="vendor/bootstrap-4.1/popper.min.js"></script>
    <script src="vendor/bootstrap-4.1/bootstrap.min.js"></script>
    <!-- Vendor JS       -->
    <script src="vendor/slick/slick.min.js">
    </script>
    <script src="vendor/wow/wow.min.js"></script>
    <script src="vendor/animsition/animsition.min.js"></script>
    <script src="vendor/bootstrap-progressbar/bootstrap-progressbar.min.js">
    </script>
    <script src="vendor/counter-up/jquery.waypoints.min.js"></script>
    <script src="vendor/counter-up/jquery.counterup.min.js">
    </script>
    <script src="vendor/circle-progress/circle-progress.min.js"></script>
    <script src="vendor/perfect-scrollbar/perfect-scrollbar.js"></script>
    <script src="vendor/chartjs/Chart.bundle.min.js"></script>
    <script src="vendor/select2/select2.min.js">
    </script>

    <!-- Main JS-->
    <script src="js/main.js"></script>

</body>

</html>