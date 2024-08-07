
<%@page import="java.sql.Connection"%>
<%@page import = "com.db.DbConn" %>
<html>
<head>

<style type="text/css">
.paint-card {

    box-shadow : 0 0 10px 0 rgba(0,0,0,0.3);
}

</style>

</head>
<body>
<%@include file = "component/navbar.jsp" %>


<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block w-100" src="Images/host1.jpg" alt="First slide" height = "700px">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="Images/host2.jpg" alt="Second slide" height = "700px">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="Images/host3.jpg" alt="Third slide" height = "700px">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
<hr>

<div class="container p-3">
<h5 class="text-center fs-1 fw-bold">Key Features of our Hospital</h5>
    <div class="row">
        <div class="col-md-8 p-5">
            <div class="row">
                <div class="col-md-6">
                    <div class="card paint-card shadow">
                        <div class="card-body">
                            <h6 class="fs-5">100% Safety</h6>
            <p>Ensuring a secure environment with top-notch safety protocols.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card paint-card shadow">
                        <div class="card-body">
                            <h6 class="fs-5">Clean Environment</h6>
            <p>Maintaining high standards of cleanliness and hygiene.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 mt-2">
                    <div class="card paint-card shadow">
                        <div class="card-body">
                            <h6 class="fs-5">Friendly Doctors</h6>
            <p>Compassionate and approachable doctors providing personalized care.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 mt-2">
                    <div class="card paint-card shadow">
                        <div class="card-body">
                            <h6 class="fs-5">Medical Research</h6>
            <p>Advancing medical knowledge through continuous research.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <img alt="Hospital Image" src="Images/indexdoct.jpg" height="400px" width="500px">
        </div>
    </div>
</div>
<hr>


<div class="container p-2">
    <h3 class="text-center fs-2">Our Team</h3>
    <div class="row">
        <div class="col-md-3">
            <div class="card point-card">
                <div class="card-body text-center">
                    <img src="Images/male1.jpg" width="200px" height="300px">
                    <p class="fw-bold fs-5"></p>
                    <h6 class="fs-7">Dr.Sameer Shaikh(MBBS)</h6>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card point-card">
                <div class="card-body text-center">
                    <img src="Images/male2.jpg" width="200px" height="300px">
                    <p class="fw-bold fs-5"></p>
                    <h6 class="fs-7">Dr.Kiran Pawar (MD) </h6>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card point-card">
                <div class="card-body text-center">
                    <img src="Images/female1.jpg" width="200px" height="300px">
                    <p class="fw-bold fs-5"></p>
                    <h6 class="fs-7">Dr.Yasmin Mujawar (BDS) </h6>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card point-card">
                <div class="card-body text-center">
                    <img src="Images/female2.jpg" width="200px" height="300px">
                    <p class="fw-bold fs-5"></p>
                    <h6 class="fs-7">Dr.Rutuja Chorgi (MS) </h6>
                </div>
            </div>
        </div>  
    </div>
    </div>
    
  <%@ include file = "component/footer.jsp" %> 
</body>
</html>
