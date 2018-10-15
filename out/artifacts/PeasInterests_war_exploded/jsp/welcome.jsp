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
<style type="text/css">
    html,body {
        height: 100%
    }
    .keyword {
        margin: 2px 5px
    }
</style>
</head>
<body>
    <header>
        <div class="container">
            <ul class="nav nav-pills">
                <li class="active"><a href="#">Finance</a></li>
                <li><a href="#">Music</a></li>
            </ul>
        </div>
        <br />
    </header>
    <div id="main" class="container"></div>
    <script type="text/babel">
        class Finance extends React.Component {
            constructor(props) {
                super(props);
                this.state = {
                    accountId: 0,
                    inOutId: 0,
                    inOut: "出账",
                    paymentMethodId: 0,
                    paymentMethod: "",
                    paymentMethods: [],
                    money: 0,
                    keywords: ""
                };
                this.handleInputChange = this.handleInputChange.bind(this);
                this.handleSelectChange = this.handleSelectChange.bind(this);
                this.componentDidMount = this.componentDidMount.bind(this);
                this.keywordShow = this.keywordShow.bind(this);
                this.addKeyword = this.addKeyword.bind(this);
                this.addPayment = this.addPayment.bind(this);
            }

            handleInputChange(event) {
                const target = event.target;
                const value = target.value;
                const name = target.name;

                this.setState({
                    [name]: value
                });
            }

            handleSelectChange(event) {
                const target = event.target;
                const value = target.innerHTML;
                const name = target.name;
                const id = target.getAttribute("data-" + name + "Id");

                this.setState({
                    [name + "Id"] : id,
                    [name]: value
                });
            }

            keywordShow(show_hide, event) {
                let keywordDiv = this.refs.keywordDiv;
                keywordDiv.style.display = show_hide;
            }

            addKeyword(event) {
                console.info("hello");
                let _this = this;
                let value = event.target.value;
                _this.setState({
                    keywords: _this.state.keywords + value + ";"
                });
                this.state.keywords += value + ";";
            }


            addPayment() {
                let _this = this;
                let myHeaders = new Headers();
                myHeaders.append('Content-Type', 'application/x-www-form-urlencoded; charset=UTF-8; <%=request.getSession().getId()%>');
                let formData = "";
                formData += "accountId=" + _this.state.accountId;
                formData += "&inOutId=" + _this.state.inOutId;
                formData += "&paymentMethodId=" + _this.state.paymentMethodId;
                formData += "&money=" + _this.state.money;
                formData += "&keywords=" +  _this.state.keywords;

                let myInit = {
                    method: 'POST',
                    headers: myHeaders,
                    body: formData
                };
                fetch("finance/addPayment.form", myInit)
                    .then(function(response) {
                        let contentType = response.headers.get("content-type");
                        if (contentType && contentType.includes("application/json; charset=UTF-8")) {
                            return response.json();
                        }
                        throw new TypeError("Oops, we haven't got JSON!");
                    })
                    .then(function(json) {
                        _this.setState({
                            inOutId: 0,
                            inOut: "出账",
                            paymentMethodId: 0,
                            paymentMethod: _this.paymentMethods[0].name,
                            paymentMethods: _this.paymentMethods,
                            money: 0,
                            keywords: ""
                        });
                    })
                    .catch(function(error) { console.log(error); });
            }

            componentDidMount() {
                let _this = this;
                let myHeaders = new Headers();
                myHeaders.append('Content-Type', 'application/json;charset=UTF-8');
                let myInit = {
                    method: 'POST',
                    mode: 'cors',
                    headers: myHeaders
                };
                fetch("finance/getBasicData.form", myInit)
                    .then(function(response) {
                        let contentType = response.headers.get("content-type");
                        if (contentType && contentType.includes("application/json")) {
                            return response.json();
                        }
                        throw new TypeError("Oops, we haven't got JSON!");
                    })
                    .then(function(json) {
                        _this.setState({
                            paymentMethod: json.paymentMethods[0].name,
                            paymentMethods: json.paymentMethods
                        });
                    })
                    .catch(function(error) { console.log(error); });
            }

            render() {
                let _this = this;

                let paymentMethods = this.state.paymentMethods;
                let paymentMethods_li = "";
                if (paymentMethods.length > 0)
                    paymentMethods_li = paymentMethods.map(function(paymentMethod) {
                        return (
                                <li onClick={_this.handleSelectChange}>
                                    <a data-paymentMethodId={paymentMethod.paymentMethodId}
                                       name="paymentMethod" href="#">{paymentMethod.name}</a>
                                </li>
                        );
                    });
                return (<div>
                            <div className="form-inline  col-lg-4">
                                {/*入账出账下拉框*/}
                                <div className="btn-group">
                                    <input type="button" className="btn btn-default" value={this.state.inOut}/>
                                    <button type="button" className="btn btn-default dropdown-toggle" data-toggle="dropdown"
                                            aria-haspopup="true" aria-expanded="false">
                                        <span className="caret"></span>
                                    </button>
                                    <ul className="dropdown-menu" ref="consumption_type">
                                        <li onClick={this.handleSelectChange}><a name="inOut" data-inOutId="0" href="#">出账</a></li>
                                        <li onClick={this.handleSelectChange}><a name="inOut" data-inOutId="1" href="#">入账</a></li>
                                    </ul>
                                </div><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                {/*支付方式下拉框*/}
                                <div className="btn-group">
                                    <input type="button" className="btn btn-default" value={this.state.paymentMethod} />
                                    <button type="button" className="btn btn-default dropdown-toggle" data-toggle="dropdown"
                                            aria-haspopup="true" aria-expanded="false">
                                        <span className="caret"></span>
                                    </button>
                                    <ul className="dropdown-menu">
                                        {paymentMethods_li}
                                        <li role="separator" className="divider"></li>
                                        <li onClick={this.handleSelectChange}><a href="#">Add New</a></li>
                                    </ul>
                                </div><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                {/*金额*/}
                                <div className="input-group col-lg-4">
                                    <span className="input-group-addon">¥</span>
                                    <input type="text" className="form-control" name="money" onChange={this.handleInputChange} value={this.state.money}/>
                                </div>
                            </div>
                            <div className="col-lg-4">
                                <div className="input-group col-lg-12">
                                    <span className="input-group-addon" style={{width: "30px"}}>关键词</span>
                                    <input id="keywordInput" ref="keywordInput" type="text" className="form-control" name="keywords" value={this.state.keywords}
                                           onChange={this.handleInputChange}
                                           onFocus={this.keywordShow.bind(this, "block")} />
                                </div>
                                <div ref="keywordDiv" id="keywordDiv" style={{padding: "5px 10px", display: "none"}}> {/*onMouseOut={this.keywordShow.bind(this, "none")}*/}
                                    <input className="btn btn-default keyword" type="button" name="keyword" onClick={this.addKeyword} value="普餐" />
                                    <input className="btn btn-default keyword" type="button" name="keyword" onClick={this.addKeyword} value="聚餐" />
                                    <input className="btn btn-default keyword" type="button" name="keyword" onClick={this.addKeyword} value="电影" />
                                </div>
                            </div>
                            <div className="col-lg-1">
                                <input type="button" className="btn btn-primary" value="添加" onClick={this.addPayment}/>
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
<script>
    document.body.onclick = function(event) {
        var target = event.target;
        console.info(target);
        var keywordDiv = document.getElementById('keywordDiv');
        var keywordInput = document.getElementById('keywordInput');
        if(target != keywordDiv && target != keywordInput && target.name != "keyword"){
            document.getElementById('keywordDiv').style.display = 'none';
        }
    }
</script>
</html>
