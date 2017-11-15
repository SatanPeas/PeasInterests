<%--
  Created by IntelliJ IDEA.
  User: SatanPeas
  Date: 2017/11/6
  Time: 21:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/jsp/common.jsp"%>
<html>
<head>

</head>
<body>
    <header>
        <div class="container">
            <ul class="nav nav-pills">
                <li class="active"><a href="#">Finance</a></li>
                <li><a href="#">Music</a></li>
            </ul>
        </div>
    </header>
    <div id="main" class="container"></div>
    <script type="text/babel">
        class Finance extends React.Component {
            constructor(props) {
                super(props);
                this.state = {
                    consumptionType: "Hello",
                    money: "",
                    backup: ""
                };
                this.handleInputChange = this.handleInputChange.bind(this);
                this.changeConsumptionType = this.changeConsumptionType.bind(this);
                this.componentDidMount = this.componentDidMount.bind(this);
            }

            handleInputChange(event) {
                const target = event.target;
                const value = target.value;
                const name = target.name;

                this.setState({
                    [name]: value
                });
            }

            changeConsumptionType(event) {
                const target = event.target;
                const value = target.innerHTML;
                this.setState({
                    consumptionType: value
                });
            }

            componentDidMount() {

                /*let name = this.state.name;
                let pwd = this.state.password;

                let myHeaders = new Headers();
                myHeaders.append('Content-Type', 'application/json;charset=UTF-8');
                let data = {
                    name: name,
                    pwd: pwd
                };
                let myInit = {
                    method: 'POST',
                    mode: 'cors',
                    headers: myHeaders,
                    body: JSON.stringify(data)
                };

                fetch("login.form", myInit)
                  .then(function(response) {
                    var contentType = response.headers.get("content-type");
                    if (contentType && contentType.includes("application/json")) {
                        return response.json();
                    }
                    throw new TypeError("Oops, we haven't got JSON!");
                  })
                  .then(function(json) {
                    console.info(json);
                  })
                  .catch(function(error) { console.log(error); });*/

            };

            render() {
                return (
                    <div className="row">
                        <div className="btn-group">
                            <input ref="consumption_type_show" type="button" className="btn btn-default" value={this.state.consumptionType} />
                            <button ref="consumption_type_arrow" type="button" className="btn btn-default dropdown-toggle" data-toggle="dropdown"
                                    aria-haspopup="true" aria-expanded="false">
                                <span className="caret"></span>
                            </button>
                            <ul className="dropdown-menu" ref="consumption_type">
                                <li onClick={this.changeConsumptionType}><a href="#" >Action</a></li>
                                <li onClick={this.changeConsumptionType}><a href="#">Another action</a></li>
                                <li onClick={this.changeConsumptionType}><a href="#">Something else here</a></li>
                                <li role="separator" className="divider"></li>
                                <li onClick={this.changeConsumptionType}><a href="#">Separated link</a></li>
                            </ul>
                        </div>
                    </div>
                );
            }
        }

        ReactDOM.render(
            <Finance />,
            document.getElementById('main')
        );
    </script>
    <h1>Hello ${param.name}</h1>
</body>
</html>
